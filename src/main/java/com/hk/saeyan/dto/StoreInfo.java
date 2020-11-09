package com.hk.saeyan.dto;

import java.util.Date;

public class StoreInfo {
	
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
	String items;
	String w_id;
	int orderNum;
	String r_content;
	int star;
	int badCnt;
	Date r_date;
	String depth;
	int r_no;
	int rcom_no;
	String r_id;
	String rcom_content;
	Date rcom_date;
	int mno;
	String saddress;
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
	public String getItems() {
		return items;
	}
	public void setItems(String items) {
		this.items = items;
	}
	public String getW_id() {
		return w_id;
	}
	public void setW_id(String w_id) {
		this.w_id = w_id;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public int getBadCnt() {
		return badCnt;
	}
	public void setBadCnt(int badCnt) {
		this.badCnt = badCnt;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	public String getDepth() {
		return depth;
	}
	public void setDepth(String depth) {
		this.depth = depth;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public int getRcom_no() {
		return rcom_no;
	}
	public void setRcom_no(int rcom_no) {
		this.rcom_no = rcom_no;
	}
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
	}
	public String getRcom_content() {
		return rcom_content;
	}
	public void setRcom_content(String rcom_content) {
		this.rcom_content = rcom_content;
	}
	public Date getRcom_date() {
		return rcom_date;
	}
	public void setRcom_date(Date rcom_date) {
		this.rcom_date = rcom_date;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getSaddress() {
		return saddress;
	}
	public void setSaddress(String saddress) {
		this.saddress = saddress;
	}
	@Override
	public String toString() {
		return "StoreInfo [id=" + id + ", sname=" + sname + ", snum=" + snum + ", scontact=" + scontact + ", bank="
				+ bank + ", bnum=" + bnum + ", permit=" + permit + ", s_date=" + s_date + ", area_num=" + area_num
				+ ", sdcheck=" + sdcheck + ", storeZipCode=" + storeZipCode + ", storeFirstAddr=" + storeFirstAddr
				+ ", storeSecondAddr=" + storeSecondAddr + ", storeExtraAddr=" + storeExtraAddr + ", sp1=" + sp1
				+ ", sp2=" + sp2 + ", sp3=" + sp3 + ", sp4=" + sp4 + ", items=" + items + ", w_id=" + w_id
				+ ", orderNum=" + orderNum + ", r_content=" + r_content + ", star=" + star + ", badCnt=" + badCnt
				+ ", r_date=" + r_date + ", depth=" + depth + ", r_no=" + r_no + ", rcom_no=" + rcom_no + ", r_id="
				+ r_id + ", rcom_content=" + rcom_content + ", rcom_date=" + rcom_date + ", mno=" + mno + ", saddress="
				+ saddress + "]";
	}
	
	
	
}
