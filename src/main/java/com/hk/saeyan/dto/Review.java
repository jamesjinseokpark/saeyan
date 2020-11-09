package com.hk.saeyan.dto;

import java.util.Date;

public class Review {

	String w_id;
	String orderNum;
	String snum;
	String r_content;
	String star;
	int badCnt;
	Date r_date;
	String depth;
	int r_no;
	
	public String getW_id() {
		return w_id;
	}
	public void setW_id(String w_id) {
		this.w_id = w_id;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public String getSnum() {
		return snum;
	}
	public void setSnum(String snum) {
		this.snum = snum;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
	public int getBadCnt() {
		return badCnt;
	}
	public void setBadCnt(int badCnt) {
		this.badCnt = badCnt;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	public String getDepth() {
		return depth;
	}
	public void setDepth(String depth) {
		this.depth = depth;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	@Override
	public String toString() {
		return "Review [w_id=" + w_id + ", orderNum=" + orderNum + ", snum=" + snum + ", r_content=" + r_content
				+ ", star=" + star + ", badCnt=" + badCnt + ", r_date=" + r_date + ", depth=" + depth + ", r_no=" + r_no
				+ "]";
	}	
	
	
}
