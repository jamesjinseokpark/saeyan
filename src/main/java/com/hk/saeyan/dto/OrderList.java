package com.hk.saeyan.dto;

import java.util.Date;

public class OrderList {
	
	String orderNum;
	String id;
	String snum;
	String sname;
	String items;
	Date pay_date;
	int pay_price;
	String r_check;
	int bubble;
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getItems() {
		return items;
	}
	public void setItems(String items) {
		this.items = items;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	public int getPay_price() {
		return pay_price;
	}
	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}
	public String getR_check() {
		return r_check;
	}
	public void setR_check(String r_check) {
		this.r_check = r_check;
	}
	public int getBubble() {
		return bubble;
	}
	public void setBubble(int bubble) {
		this.bubble = bubble;
	}
	@Override
	public String toString() {
		return "OrderList [orderNum=" + orderNum + ", id=" + id + ", snum=" + snum + ", sname=" + sname + ", items="
				+ items + ", pay_date=" + pay_date + ", pay_price=" + pay_price + ", r_check=" + r_check + ", bubble="
				+ bubble + "]";
	}
	
}
