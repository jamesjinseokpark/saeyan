package com.hk.saeyan.dto;

public class EmailCheck {

	String email;
	String joinCode;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getJoinCode() {
		return joinCode;
	}
	public void setJoinCode(String joinCode) {
		this.joinCode = joinCode;
	}
	@Override
	public String toString() {
		return "EmailCheck [email=" + email + ", joinCode=" + joinCode + "]";
	}
	
}
