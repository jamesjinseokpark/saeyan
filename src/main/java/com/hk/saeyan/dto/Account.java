package com.hk.saeyan.dto;

import java.util.Date;

public class Account {
	
	String id;
	int balance;
	Date a_date;
	int o_price;
	String detail;
	int i_price;
	int a_seq;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public Date getA_date() {
		return a_date;
	}
	public void setA_date(Date a_date) {
		this.a_date = a_date;
	}
	public int getO_price() {
		return o_price;
	}
	public void setO_price(int o_price) {
		this.o_price = o_price;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public int getI_price() {
		return i_price;
	}
	public void setI_price(int i_price) {
		this.i_price = i_price;
	}
	public int getA_seq() {
		return a_seq;
	}
	public void setA_seq(int a_seq) {
		this.a_seq = a_seq;
	}
	@Override
	public String toString() {
		return "Account [id=" + id + ", balance=" + balance + ", a_date=" + a_date + ", o_price=" + o_price
				+ ", detail=" + detail + ", i_price=" + i_price + ", a_seq=" + a_seq + "]";
	}
	
	
		
}
