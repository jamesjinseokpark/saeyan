package com.hk.saeyan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.saeyan.dto.Members;
import com.hk.saeyan.mapper.MemberMapper;

@Service
public class MemberService {
	
	@Autowired
	MemberMapper memberMapper;
	
	public Members memberLogin(Members members) {
		return memberMapper.memberLogin(members);
	}

}
