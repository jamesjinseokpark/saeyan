package com.hk.saeyan.dto;

public class MapData {
	int mno;
	String snum;
	String saddress;
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getSnum() {
		return snum;
	}
	public void setSnum(String snum) {
		this.snum = snum;
	}
	public String getSaddress() {
		return saddress;
	}
	public void setSaddress(String saddress) {
		this.saddress = saddress;
	}
	@Override
	public String toString() {
		return "MapData [mno=" + mno + ", snum=" + snum + ", saddress=" + saddress + "]";
	}
	
	
	
	
}
