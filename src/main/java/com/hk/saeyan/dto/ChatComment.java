package com.hk.saeyan.dto;

import java.util.Date;

public class ChatComment {
	int c_no;
	int com_no;
	String r_id;
	String com_content;
	Date com_date;
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public int getCom_no() {
		return com_no;
	}
	public void setCom_no(int com_no) {
		this.com_no = com_no;
	}
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
	}
	public String getCom_content() {
		return com_content;
	}
	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}
	public Date getCom_date() {
		return com_date;
	}
	public void setCom_date(Date com_date) {
		this.com_date = com_date;
	}
	@Override
	public String toString() {
		return "ChatComment [c_no=" + c_no + ", com_no=" + com_no + ", r_id=" + r_id + ", com_content=" + com_content
				+ ", com_date=" + com_date + "]";
	}
	
}
