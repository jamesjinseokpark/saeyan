package com.hk.saeyan.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hk.saeyan.dto.Members;
import com.hk.saeyan.service.MemberService;

@Controller
@RequestMapping("/auth")
public class LoginController {
	
	@Autowired
	MemberService memberService;
	
	@GetMapping("/login")
	public String loginGet(Model model) {
		return "auth/loginGet";
	}
	
	@PostMapping("/login")
	public String loginPost(HttpSession session, RedirectAttributes reattr, Model model, Members members) {
		System.out.println("타니1");
		System.out.println("members는"+members);
		Members loginMember = memberService.memberLogin(members);
		if(loginMember==null) {
			reattr.addFlashAttribute("msg", false);
			return "redirect:/auth/login";
		} else if (loginMember.getUdCheck().equals("Y")){
			reattr.addFlashAttribute("deleted", false);
			return "redirect:/auth/login";
		} else {
			session.setAttribute("loginMember", loginMember);
			session.setAttribute("name", loginMember.getName());	
			return "redirect:/";
		}
		
		
	}
	
	@GetMapping("/logout")
	public String memberLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
