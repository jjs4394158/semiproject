package com.icia.semi.dto;

import java.sql.Date;

public class Reserv {
    private int rNum;
    private String rid;
    private String name;
    private String email;
    private String phone;
    private String event;
    private String rAddr;  
    private String message;
    private int price;
    private Date rDate;  

    // Getters and Setters
    public int getRNum() {
        return rNum;
    }

    public void setRNum(int rNum) {
        this.rNum = rNum;
    }

    public String getRid() {
        return rid;
    }

    public void setRid(String rid) {
        this.rid = rid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEvent() {
        return event;
    }

    public void setEvent(String event) {
        this.event = event;
    }

    public String getRAddr() {
        return rAddr;
    }

    public void setRAddr(String rAddr) {
        this.rAddr = rAddr;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Date getRDate() {
        return rDate;
    }

    public void setRDate(Date rDate) {
        this.rDate = rDate;
    }
}
