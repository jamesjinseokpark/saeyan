package com.hk.saeyan.dto;

import java.util.Date;

public class Stores {
	String id;
	String sname;
	String snum;
	String scontact;
	String bank;
	String bnum;
	String permit;
	Date s_date;
	int area_num;
	String sdcheck;
	String storeZipCode;
	String storeFirstAddr;
	String storeSecondAddr;
	String storeExtraAddr;
	String sp1;
	String sp2;
	String sp3;
	String sp4;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSnum() {
		return snum;
	}
	public void setSnum(String snum) {
		this.snum = snum;
	}
	public String getScontact() {
		return scontact;
	}
	public void setScontact(String scontact) {
		this.scontact = scontact;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getBnum() {
		return bnum;
	}
	public void setBnum(String bnum) {
		this.bnum = bnum;
	}
	public String getPermit() {
		return permit;
	}
	public void setPermit(String permit) {
		this.permit = permit;
	}
	public Date getS_date() {
		return s_date;
	}
	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}
	public int getArea_num() {
		return area_num;
	}
	public void setArea_num(int area_num) {
		this.area_num = area_num;
	}
	public String getSdcheck() {
		return sdcheck;
	}
	public void setSdcheck(String sdcheck) {
		this.sdcheck = sdcheck;
	}
	public String getStoreZipCode() {
		return storeZipCode;
	}
	public void setStoreZipCode(String storeZipCode) {
		this.storeZipCode = storeZipCode;
	}
	public String getStoreFirstAddr() {
		return storeFirstAddr;
	}
	public void setStoreFirstAddr(String storeFirstAddr) {
		this.storeFirstAddr = storeFirstAddr;
	}
	public String getStoreSecondAddr() {
		return storeSecondAddr;
	}
	public void setStoreSecondAddr(String storeSecondAddr) {
		this.storeSecondAddr = storeSecondAddr;
	}
	public String getStoreExtraAddr() {
		return storeExtraAddr;
	}
	public void setStoreExtraAddr(String storeExtraAddr) {
		this.storeExtraAddr = storeExtraAddr;
	}
	public String getSp1() {
		return sp1;
	}
	public void setSp1(String sp1) {
		this.sp1 = sp1;
	}
	public String getSp2() {
		return sp2;
	}
	public void setSp2(String sp2) {
		this.sp2 = sp2;
	}
	public String getSp3() {
		return sp3;
	}
	public void setSp3(String sp3) {
		this.sp3 = sp3;
	}
	public String getSp4() {
		return sp4;
	}
	public void setSp4(String sp4) {
		this.sp4 = sp4;
	}
	@Override
	public String toString() {
		return "Stores [id=" + id + ", sname=" + sname + ", snum=" + snum + ", scontact=" + scontact + ", bank=" + bank
				+ ", bnum=" + bnum + ", permit=" + permit + ", s_date=" + s_date + ", area_num=" + area_num
				+ ", sdcheck=" + sdcheck + ", storeZipCode=" + storeZipCode + ", storeFirstAddr=" + storeFirstAddr
				+ ", storeSecondAddr=" + storeSecondAddr + ", storeExtraAddr=" + storeExtraAddr + ", sp1=" + sp1
				+ ", sp2=" + sp2 + ", sp3=" + sp3 + ", sp4=" + sp4 + "]";
	}
		
}
