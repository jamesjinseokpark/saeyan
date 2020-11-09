package com.hk.saeyan.dto;

import java.util.Date;

public class UserInfo {
	String id;
	String pwd;
	String name;
	String email;
	String pnum;
	String userZipCode;
	String userFirstAddr;
	String userSecondAddr;
	String userExtraAddr;
	String cardCheck;
	String likeStore1;
	String likeStore2;
	String likeStore3;
	String udCheck;
	String reason;
	String grade;
	String cardCom;
	String cardNum;
	String cardExp;
	String cardCvc;
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
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
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
	public String getCardCheck() {
		return cardCheck;
	}
	public void setCardCheck(String cardCheck) {
		this.cardCheck = cardCheck;
	}
	public String getLikeStore1() {
		return likeStore1;
	}
	public void setLikeStore1(String likeStore1) {
		this.likeStore1 = likeStore1;
	}
	public String getLikeStore2() {
		return likeStore2;
	}
	public void setLikeStore2(String likeStore2) {
		this.likeStore2 = likeStore2;
	}
	public String getLikeStore3() {
		return likeStore3;
	}
	public void setLikeStore3(String likeStore3) {
		this.likeStore3 = likeStore3;
	}
	public String getUdCheck() {
		return udCheck;
	}
	public void setUdCheck(String udCheck) {
		this.udCheck = udCheck;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getCardCom() {
		return cardCom;
	}
	public void setCardCom(String cardCom) {
		this.cardCom = cardCom;
	}
	public String getCardNum() {
		return cardNum;
	}
	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}
	public String getCardExp() {
		return cardExp;
	}
	public void setCardExp(String cardExp) {
		this.cardExp = cardExp;
	}
	public String getCardCvc() {
		return cardCvc;
	}
	public void setCardCvc(String cardCvc) {
		this.cardCvc = cardCvc;
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
		return "UserInfo [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", pnum=" + pnum
				+ ", userZipCode=" + userZipCode + ", userFirstAddr=" + userFirstAddr + ", userSecondAddr="
				+ userSecondAddr + ", userExtraAddr=" + userExtraAddr + ", cardCheck=" + cardCheck + ", likeStore1="
				+ likeStore1 + ", likeStore2=" + likeStore2 + ", likeStore3=" + likeStore3 + ", udCheck=" + udCheck
				+ ", reason=" + reason + ", grade=" + grade + ", cardCom=" + cardCom + ", cardNum=" + cardNum
				+ ", cardExp=" + cardExp + ", cardCvc=" + cardCvc + ", b_price=" + b_price + ", bubble=" + bubble
				+ ", b_date=" + b_date + ", p_bubble=" + p_bubble + ", b_bubble=" + b_bubble + ", b_seq=" + b_seq + "]";
	}
			
}
