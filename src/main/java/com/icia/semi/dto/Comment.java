package com.icia.semi.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Comment {
	private int cNum;          // 댓글 번호(SEQ)
    private int cbNum;         // 게시글 번호(BOARDDTO)
    private String cWriter;    // 댓글 작성자(MEMBERDTO)
    private String cContents;  // 댓글 내용
    private Date cDate;        // 댓글 작성일(SYSDATE)
    private boolean cSecret;   // 비밀 댓글 여부 추가
    private int likes;         // 좋아요 수 추가

}
