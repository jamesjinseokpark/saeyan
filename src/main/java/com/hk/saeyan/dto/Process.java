package com.hk.saeyan.dto;

import java.util.Date;

public class Process {
	String id;
	String orderNum;
	Date wait;
	Date ok;
	Date pick;
	Date wash;
	Date finish;
	Date refundDate;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public Date getWait() {
		return wait;
	}
	public void setWait(Date wait) {
		this.wait = wait;
	}
	public Date getOk() {
		return ok;
	}
	public void setOk(Date ok) {
		this.ok = ok;
	}
	public Date getPick() {
		return pick;
	}
	public void setPick(Date pick) {
		this.pick = pick;
	}
	public Date getWash() {
		return wash;
	}
	public void setWash(Date wash) {
		this.wash = wash;
	}
	public Date getFinish() {
		return finish;
	}
	public void setFinish(Date finish) {
		this.finish = finish;
	}
	public Date getRefundDate() {
		return refundDate;
	}
	public void setRefundDate(Date refundDate) {
		this.refundDate = refundDate;
	}
	@Override
	public String toString() {
		return "Process [id=" + id + ", orderNum=" + orderNum + ", wait=" + wait + ", ok=" + ok + ", pick=" + pick
				+ ", wash=" + wash + ", finish=" + finish + ", refundDate=" + refundDate + "]";
	}
	
}
