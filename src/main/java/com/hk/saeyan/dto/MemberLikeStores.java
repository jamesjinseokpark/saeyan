package com.hk.saeyan.dto;

public class MemberLikeStores {

	String id;
	String name;
	String likeStore1;
	String likeStore2;
	String likeStore3;
	String snum;
	String sname;
	String scontact;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLikeStore1() {
		return likeStore1;
	}
	public void setLikeStore1(String likeStore1) {
		this.likeStore1 = likeStore1;
	}
	public String getLikeStore2() {
		return likeStore2;
	}
	public void setLikeStore2(String likeStore2) {
		this.likeStore2 = likeStore2;
	}
	public String getLikeStore3() {
		return likeStore3;
	}
	public void setLikeStore3(String likeStore3) {
		this.likeStore3 = likeStore3;
	}
	public String getSnum() {
		return snum;
	}
	public void setSnum(String snum) {
		this.snum = snum;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getScontact() {
		return scontact;
	}
	public void setScontact(String scontact) {
		this.scontact = scontact;
	}
	@Override
	public String toString() {
		return "MemberLikeStores [id=" + id + ", name=" + name + ", likeStore1=" + likeStore1 + ", likeStore2="
				+ likeStore2 + ", likeStore3=" + likeStore3 + ", snum=" + snum + ", sname=" + sname + ", scontact="
				+ scontact + "]";
	}
	
	
}
