package com.hk.saeyan.controller;

import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hk.saeyan.dto.EmailCheck;
import com.hk.saeyan.dto.Members;
import com.hk.saeyan.service.EmailService;

@RestController
public class EmailRestController {
	
	@Autowired
	EmailService emailService;
	
	@RequestMapping(path="/createEmailCheck", method = RequestMethod.POST, produces=MediaType.APPLICATION_JSON_VALUE)
	public boolean sendMail(EmailCheck emailCheck) {

		int randomCode = new Random().nextInt(10000)+1000;
		String joinCode = String.valueOf(randomCode);
		
//		emailService.addJoinCode(joinCode);
//		emailService.addEmail(email);
//		System.out.println("입력받은 email:"+ email);
//		
//		emailService.addEmailCheck(email, joinCode);
		emailCheck.setJoinCode(joinCode);
		System.out.println("EmailCheck vo는"+emailCheck);
		String email = emailCheck.getEmail();
		System.out.println("email은"+ email);
		emailService.addEmailCheck(emailCheck);
		
		String subject = "회원가입을 위한 인증 이메일 입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("이메일 인증번호는").append(joinCode).append("입니다.");
		return emailService.send(subject, sb.toString(), "sungbun0214@gmail.com", email);
		
	}
	
	@RequestMapping(path="/checkCode11", method= RequestMethod.POST, produces=MediaType.APPLICATION_JSON_VALUE)
	public String checkCode(Model model, @RequestParam("email") String email, @RequestParam("checkCode") String checkCode) {
		String dbJoinCode = emailService.getDbCode(email);
		if(checkCode.equals(dbJoinCode)) {
			return "0";
		} else {
			return "1";
		}
	}
	
	@RequestMapping(path="/creatRandomPwd", method = RequestMethod.POST, produces=MediaType.APPLICATION_JSON_VALUE)
	public boolean sendRandomPwd(Members members) {

		String randomPwd=UUID.randomUUID().toString().replaceAll("-", "");
		for(int i=0; i<5; i++) {
			randomPwd=randomPwd.substring(0,8);
		}
		members.setPwd(randomPwd);
		String email = members.getEmail();
//		emailService.addJoinCode(joinCode);
//		emailService.addEmail(email);
//		System.out.println("입력받은 email:"+ email);
//		
//		emailService.addEmailCheck(email, joinCode);
		
		//System.out.println("EmailCheck vo는"+emailCheck);
		//String email = emailCheck.getEmail();
		//System.out.println("email은"+ email);
		emailService.updateRandomPwd(members);
		
		String subject = "안녕하세요 새얀입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("임시 비밀번호는").append(randomPwd).append("입니다.");
		return emailService.send(subject, sb.toString(), "sungbun0214@gmail.com", email);
		
	}

}
