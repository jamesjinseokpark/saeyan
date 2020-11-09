package com.hk.saeyan.dto;

import java.util.Date;

public class ChatAll {
	String w_id;
	int c_no;
	String g_check;
	Date c_date;
	String c_content;
	String c_title;
	String depth;
	int com_no;
	String r_id;
	String com_content;
	Date com_date;
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
	public String getDepth() {
		return depth;
	}
	public void setDepth(String depth) {
		this.depth = depth;
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
		return "ChatAll [w_id=" + w_id + ", c_no=" + c_no + ", g_check=" + g_check + ", c_date=" + c_date
				+ ", c_content=" + c_content + ", c_title=" + c_title + ", depth=" + depth + ", com_no=" + com_no
				+ ", r_id=" + r_id + ", com_content=" + com_content + ", com_date=" + com_date + "]";
	}
	
}

