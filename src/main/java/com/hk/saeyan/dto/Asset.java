package com.hk.saeyan.dto;

public class Asset {
	
	String periodStart;
	String snum;
	int a_price;
	String a_date;
	String periodEnd;
	String a_check;
	int asset_seq;
	String sname;
	public String getPeriodStart() {
		return periodStart;
	}
	public void setPeriodStart(String periodStart) {
		this.periodStart = periodStart;
	}
	public String getSnum() {
		return snum;
	}
	public void setSnum(String snum) {
		this.snum = snum;
	}
	public int getA_price() {
		return a_price;
	}
	public void setA_price(int a_price) {
		this.a_price = a_price;
	}
	public String getA_date() {
		return a_date;
	}
	public void setA_date(String a_date) {
		this.a_date = a_date;
	}
	public String getPeriodEnd() {
		return periodEnd;
	}
	public void setPeriodEnd(String periodEnd) {
		this.periodEnd = periodEnd;
	}
	public String getA_check() {
		return a_check;
	}
	public void setA_check(String a_check) {
		this.a_check = a_check;
	}
	public int getAsset_seq() {
		return asset_seq;
	}
	public void setAsset_seq(int asset_seq) {
		this.asset_seq = asset_seq;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	@Override
	public String toString() {
		return "Asset [periodStart=" + periodStart + ", snum=" + snum + ", a_price=" + a_price + ", a_date=" + a_date
				+ ", periodEnd=" + periodEnd + ", a_check=" + a_check + ", asset_seq=" + asset_seq + ", sname=" + sname
				+ "]";
	}
	
}
