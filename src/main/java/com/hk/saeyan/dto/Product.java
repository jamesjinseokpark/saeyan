package com.hk.saeyan.dto;

public class Product {
	
	int pno;
	String pcode;
	String pname;
	int pprice;
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	@Override
	public String toString() {
		return "Product [pno=" + pno + ", pcode=" + pcode + ", pname=" + pname + ", pprice=" + pprice + "]";
	}
	
}
