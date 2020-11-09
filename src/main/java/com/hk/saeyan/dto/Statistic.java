package com.hk.saeyan.dto;

import java.util.Date;

public class Statistic {
	int sno;
	String snum;
	Date cday;
	int oq;
	int op;
	String items;
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getSnum() {
		return snum;
	}
	public void setSnum(String snum) {
		this.snum = snum;
	}
	public Date getCday() {
		return cday;
	}
	public void setCday(Date cday) {
		this.cday = cday;
	}
	public int getOq() {
		return oq;
	}
	public void setOq(int oq) {
		this.oq = oq;
	}
	public int getOp() {
		return op;
	}
	public void setOp(int op) {
		this.op = op;
	}
	public String getItems() {
		return items;
	}
	public void setItems(String items) {
		this.items = items;
	}
	@Override
	public String toString() {
		return "Statistic [sno=" + sno + ", snum=" + snum + ", cday=" + cday + ", oq=" + oq + ", op=" + op + ", items="
				+ items + "]";
	}
	
}
