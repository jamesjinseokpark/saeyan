package com.hk.saeyan.dto;

public class ItemList {
	String snum;
	String items;
	public String getSnum() {
		return snum;
	}
	public void setSnum(String snum) {
		this.snum = snum;
	}
	public String getItems() {
		return items;
	}
	public void setItems(String items) {
		this.items = items;
	}
	@Override
	public String toString() {
		return "ItemList [snum=" + snum + ", items=" + items + "]";
	}
	
}
