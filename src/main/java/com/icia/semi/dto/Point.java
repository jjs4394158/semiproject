package com.icia.semi.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Point {
		private String mId;
	    private Date checkDate;
	    private int points;
	    
	    public Point() {}

	    public Point(String mId, Date checkDate, int points) {
	        this.mId = mId;
	        this.checkDate = checkDate;
	        this.points = points;
	    }
}
