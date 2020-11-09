package com.hk.saeyan.controller;


import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hk.saeyan.dto.Cart;
import com.hk.saeyan.dto.FinalPay;
import com.hk.saeyan.dto.ManagerInfo;
import com.hk.saeyan.dto.MemberLikeStores;
import com.hk.saeyan.dto.Members;
import com.hk.saeyan.dto.OrderList;
import com.hk.saeyan.dto.Product;
import com.hk.saeyan.dto.StoreInfo;
import com.hk.saeyan.dto.Stores;
import com.hk.saeyan.service.AuthService;
import com.hk.saeyan.service.MainService;




@Controller
@RequestMapping("/stores")
public class StoresController {

	@Autowired
	MainService mainService;
	
	@Autowired
	AuthService authService;

	@GetMapping("/map")
	public String storesList(Stores Stores,ManagerInfo managerInfo,Model model,HttpSession session,Members members) {
		Members loginMember = (Members) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		if(loginMember == null) {
			return "redirect:/auth/login";
		} else { 
			ManagerInfo user=mainService.userAdr(loginMember.getId());
			model.addAttribute("stores",mainService.storesList());
			model.addAttribute("user",user);
			return "/main/mapTestEnd";
		}
	}

	@GetMapping("/like")
	public String likeStores(HttpSession session, Model model, MemberLikeStores memberLikeStores ) {
		Members loginMember = (Members) session.getAttribute("loginMember");
		if(loginMember==null) {
			return "redirect:/auth/login";
		} else {
			MemberLikeStores userLikeStore1 = authService.getLikeStore1(loginMember.getId());
			MemberLikeStores userLikeStore2 = authService.getLikeStore2(loginMember.getId());
			MemberLikeStores userLikeStore3 = authService.getLikeStore3(loginMember.getId());
			model.addAttribute("likeStore1", userLikeStore1);
			model.addAttribute("likeStore2", userLikeStore2);
			model.addAttribute("likeStore3", userLikeStore3);
			return "/main/likeStores";
		}
	}
	
	@GetMapping("/noUserMap")
	public String noUserMap(Stores stores, ManagerInfo managerInfo, Model model) {
		return "/main/noUserMap";
	}

	@GetMapping("/info")
	public String selectsStoreOne(String snum,Model model,StoreInfo StoreInfo) {
		StoreInfo storeInfo = mainService.selectsStoreOne(snum);
		String item=storeInfo.getItems();
		String[] items=item.split("!@#");
		model.addAttribute("items",items);
		model.addAttribute("storeInfo",storeInfo);
		model.addAttribute("product",mainService.price());
		model.addAttribute("reviewList", mainService.reviewList(snum));
		
		if(storeInfo.getSdcheck().equals("Y")) {
			return "main/error";
		}
		
		return "main/storesInfo";
	}


	@PostMapping("/info")
	public String insert( Cart cart, HttpSession session) {


		Members loginMember=(Members)session.getAttribute("loginMember");

		if(loginMember==null) { 

			//로그인하지 않은 상태이면 로그인 화면으로 이동

			return "redirect:/auth/login";
		}
		cart.setId(loginMember.getId());

		int count =mainService.countCart(cart.getCart_seq());

		if(count ==0) {
			mainService.insert(cart);
		}


		//        int ret=mainService.insert(cart); //장바구니 테이블에 저장됨
		//        System.out.println(ret);
		return "main/cart"; //장바구니 목록으로 이동
	}

	@GetMapping("/cart")
	public String addCart(Cart cart, HttpSession session,Model model,Members members) {
		Members loginMember = (Members) session.getAttribute("loginMember");
		List<Cart> cartList=mainService.userCart(loginMember.getId());
		//		 int count =mainService.countCart(cart.getCart_seq());
		//		 model.addAttribute("count",count);
		model.addAttribute("cartList",cartList);
		return "main/cartList";
	}

	//장바구니삭제
	@RequestMapping("/delete")
	public String deleteCart(@RequestParam("cart_seq") int cart_seq ,Model model) {
		mainService.deleteCart(cart_seq);

		return "redirect:/stores/cart";
	}



	@PostMapping("/cart")
	public String UpdateCart(@RequestParam("cart_seq") List<String> cart_seq ,Model model) {
		//List<Cart> cartList=mainService.userCart();
		int cartPrice=mainService.cartPrice(cart_seq);



		return "redirect:/stores/pay";
	}


	@GetMapping("/pay")
	public String cartPay(FinalPay finalpay,HttpSession session,Model model) {
		Members loginMember = (Members) session.getAttribute("loginMember");
		FinalPay finalPay=mainService.userPay(loginMember.getId());
		List<FinalPay> cartpay=mainService.cartpay(loginMember.getId());
		model.addAttribute("finalPay",finalPay);
		model.addAttribute("cartpay",cartpay);
		return "main/cartPay";
	}

	@GetMapping("/payCheck")
	public String payCheck(HttpSession session,Model model,@RequestParam("ret") int ret,OrderList orderList) {
		Members loginMember = (Members) session.getAttribute("loginMember");
		System.out.println("ret="+ret);
		System.out.println(loginMember);
		//orderList.setId(loginMember.getId());
		model.addAttribute("payChk",mainService.payCheck(loginMember.getId(),ret));	
		return "main/paycheck";
	}
}

