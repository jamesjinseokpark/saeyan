package com.hk.saeyan.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hk.saeyan.dto.Bubble;
import com.hk.saeyan.dto.Chat;
import com.hk.saeyan.dto.ChatComment;
import com.hk.saeyan.dto.Members;
import com.hk.saeyan.dto.OrderList;
import com.hk.saeyan.dto.PageMaker;
import com.hk.saeyan.dto.PersonalPay;
import com.hk.saeyan.dto.SearchCriteria;
import com.hk.saeyan.dto.StoreInfo;
import com.hk.saeyan.dto.UserInfo;
import com.hk.saeyan.service.MainService;
import com.hk.saeyan.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	
	@Autowired
	MainService mainService;
	
	//회원정보수정
	@GetMapping("/update")
	public String selectUserOne(Model model,HttpSession session,UserInfo uerInfo) {
		Members loginMember = (Members) session.getAttribute("loginMember");
		Members user = userService.selectUserOne(loginMember.getId());
		model.addAttribute("user",user);
		return "user/selectUserOne";
	}
	
	@PostMapping("/update")
	public String userUpdate(Model model,UserInfo userInfo) {
		int ret = userService.userUpdate(userInfo);
		return "user/userUpdate";
	}
	
	@GetMapping("/creditCard")
	public String selectUserPay(Model model, HttpSession session, PersonalPay personalPay) {
		Members loginMember = (Members) session.getAttribute("loginMember");
		PersonalPay pay = userService.selectUserPay(loginMember.getId());
		model.addAttribute("pay",pay);
		return "/user/selectUserPay";
	}
	
	@PostMapping("/payUpdate")
	public String payUpdate(Model model, HttpSession session, UserInfo userInfo) {
		Members loginMember = (Members) session.getAttribute("loginMember");
		PersonalPay pay = userService.selectUserPay(loginMember.getId());
		model.addAttribute("pay",pay);
		userService.payUpdate(userInfo);
		return "redirect:/user/creditCard";
	}
	
	//user 탈퇴
	@GetMapping("/delet")
	public String userDeleteGet(Model model,HttpSession session) {
		Members loginMember = (Members) session.getAttribute("loginMember");
		Members user = userService.deleteUserOne(loginMember.getId());
		model.addAttribute("user",user);
		return "user/userDeleteGet";
	}
	
	@PostMapping("/delet")
	   public String userDeleterPost(Members members,Model model) {
	      int ret = userService.userDeleterPost(members);
	      return "user/userDeleterPost";
	   }

	//버블관리
	@GetMapping("/bubbleList")
	public String bubbleList(Model model,HttpSession session,Bubble bubble) {
		Members loginMember = (Members) session.getAttribute("loginMember");
		model.addAttribute("bub",userService.bubbleList(loginMember.getId()));
		return "user/bubbleList";
	}
	
	//주문번호 리스트
	@GetMapping("/process")
	public String OrderList(HttpServletRequest request,Model model,HttpSession session,OrderList orderList) {
		Members loginMember = (Members) session.getAttribute("loginMember");
		model.addAttribute("url", request.getRequestURI());
		model.addAttribute("order",userService.orderList(loginMember.getId()));
		return "user/orderList";
	}
	
	//주문 상세내역
	@GetMapping("/processOne")
	public String myOrderList(@RequestParam("orderNum") String orderNum,Model model) {
		model.addAttribute("myOrderList",userService.myOrderList(orderNum));
		return "user/myOrderList";
	}
	//  Chat choice board type  --------------------------------------------------------------------------------------

	//게시판 선택 페이지
	@GetMapping(value="/cChat")
	public String choiceBoardType() {
		return "/chat/choiceBoardType";
	}
	
	// review list 1020 ----------------------------------------------------------------------------------------------
	
	@GetMapping(value="/review")
	public String myReviewList(HttpServletRequest request, Model model, HttpSession session) {
		Members loginMember = (Members) session.getAttribute("loginMember");
		
		String logId = loginMember.getId();
		
		model.addAttribute("reviewListU", userService.reviewListU(logId));
		
		return "/user/reviewList";
	}
	
	
	
	
	//  Chat user to admin-------------------------------------------------------------------------------------------

	//게시글 작성화면
	@GetMapping(value="/cChatW")
	public String writeGet() {
		System.out.println("글작성 페이지 호출");


		return "chat/uWriteView";
	}

	//게시글 작성 - db저장
	@PostMapping(value="/cChatW")
	public String writePost(Model model, Chat chat, HttpSession session) {
		System.out.println("글작성");

		Members loginMember = (Members) session.getAttribute("loginMember");
		Members user = userService.selectUserOne(loginMember.getId());

		model.addAttribute("user",user);

		userService.write(chat);
		return "redirect:/user/cChatL";
	}

	//게시글 목록 조회
	@GetMapping(value="/cChatL")
	public String list(SearchCriteria scri, Model model, HttpSession session) {
		System.out.println("목록 조회 list 호출");
		Members loginMember = (Members) session.getAttribute("loginMember");
		
		
		String logId = loginMember.getId();
		model.addAttribute("list", userService.list(scri, logId));

		System.out.println(userService.list(scri, logId));

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCri(scri);

		pageMaker.setTotalCount(userService.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "chat/uList";

	}

	//게시글 상세 조회
	@GetMapping(value="/cChatR")
	public String selectOne (Chat chat, Model model) {
		System.out.println("selectOne 들어옴");

		model.addAttribute("selectOne", userService.selectOne(chat.getC_no()));
		
		List<ChatComment> commentList = userService.readComment(chat.getC_no());

		model.addAttribute("commentList", commentList);


		return "chat/uReadView";
	}

	//게시글 수정 화면
	@GetMapping(value="/cChatU")
	public String updateGet(Chat chat, Model model) {
		System.out.println("updateGet 들어옴");

		model.addAttribute("update", userService.selectOne(chat.getC_no()));

		return "chat/uUpdateView";
	}

	//게시글 수정 - db저장
	@PostMapping(value="/cChatU")
	public String updatePost(Chat chat) {
		System.out.println("update 들어옴");

		userService.update(chat);

		System.out.println(chat.toString() + "chatCon");

		return "redirect:/user/cChatL";

	}

	//게시글 삭제 - db저장
	@PostMapping(value="/cChatD")

	public String delete(Chat chat) {
		System.out.println("delete 들어옴");

		userService.delete(chat.getC_no() );

		System.out.println("delete 반환");

		return "redirect:/user/cChatL";
	}
	
	// chat manager from user 1019 james ------------------------------------------------------------------------------
	//문의글 목록 조회
	@GetMapping(value="/schat")
	public String schatList(SearchCriteria scri, Model model, HttpSession session) {
		System.out.println("목록 조회 list 호출");
		Members loginMember = (Members) session.getAttribute("loginMember");
		
		
		String logId = loginMember.getId();
		model.addAttribute("schatList", userService.schatList(scri, logId));



		PageMaker pageMaker = new PageMaker();

		pageMaker.setCri(scri);

		pageMaker.setTotalCount(userService.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "user/schatList";
	}
	
		//문의글 작성화면
		@GetMapping(value="/schatW")
		public String swriteGet() {
			System.out.println("너 여기 들어오니?");


			return "main/storesInfo";
		}

		//문의글 작성 - db
		@PostMapping(value="/schatW")
		public String swritePost(@RequestParam("snum") String snum, Model model, Chat chat, HttpSession session) {
			
			Members loginMember = (Members) session.getAttribute("loginMember");
			Members user = userService.selectUserOne(loginMember.getId());
									
			StoreInfo storeInfo = mainService.selectsStoreOne(snum);
			
			
			model.addAttribute("user",user);
			
			model.addAttribute("storeInfom",storeInfo);
			System.out.println("snum 은" +  storeInfo.getSnum());
			
			userService.schatWrite(chat);
						
			return "redirect:/";
		}
		
		//문의글 상세 조회
		@GetMapping(value="/schatR")
		public String sSelectOne (Chat chat, Model model) {
			System.out.println("selectOne 들어옴");

			model.addAttribute("selectOne", userService.selectOne(chat.getC_no()));
			
			List<ChatComment> commentList = userService.readComment(chat.getC_no());

			model.addAttribute("commentList", commentList);


			return "user/schatReadView";
		}

		//게시글 수정 화면
		@GetMapping(value="/schatU")
		public String supdateGet(Chat chat, Model model) {
			System.out.println("updateGet 들어옴");

			model.addAttribute("updateU", userService.selectOne(chat.getC_no()));

			return "user/schatUpdateView";
		}

		//게시글 수정 - db저장
		@PostMapping(value="/schatU")
		public String supdatePost(Chat chat) {
			System.out.println("update 들어옴");

			userService.update(chat);

			System.out.println(chat.toString() + "chatCon");

			return "redirect:/user/schat";

		}

		//게시글 삭제 - db저장
		@PostMapping(value="/schatD")

		public String sdelete(Chat chat) {
			System.out.println("delete 들어옴");

			userService.delete(chat.getC_no() );

			System.out.println("delete 반환");

			return "redirect:/user/schat";
		}

}
