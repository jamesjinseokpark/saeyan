package com.hk.saeyan.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.hk.saeyan.dto.EmailCheck;
import com.hk.saeyan.dto.Members;
import com.hk.saeyan.mapper.AuthMapper;
import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException;

@Service
public class EmailService {
	
	public final JavaMailSender javaMailSender;
	
	@Autowired
	AuthMapper authMapper;
	
//	public int addJoinCode(String joinCode) {
//		return authMapper.addJoinCode(joinCode);
//	}
//	
//	public int addEmail(String email) {
//		return authMapper.addEmail(email);
//	}
//	
	
	public EmailService(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}
	
	public boolean send(String subject, String text, String from, String to) {
		MimeMessage message = javaMailSender.createMimeMessage();
		
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setSubject(subject);
			helper.setText(text);
			helper.setFrom(from);
			helper.setTo(to);
			
			javaMailSender.send(message);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public int addEmailCheck(EmailCheck emailCheck) {
		return authMapper.addEmailCheck(emailCheck);
	}
	
	public String getDbCode(String email) {
		return authMapper.getDbCode(email);
	}
	
	public int updateRandomPwd(Members members) {
		return authMapper.updateRandomPwd(members);
	}
}
