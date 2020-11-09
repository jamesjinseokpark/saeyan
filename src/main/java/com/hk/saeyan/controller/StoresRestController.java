package com.hk.saeyan.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hk.saeyan.dto.Members;
import com.hk.saeyan.service.MainService;

@RestController
public class StoresRestController {

	@Autowired
	MainService mainService;
	
	@RequestMapping(path="/likeStore", method=RequestMethod.POST, produces=MediaType.APPLICATION_JSON_VALUE)
	public int likeStore(@RequestParam("id") String id, @RequestParam("snum") String snum,HttpSession session) {
		System.out.println("관심점포ajax");
		System.out.println("snum은"+snum);
		int ret = mainService.likeStore(id, snum);
		Members loginMember = (Members) session.getAttribute("loginMember");
		if(ret==1) {
			loginMember.setLikeStore1(snum);
		} else if(ret==2) {
			loginMember.setLikeStore2(snum);
		} else if(ret==3) {
			loginMember.setLikeStore3(snum);
		} else if(ret==4) {
			loginMember.setLikeStore1(null);
		} else if(ret==5) {
			loginMember.setLikeStore2(null);
		} else if(ret==6) {
			loginMember.setLikeStore3(null);
		}
		int result;
		if(ret==1 || ret==2 || ret==3) {
			result=0;
		} else if(ret==4 || ret==5 || ret==6){
			result=1;
		} else {
			result=2;
		}
				
		return result;
	}
}
