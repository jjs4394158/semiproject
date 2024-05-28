package com.icia.semi.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.icia.semi.dao.MDao;
import com.icia.semi.dto.Member;
import com.icia.semi.dto.Paging;
import com.icia.semi.dto.Search;

@Service
public class MService {
    @Autowired
    private MDao mdao;

    @Autowired
    private BCryptPasswordEncoder pwEnc;

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private HttpSession session;

    private ModelAndView mav;

    public String savePath() {
		return request.getServletContext().getRealPath("src/main/webapp/resources/profile/")
				.replace(".metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\", "");
	}

    public String idCheck(String mId) {
        String result = null;

        String checkId = mdao.idCheck(mId);

        if (checkId == null) {
            result = "OK";
        } else {
            result = checkId;
        }

        return result;
    }

    public ModelAndView mJoin(Member member) {
        mav = new ModelAndView();
        member.setMPw(pwEnc.encode(member.getMPw()));

        // 기본 포인트 설정
        member.setMpoints(1000);

        String mAddr = "(" + member.getAddr1() + ")" + member.getAddr2() + ", " + member.getAddr3();
        member.setMAddr(mAddr);

        MultipartFile mProfile = member.getMProfile();
        String savePath = savePath();

        if (!mProfile.isEmpty()) {
            String uuid = UUID.randomUUID().toString().substring(0, 8);
            String fileName = mProfile.getOriginalFilename();
            String mProfileName = uuid + "_" + fileName;
            member.setMProfileName(mProfileName);

            try {
                mProfile.transferTo(new File(savePath + mProfileName));
            } catch (IllegalStateException | IOException e) {
                e.printStackTrace();
            }
        } else {
            member.setMProfileName("default.jpg");
        }

        try { // 회원가입 성공
            mdao.mJoin(member);
            System.out.println("[4]dao → service : 회원가입 성공");
            mav.setViewName("member/login");
        } catch (Exception e) { // 회원가입 실패
            System.out.println("[4]dao → service : 회원가입 실패");
            mav.setViewName("member/join");
        }

        return mav;
    }

    public ModelAndView mLogin(Member member) {
        mav = new ModelAndView();
        Member login = mdao.mView(member.getMId());

        if (pwEnc.matches(member.getMPw(), login.getMPw())) {
            mav.setViewName("index");

            session.setAttribute("loginId", login.getMId());
            session.setAttribute("loginProfile", login.getMProfileName());
            session.setAttribute("loginName", login.getMName());
            session.setAttribute("mpoints", login.getMpoints());
        } else {
            mav.setViewName("member/login");
        }

        return mav;
    }

    public ModelAndView mList(int page, int limit) {
        mav = new ModelAndView();
        int block = 5;
        int count = mdao.mCount();
        int maxPage = (int) Math.ceil((double) count / limit);
        int startRow = (page - 1) * limit + 1;
        int endRow = page * limit;
        int startPage = ((int) Math.ceil((double) page / block) - 1) * block + 1;
        int endPage = startPage + block - 1;

        if (endPage >= maxPage) {
            endPage = maxPage;
        }

        Paging paging = new Paging();
        paging.setStartRow(startRow);
        paging.setEndRow(endRow);
        paging.setPage(page);
        paging.setMaxPage(maxPage);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setLimit(limit);

        List<Member> memberList = mdao.mList(paging);

        mav.addObject("memberList", memberList);
        mav.addObject("paging", paging);
        mav.setViewName("member/list");

        return mav;
    }

    public ModelAndView mSearch(Search search) {
        mav = new ModelAndView();
        List<Member> searchList = mdao.mSearch(search);
        mav.addObject("memberList", searchList);
        mav.setViewName("member/list");
        return mav;
    }

    public ModelAndView mView(String mId) {
        mav = new ModelAndView();
        Member member = mdao.mView(mId);
        mav.addObject("view", member);
        mav.setViewName("member/view");
        return mav;
    }

    public ModelAndView mModiForm(String mId) {
        mav = new ModelAndView();
        Member member = mdao.mView(mId);
        mav.addObject("modify", member);
        mav.setViewName("member/modify");
        return mav;
    }

    public ModelAndView mModify(Member member) {
        mav = new ModelAndView();
        member.setMPw(pwEnc.encode(member.getMPw()));

        String mAddr = "(" + member.getAddr1() + ")" + member.getAddr2() + ", " + member.getAddr3();
        member.setMAddr(mAddr);

        MultipartFile mProfile = member.getMProfile();
        String savePath = savePath();

        if (!mProfile.isEmpty()) {
            String uuid = UUID.randomUUID().toString().substring(0, 8);
            String fileName = mProfile.getOriginalFilename();
            String mProfileName = uuid + "_" + fileName;

            try {
                mProfile.transferTo(new File(savePath + mProfileName));

                // 삭제할 파일
                File delFile = new File(savePath + member.getMProfileName());

                if (delFile.exists() && !member.getMProfileName().equals("default.jpg")) {
                    if (delFile.delete()) {
                        System.out.println(member.getMProfileName() + " 파일 삭제 성공!");
                    } else {
                        System.out.println(member.getMProfileName() + " 파일 삭제 실패!");
                    }
                }
                member.setMProfileName(mProfileName);

            } catch (IllegalStateException | IOException e) {
                e.printStackTrace();
            }
        } else {
            member.setMProfileName("default.jpg");
        }

        try {
            mdao.mModify(member);
            mav.setViewName("redirect:/mView?mId=" + member.getMId());
        } catch (Exception e) {
            mav.setViewName("redirect:/mModiForm?mId=" + member.getMId());
        }

        return mav;
    }

    public ModelAndView mDelete(String mId, String mProfileName) {
        mav = new ModelAndView();

        try {
            mdao.mDelete(mId);
            mav.setViewName("redirect:/index");

            // 삭제할 파일
            File delFile = new File(savePath() + mProfileName);

            if (delFile.exists() && !mProfileName.equals("default.jpg")) {
                if (delFile.delete()) {
                    System.out.println(mProfileName + " 파일 삭제 성공!");
                } else {
                    System.out.println(mProfileName + " 파일 삭제 실패!");
                }
            }

        } catch (Exception e) {
            mav.setViewName("redirect:/mView?mId=" + mId);
        }

        return mav;
    }
    
    public ModelAndView pUp(String mId) {
		System.out.println("[2] 컨트 -> 서비스: " + mId);
		ModelAndView mav = new ModelAndView();
		Member point = mdao.mView(mId);
		try {
			mdao.pUp(mId);
			mav.setViewName("point/check");
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("errorPage");
		}
		session.setAttribute("mpoints", point.getMpoints());
		return mav;
	}
}
