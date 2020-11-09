package com.hk.saeyan.dto;

import java.util.Date;

public class Chat {
	String w_id;
	int c_no;
	String g_check;
	Date c_date;
	String c_content;
	String c_title;
	String c_cnt;
	String snum;
	String sname;
	
	public String getW_id() {
		return w_id;
	}
	public void setW_id(String w_id) {
		this.w_id = w_id;
	}
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getG_check() {
		return g_check;
	}
	public void setG_check(String g_check) {
		this.g_check = g_check;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getC_title() {
		return c_title;
	}
	public void setC_title(String c_title) {
		this.c_title = c_title;
	}
	public String getc_cnt() {
		return c_cnt;
	}
	public void setc_cnt(String c_cnt) {
		this.c_cnt = c_cnt;
	}
	public String getSnum() {
		return snum;
	}
	public void setSnum(String snum) {
		this.snum = snum;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	@Override
	public String toString() {
		return "Chat [w_id=" + w_id + ", c_no=" + c_no + ", g_check=" + g_check + ", c_date=" + c_date + ", c_content="
				+ c_content + ", c_title=" + c_title + ", c_cnt=" + c_cnt + ", snum=" + snum + ", sname=" + sname + "]";
	}

	
}
