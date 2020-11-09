package com.hk.saeyan.dto;

public class Cart {
	String id;
	String items;
	String snum;
	String sname;
	String c_check="N";
	int cart_seq;
	String choice="N";
	int pay_cart;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getItems() {
		return items;
	}
	public void setItems(String items) {
		this.items = items;
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
	public String getC_check() {
		return c_check;
	}
	public void setC_check(String c_check) {
		this.c_check = c_check;
	}
	public int getCart_seq() {
		return cart_seq;
	}
	public void setCart_seq(int cart_seq) {
		this.cart_seq = cart_seq;
	}
	public String getChoice() {
		return choice;
	}
	public void setChoice(String choice) {
		this.choice = choice;
	}
	public int getPay_cart() {
		return pay_cart;
	}
	public void setPay_cart(int pay_cart) {
		this.pay_cart = pay_cart;
	}
	@Override
	public String toString() {
		return "Cart [id=" + id + ", items=" + items + ", snum=" + snum + ", sname=" + sname + ", c_check=" + c_check
				+ ", cart_seq=" + cart_seq + ", choice=" + choice + ", pay_cart=" + pay_cart + "]";
	}
	
	
}
