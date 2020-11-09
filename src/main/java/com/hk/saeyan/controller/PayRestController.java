package com.hk.saeyan.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.hk.saeyan.dto.Account;
import com.hk.saeyan.dto.Bubble;
import com.hk.saeyan.dto.Members;
import com.hk.saeyan.dto.OrderList;
import com.hk.saeyan.dto.OrderProcess;
import com.hk.saeyan.dto.UserInfo;
import com.hk.saeyan.service.MainService;
import com.hk.saeyan.service.UserService;

@RestController
@RequestMapping(path = "/order", produces = "text/plain;charset=UTF-8")
public class PayRestController {
	@Autowired
	MainService mainService;
	
	@Autowired
	UserService userService;

	@RequestMapping(path = "/bubblePay", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public int bubblePay(int b_price, HttpSession session, Bubble bubble, Account account) {
		System.out.println(b_price);
		Members loginMember = (Members) session.getAttribute("loginMember");

		bubble.setId(loginMember.getId());
		int bu = mainService.bubbleplus(bubble);
		System.out.println(bu);
		bubble.setB_price(b_price);
		bubble.setB_bubble((int) (b_price * 1.1));
		bubble.setBubble((int) (bu + (b_price * 1.1)));

		int bal = mainService.accpay(account);
		account.setId(loginMember.getId());
		account.setBalance((int) (bal + b_price));
		account.setI_price(b_price);

		return mainService.bubblePay(bubble, account);
	}

	@RequestMapping(path = "/finalPay", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public int finalPay(HttpSession session, @RequestParam("items[]") String[] items,
			@RequestParam("snum[]") String[] snum, @RequestParam("sname[]") String[] sname,
			@RequestParam("pay_price[]") int[] pay_price,@RequestParam("bubble") int bubble, String id, Bubble bubble1, Account account,String check) {
		Members loginMember = (Members) session.getAttribute("loginMember");
		System.out.println("들어오니??");
		//버블 계산
		bubble1.setId(loginMember.getId());
		int bu = mainService.bubbleplus(bubble1);
	
		
		//상품결제계산
		int payy=0;
		int payP = 0;
		int paypp=0;
		int pay = 0;		
		int bub = 0;
		int bal = mainService.accpay(account);
		for (int i = 0; i < pay_price.length; i++) {
			pay = bal += pay_price[i];
			payP += pay_price[i];
			bub += bubble;
			
		};
		bubble1.setP_bubble(bub);
		System.out.println("bu-bub = "+(bu - bub));
		bubble1.setBubble(bu-bub);
		System.out.println(bubble1.toString());
		payy=pay-bub;
		paypp=payP-bub;
		account.setId(loginMember.getId());
		account.setBalance(payy);
		account.setI_price(paypp);

//       
		if(bub!=0) {
			mainService.bubblefinal(bubble1);
		}
		if(check.equals("N")) {
			mainService.orderAcc(account);
		}
		int ret = mainService.finalPay(pay_price, items, snum, sname, bubble, id);
		System.out.println("ret=" + ret);
		return ret;
	}
	
	@RequestMapping(path = "/refundCheck", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public OrderProcess refundCheck(@RequestParam("id") String id,@RequestParam("orderNum")String orderNum,@RequestParam("i_price")int i_price,@RequestParam("bubble")int bubble,Account account) {
		System.out.println("들어와?");
		int bal=0;
		int bub=0;
		bal = mainService.accpay(account);
		System.out.println(bubble);
		bub =(int)(i_price-bubble);
		System.out.println(bub);
		account.setId(id);
		account.setBalance((int)(bal-bub));
		System.out.println(account);
		account.setO_price(bub);
		if(bub!=0) {
			userService.accRefunt(account);
		}
		userService.refundCheck(id,orderNum,bubble);
		return userService.myOrderList(orderNum);
	}
	
	
	

}