package com.hk.saeyan.dto;

import java.util.Date;

public class ReviewAll {
	String w_id;
	int orderNum;
	String snum;
	String r_content;
	int star;
	int badCnt;
	Date r_date;
	String depth;
	int r_no;
	int rcom_no;
	String r_id;
	String rcom_content;
	Date rcom_date;
	public String getW_id() {
		return w_id;
	}
	public void setW_id(String w_id) {
		this.w_id = w_id;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
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
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
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
		return "ReviewAll [w_id=" + w_id + ", orderNum=" + orderNum + ", snum=" + snum + ", r_content=" + r_content
				+ ", star=" + star + ", badCnt=" + badCnt + ", r_date=" + r_date + ", depth=" + depth + ", r_no=" + r_no
				+ ", rcom_no=" + rcom_no + ", r_id=" + r_id + ", rcom_content=" + rcom_content + ", rcom_date="
				+ rcom_date + "]";
	}
}
