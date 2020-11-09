package com.hk.saeyan.dto;

public class StatisticDay {
	String cday;
	int oq;
	int op;
	public String getCday() {
		return cday;
	}
	public void setCday(String cday) {
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
	@Override
	public String toString() {
		return "StatisticDay [cday=" + cday + ", oq=" + oq + ", op=" + op + "]";
	}
	
	
}
