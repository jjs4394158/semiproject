package com.icia.semi.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.icia.semi.dao.CWDao;
import com.icia.semi.dto.CWebtoon;
import com.icia.semi.dto.Paging;
import com.icia.semi.dto.Search;

@Service
public class CWebtoonService {

    private ModelAndView mav;

    @Autowired
    private CWDao cwdao;
    
    @Autowired
    private HttpServletRequest request;

    // 파일 저장 경로를 반환하는 메서드
    public String savePath() {
        String path = request.getSession().getServletContext().getRealPath("/resources/fileUpload/");
        System.out.println("Save Path: " + path); // 경로 출력
        return path;
    }

    public ModelAndView cwWrite(CWebtoon cwebtoon) {
        mav = new ModelAndView();
        MultipartFile cwFile = cwebtoon.getCwFile();

        if (!cwFile.getOriginalFilename().isEmpty()) {
            UUID uuid = UUID.randomUUID();
            String cwFileName = uuid.toString().substring(0, 8) + "_" + cwFile.getOriginalFilename();
            cwebtoon.setCwFileName(cwFileName);
            String savePath = savePath(); // 경로 메서드 사용

            try {
                File file = new File(savePath + cwFileName);
                cwFile.transferTo(file);
                System.out.println("File saved to: " + file.getAbsolutePath()); // 파일 저장 경로 출력
            } catch (IllegalStateException | IOException e) {
                e.printStackTrace();
                mav.setViewName("cwebtoon/write");
                mav.addObject("message", "파일 업로드에 실패했습니다.");
                return mav;
            }
        } else {
        	cwebtoon.setCwFileName("default.png");
        }

        try {
            cwdao.cwWrite(cwebtoon);
            mav.setViewName("redirect:/cwList");
        } catch(Exception e) {
            e.printStackTrace();
            mav.setViewName("cwebtoon/write");
            mav.addObject("message", "글쓰기 등록에 실패했습니다. 원인: " + e.getMessage());
        }
        return mav;
    }


    public ModelAndView cwView(int cwNum) {
        mav = new ModelAndView();

        try {
            cwdao.cwCount(cwNum);
            CWebtoon cwebtoon = cwdao.cwView(cwNum);
            mav.addObject("view", cwebtoon);
            mav.setViewName("cwebtoon/view");
        } catch(Exception e) {
            e.printStackTrace();
            mav.setViewName("index");
            mav.addObject("message", "글 상세보기에 실패했습니다.");
        }
        
        return mav;
    }

    public ModelAndView modifyForm(int cwNum) {
        mav = new ModelAndView();
        CWebtoon cwebtoon = cwdao.cwView(cwNum);
        mav.addObject("modify", cwebtoon);
        mav.setViewName("cwebtoon/modify");
        return mav;
    }

    public ModelAndView cwModify(CWebtoon cwebtoon) {
        mav = new ModelAndView();
        String delFileName = cwebtoon.getCwFileName();
        MultipartFile cwFile = cwebtoon.getCwFile();

        if (!cwFile.getOriginalFilename().isEmpty()) {
            UUID uuid = UUID.randomUUID();
            String cwFileName = uuid.toString().substring(0, 8) + "_" + cwFile.getOriginalFilename();
            String savePath = savePath(); // 경로 메서드 사용

            try {
                File file = new File(savePath + cwFileName);
                cwFile.transferTo(file);
                System.out.println("File saved to: " + file.getAbsolutePath()); // 파일 저장 경로 출력

                File delFile = new File(savePath + delFileName);
                if (delFile.exists() && !delFileName.equals("default.png")) {
                    delFile.delete();
                }
                
                cwebtoon.setCwFileName(cwFileName);
            } catch (IllegalStateException | IOException e) {
                e.printStackTrace();
                mav.setViewName("cwebtoon/modify");
                mav.addObject("message", "파일 업로드에 실패했습니다.");
                return mav;
            }
        } else {
        	cwebtoon.setCwFileName("default.png");
        }

        try {
            cwdao.cwModify(cwebtoon);
            mav.setViewName("redirect:/cwView?cwNum=" + cwebtoon.getCwNum());
        } catch(Exception e) {
            e.printStackTrace();
            mav.setViewName("cwebtoon/modify");
            mav.addObject("message", "글 수정에 실패했습니다.");
        }
        
        return mav;
    }

    public ModelAndView cwDelete(CWebtoon cwebtoon) {
        mav = new ModelAndView();
        cwdao.cwDelete(cwebtoon.getCwNum());

        try {
            String savePath = savePath(); // 경로 메서드 사용
            File delFile = new File(savePath + cwebtoon.getCwFileName());

            if (delFile.exists() && !cwebtoon.getCwFileName().equals("default.png")) {
                delFile.delete();
            }

            mav.setViewName("redirect:/cwList");
        } catch(Exception e) {
            e.printStackTrace();
            mav.setViewName("redirect:/cwView?cwNum=" + cwebtoon.getCwNum());
            mav.addObject("message", "글 삭제에 실패했습니다.");
        }
        
        return mav;
    }

    public ModelAndView cwList(int page, int limit) {
        mav = new ModelAndView();
        int block = 5;
        int count = cwdao.cwCtn();
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

        List<CWebtoon> pagingList = cwdao.cwList(paging);
        mav.setViewName("cwebtoon/list");
        mav.addObject("cwebtoonList", pagingList);
        mav.addObject("paging", paging);

        return mav;
    }

    public ModelAndView cwSearch(Search search) {
        mav = new ModelAndView();
        List<CWebtoon> searchList = cwdao.cwSearch(search);

        if (!search.getKeyword().isEmpty()) {
            mav.addObject("cwebtoonList", searchList);
        }

        mav.addObject("pages", 0);
        mav.setViewName("cwebtoon/list");

        return mav;
    }

    public int likeCwPost(int cwNum, String userId) throws Exception {
        Optional<Integer> existingLike = cwdao.checkUserLike(cwNum, userId);
        if (existingLike.isPresent()) {
            throw new Exception("이미 추천을 하셨습니다.");
        }
        cwdao.addUserLike(cwNum, userId);
        cwdao.incrementLikeCount(cwNum);
        return cwdao.getLikeCount(cwNum);
    }

 
    public void reportCwPost(int cwNum) {
        cwdao.reportPost(cwNum);
    }
}
