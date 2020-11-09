
package com.hk.saeyan.dto;

import java.util.Date;

public class PersonalPay {

	String id;
	String cardCom;
	String cardNum;
	String cardExp;
	String cardCvc;

	
	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getCardCom() {
		return cardCom;
	}


	public void setCardCom(String cardCom) {
		this.cardCom = cardCom;
	}


	public String getCardNum() {
		return cardNum;
	}


	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}


	public String getCardExp() {
		return cardExp;
	}


	public void setCardExp(String cardExp) {
		this.cardExp = cardExp;
	}


	public String getCardCvc() {
		return cardCvc;
	}


	public void setCardCvc(String cardCvc) {
		this.cardCvc = cardCvc;
	}


	@Override
	public String toString() {
		return "PersonalPay [id=" + id + ", cardCom=" + cardCom + ", cardNum=" + cardNum + ", cardExp=" + cardExp
				+ ", cardCvc=" + cardCvc + "]";
	}

	
	
}
