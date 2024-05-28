package com.icia.semi.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Board {
	private int bNum;
	private String bWriter;
	private String bTitle;
	private String bContents;
	private Date bDate;
	private int bHit;
	private int bLikes;  // 추가: 좋아요 수
	private boolean reported; // 신고 상태를 저장할 속성

	
	
	private MultipartFile bFile;
	private String bFileName;
}
