package com.hk.saeyan.dto;

public class Members {
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
	@Override
	public String toString() {
		return "Members [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", pnum=" + pnum
				+ ", userZipCode=" + userZipCode + ", userFirstAddr=" + userFirstAddr + ", userSecondAddr="
				+ userSecondAddr + ", userExtraAddr=" + userExtraAddr + ", cardCheck=" + cardCheck + ", likeStore1="
				+ likeStore1 + ", likeStore2=" + likeStore2 + ", likeStore3=" + likeStore3 + ", udCheck=" + udCheck
				+ ", reason=" + reason + ", grade=" + grade
				+ "]";
	}
		
}