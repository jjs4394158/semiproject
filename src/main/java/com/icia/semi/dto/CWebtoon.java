package com.icia.semi.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CWebtoon {
	private int cwNum;						// 도전 웹툰 번호
	
	private String cwTitle;					// 도전 웹툰 제목
	private String cwWriter;					// 도전 웹툰 작가 <게시물 작성자 아이디>
	private Date cwDate;					// 게시물 작성 시간
	
	private MultipartFile cwFile;			// 도전 웹툰 그림 파일
	private String cwFileName;				// 도전 웹툰 그림 이름
	
	private String cwContents;				// 작가의 말
	private int cwHit;						// 도전웹툰 조회수
	private int cwLikes;					// 좋아요 수

}
