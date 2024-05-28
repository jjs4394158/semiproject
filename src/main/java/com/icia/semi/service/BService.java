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

import com.icia.semi.dao.BDao;
import com.icia.semi.dao.CDao;
import com.icia.semi.dto.Board;
import com.icia.semi.dto.Paging;
import com.icia.semi.dto.Search;

@Service
public class BService {

    private ModelAndView mav;
    @Autowired
    private CDao cdao;
    
    @Autowired
    private BDao bdao;
    
    @Autowired
    private HttpServletRequest request;

    // 파일 저장 경로를 반환하는 메서드
    public String savePath() {
        String path = request.getSession().getServletContext().getRealPath("/resources/fileUpload/");
        System.out.println("Save Path: " + path); // 경로 출력
        return path;
    }

    public ModelAndView bWrite(Board board) {
        mav = new ModelAndView();
        MultipartFile bFile = board.getBFile();

        if (!bFile.getOriginalFilename().isEmpty()) {
            UUID uuid = UUID.randomUUID();
            String bFileName = uuid.toString().substring(0, 8) + "_" + bFile.getOriginalFilename();
            board.setBFileName(bFileName);
            String savePath = savePath(); // 경로 메서드 사용

            try {
                File file = new File(savePath + bFileName);
                bFile.transferTo(file);
                System.out.println("File saved to: " + file.getAbsolutePath()); // 파일 저장 경로 출력
            } catch (IllegalStateException | IOException e) {
                e.printStackTrace();
                mav.setViewName("board/write");
                mav.addObject("message", "파일 업로드에 실패했습니다.");
                return mav;
            }
        } else {
            board.setBFileName("default.png");
        }

        try {
            bdao.bWrite(board);
            mav.setViewName("redirect:/bList");
        } catch(Exception e) {
            e.printStackTrace();
            mav.setViewName("board/write");
            mav.addObject("message", "글쓰기 등록에 실패했습니다. 원인: " + e.getMessage());
        }
        return mav;
    }


    public ModelAndView bView(int bNum) {
        mav = new ModelAndView();

        try {
            bdao.bCount(bNum);
            Board board = bdao.bView(bNum);
            if (board.isReported()) {
                mav.setViewName("board/reported");
            } else {
                mav.addObject("view", board);
                mav.setViewName("board/view");
            }
        } catch (Exception e) {
            mav.setViewName("index");
        }

        return mav;
    }

    public ModelAndView modifyForm(int bNum) {
        mav = new ModelAndView();
        Board board = bdao.bView(bNum);
        mav.addObject("modify", board);
        mav.setViewName("board/modify");
        return mav;
    }

    public ModelAndView bModify(Board board) {
        mav = new ModelAndView();
        String delFileName = board.getBFileName();
        MultipartFile bFile = board.getBFile();

        if (!bFile.getOriginalFilename().isEmpty()) {
            UUID uuid = UUID.randomUUID();
            String bFileName = uuid.toString().substring(0, 8) + "_" + bFile.getOriginalFilename();
            String savePath = savePath(); // 경로 메서드 사용

            try {
                File file = new File(savePath + bFileName);
                bFile.transferTo(file);
                System.out.println("File saved to: " + file.getAbsolutePath()); // 파일 저장 경로 출력

                File delFile = new File(savePath + delFileName);
                if (delFile.exists() && !delFileName.equals("default.png")) {
                    delFile.delete();
                }
                
                board.setBFileName(bFileName);
            } catch (IllegalStateException | IOException e) {
                e.printStackTrace();
                mav.setViewName("board/modify");
                mav.addObject("message", "파일 업로드에 실패했습니다.");
                return mav;
            }
        } else {
            board.setBFileName("default.png");
        }

        try {
            bdao.bModify(board);
            mav.setViewName("redirect:/bView?bNum=" + board.getBNum());
        } catch(Exception e) {
            e.printStackTrace();
            mav.setViewName("board/modify");
            mav.addObject("message", "글 수정에 실패했습니다.");
        }
        
        return mav;
    }

    public ModelAndView bDelete(Board board) {
        mav = new ModelAndView();
        
        try {
        	cdao.bcDelete(board.getBNum());
        } catch (Exception e) {
        	System.out.println("댓글 삭제중 예외 발생 무시");
        }
        
        bdao.bDelete(board.getBNum());

        try {
            String savePath = savePath(); // 경로 메서드 사용
            File delFile = new File(savePath + board.getBFileName());

            if (delFile.exists() && !board.getBFileName().equals("default.png")) {
                delFile.delete();
            }

            mav.setViewName("redirect:/bList");
        } catch(Exception e) {
            e.printStackTrace();
            mav.setViewName("redirect:/bView?bNum=" + board.getBNum());
            mav.addObject("message", "글 삭제에 실패했습니다.");
        }
        
        return mav;
    }

    public ModelAndView bList(int page, int limit) {
        mav = new ModelAndView();
        int block = 5;
        int count = bdao.bCtn();
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

        List<Board> pagingList = bdao.bList(paging);
        mav.setViewName("board/list");
        mav.addObject("boardList", pagingList);
        mav.addObject("paging", paging);

        return mav;
    }

    public ModelAndView bSearch(Search search) {
        mav = new ModelAndView();
        List<Board> searchList = bdao.bSearch(search);

        if (!search.getKeyword().isEmpty()) {
            mav.addObject("boardList", searchList);
        }

        mav.addObject("pages", 0);
        mav.setViewName("board/list");

        return mav;
    }

    public int likePost(int bNum, String userId) throws Exception {
        Optional<Integer> existingLike = bdao.checkUserLike(bNum, userId);
        if (existingLike.isPresent()) {
            throw new Exception("이미 추천을 하셨습니다.");
        }
        bdao.addUserLike(bNum, userId);
        bdao.incrementLikeCount(bNum);
        return bdao.getLikeCount(bNum);
    }

 
    public ModelAndView reportPost(int bNum) {
        ModelAndView mav = new ModelAndView();
        try {
            bdao.reportPost(bNum);
            mav.setViewName("reported"); // 성공 시 이동할 JSP 파일 이름 설정 (reported.jsp)
            mav.addObject("status", "success");
            
            System.out.println("2 bNum = " + bNum);
        } catch (Exception e) {
            mav.setViewName("error"); // 에러 페이지로 이동
            mav.addObject("status", "error");
            mav.addObject("message", e.getMessage());
        }
        return mav;
    }
}
