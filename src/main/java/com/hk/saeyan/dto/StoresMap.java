package com.hk.saeyan.dto;

public class StoresMap {
	String sname;
	String snum;
	int area_num;
	String saddress;
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
	public int getArea_num() {
		return area_num;
	}
	public void setArea_num(int area_num) {
		this.area_num = area_num;
	}
	public String getSaddress() {
		return saddress;
	}
	public void setSaddress(String saddress) {
		this.saddress = saddress;
	}
	@Override
	public String toString() {
		return "StoresMap [sname=" + sname + ", snum=" + snum + ", area_num=" + area_num + ", saddress=" + saddress
				+ "]";
	}
	
	
}
