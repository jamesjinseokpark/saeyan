package com.hk.saeyan.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hk.saeyan.dto.Members;
import com.hk.saeyan.dto.Review;
import com.hk.saeyan.service.ReviewService;
import com.hk.saeyan.service.UserService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	UserService userService;
	
	@GetMapping(value = "/rWrite")
	public String rWriteget() {
		return "review/review";
	}
	
	@PostMapping(value = "/rWrite")
	public String rWritePost(Model model, Review review, HttpSession session) {
		
		Members loginMember = (Members) session.getAttribute("loginMember");
		
		Members user = userService.selectUserOne(loginMember.getId());
		
		model.addAttribute("user", user);
		reviewService.rWrite(review);
		
		return "redirect:/";
		
	}
	
	//리뷰 목록 보기
	@GetMapping(value="/list")
	public String rList(Model model, Review review, HttpSession session) {
		
		model.addAttribute("rList", reviewService.rList());
		
		return "main/storesInfo";
	}
	
	
	
	
	
	

}
