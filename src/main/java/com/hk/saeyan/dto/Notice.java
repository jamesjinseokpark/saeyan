package com.hk.saeyan.dto;

import java.util.Date;

public class Notice {
	
	String id;
	Date n_date;
	String n_content;
	String n_title;
	int n_seq;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getN_date() {
		return n_date;
	}
	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public int getN_seq() {
		return n_seq;
	}
	public void setN_seq(int n_seq) {
		this.n_seq = n_seq;
	}
	@Override
	public String toString() {
		return "Notice [id=" + id + ", n_date=" + n_date + ", n_content=" + n_content + ", n_title=" + n_title
				+ ", n_seq=" + n_seq + "]";
	}
	
	

}
