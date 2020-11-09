package com.hk.saeyan.dto;

import java.util.Date;

public class ReviewComment {
	int r_no;
	int rcom_no;
	String r_id;
	String snum;
	String rcom_content;
	Date rcom_date;
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public int getRcom_no() {
		return rcom_no;
	}
	public void setRcom_no(int rcom_no) {
		this.rcom_no = rcom_no;
	}
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
	}
	public String getSnum() {
		return snum;
	}
	public void setSnum(String snum) {
		this.snum = snum;
	}
	public String getRcom_content() {
		return rcom_content;
	}
	public void setRcom_content(String rcom_content) {
		this.rcom_content = rcom_content;
	}
	public Date getRcom_date() {
		return rcom_date;
	}
	public void setRcom_date(Date rcom_date) {
		this.rcom_date = rcom_date;
	}
	@Override
	public String toString() {
		return "ReviewComment [r_no=" + r_no + ", rcom_no=" + rcom_no + ", r_id=" + r_id + ", snum=" + snum
				+ ", rcom_content=" + rcom_content + ", rcom_date=" + rcom_date + "]";
	}
	
	
}
