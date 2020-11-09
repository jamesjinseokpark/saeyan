package com.hk.saeyan.dto;

import java.util.Date;

public class Bubble {
	String id;
	int b_price;
	int bubble;
	Date b_date;
	int p_bubble;
	int b_bubble;
	int b_seq;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getB_price() {
		return b_price;
	}
	public void setB_price(int b_price) {
		this.b_price = b_price;
	}
	public int getBubble() {
		return bubble;
	}
	public void setBubble(int bubble) {
		this.bubble = bubble;
	}
	public Date getB_date() {
		return b_date;
	}
	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}
	public int getP_bubble() {
		return p_bubble;
	}
	public void setP_bubble(int p_bubble) {
		this.p_bubble = p_bubble;
	}
	public int getB_bubble() {
		return b_bubble;
	}
	public void setB_bubble(int b_bubble) {
		this.b_bubble = b_bubble;
	}
	public int getB_seq() {
		return b_seq;
	}
	public void setB_seq(int b_seq) {
		this.b_seq = b_seq;
	}
	@Override
	public String toString() {
		return "Bubble [id=" + id + ", b_price=" + b_price + ", bubble=" + bubble + ", b_date=" + b_date + ", p_bubble="
				+ p_bubble + ", b_bubble=" + b_bubble + ", b_seq=" + b_seq + "]";
	}
	

	

}
