package com.hk.saeyan.dto;

import java.util.Date;

public class OrderProcess {

	String orderNum;
	String id;
	String snum;
	String sname;
	String items;
	Date pay_date;
	int pay_price;
	String r_check;
	int bubble;
	String refund;
	Date wait;
	Date ok;
	Date pick;
	Date wash;
	Date finish;
	Date refundDate;
	String name;
	String email;
	String pnum;
	String userZipCode;
	String userFirstAddr;
	String userSecondAddr;
	String userExtraAddr;
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
	public String getRefund() {
		return refund;
	}
	public void setRefund(String refund) {
		this.refund = refund;
	}
	public Date getWait() {
		return wait;
	}
	public void setWait(Date wait) {
		this.wait = wait;
	}
	public Date getOk() {
		return ok;
	}
	public void setOk(Date ok) {
		this.ok = ok;
	}
	public Date getPick() {
		return pick;
	}
	public void setPick(Date pick) {
		this.pick = pick;
	}
	public Date getWash() {
		return wash;
	}
	public void setWash(Date wash) {
		this.wash = wash;
	}
	public Date getFinish() {
		return finish;
	}
	public void setFinish(Date finish) {
		this.finish = finish;
	}
	public Date getRefundDate() {
		return refundDate;
	}
	public void setRefundDate(Date refundDate) {
		this.refundDate = refundDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}
	public String getUserZipCode() {
		return userZipCode;
	}
	public void setUserZipCode(String userZipCode) {
		this.userZipCode = userZipCode;
	}
	public String getUserFirstAddr() {
		return userFirstAddr;
	}
	public void setUserFirstAddr(String userFirstAddr) {
		this.userFirstAddr = userFirstAddr;
	}
	public String getUserSecondAddr() {
		return userSecondAddr;
	}
	public void setUserSecondAddr(String userSecondAddr) {
		this.userSecondAddr = userSecondAddr;
	}
	public String getUserExtraAddr() {
		return userExtraAddr;
	}
	public void setUserExtraAddr(String userExtraAddr) {
		this.userExtraAddr = userExtraAddr;
	}
	@Override
	public String toString() {
		return "OrderProcess [orderNum=" + orderNum + ", id=" + id + ", snum=" + snum + ", sname=" + sname + ", items="
				+ items + ", pay_date=" + pay_date + ", pay_price=" + pay_price + ", r_check=" + r_check + ", bubble="
				+ bubble + ", refund=" + refund + ", wait=" + wait + ", ok=" + ok + ", pick=" + pick + ", wash=" + wash
				+ ", finish=" + finish + ", refundDate=" + refundDate + ", name=" + name + ", email=" + email
				+ ", pnum=" + pnum + ", userZipCode=" + userZipCode + ", userFirstAddr=" + userFirstAddr
				+ ", userSecondAddr=" + userSecondAddr + ", userExtraAddr=" + userExtraAddr + "]";
	}
	
}
