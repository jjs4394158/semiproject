package com.icia.semi.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Member {
	private String mId;		
	private String mPw;
	private String mName;
	private String mBirth;
	private String mGender;
	private String mEmail;
	private String mPhone;
	private String mAddr;
	private String mProfileName;
	private int mpoints;
	
	private String addr1;
	private String addr2;
	private String addr3;	
	private MultipartFile mProfile;
}
