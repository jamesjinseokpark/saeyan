package com.hk.saeyan.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hk.saeyan.dto.Account;
import com.hk.saeyan.dto.Bubble;
import com.hk.saeyan.dto.Chat;
import com.hk.saeyan.dto.ChatComment;
import com.hk.saeyan.dto.Members;
import com.hk.saeyan.dto.OrderList;
import com.hk.saeyan.dto.OrderProcess;
import com.hk.saeyan.dto.PersonalPay;
import com.hk.saeyan.dto.Review;
import com.hk.saeyan.dto.SearchCriteria;
import com.hk.saeyan.dto.UserInfo;
import com.hk.saeyan.mapper.AuthMapper;
import com.hk.saeyan.mapper.UserMapper;


@Service
public class UserService {

	@Autowired
	DataSourceTransactionManager transactionManager;
	
	@Autowired
	UserMapper userMapper;

	public Members selectUserOne(String id) {

		return userMapper.selectUserOne(id);
	}

	public PersonalPay selectUserPay(String id) {
		return userMapper.selectUserPay(id);
	}

	// user 개인정보 수정
	public int userUpdate(UserInfo userInfo) {
		int ret1 = userMapper.userUpdate(userInfo); 
		//int ret2 = userMapper.payUpdate(userInfo);
		System.out.println("ret1="+ret1);
		if(ret1==1 ) {
			return 1;
		} else {
			return 0; 
		} 
	}

	//user 카드정보 업데이트
	public int payUpdate(UserInfo userInfo) {
		if(userMapper.selectUserPay(userInfo.getId())==null) {
			int ret1 = userMapper.insertCard(userInfo);
			userMapper.updateCardCheck(userInfo);
			if(ret1==1) {
				return 1;
			} else {
				return 0;
			}
		} else {
			int ret2 = userMapper.payUpdate(userInfo);
			if(ret2 == 1) {
				return 1;
			} else {
				return 0;
			}
		}
	}
	
	//user 카드정보 삭제
	public int cardDelete(String id) {
		int ret = userMapper.cardDelete(id);
		userMapper.updateCardCheckToN(id);
		if(ret == 0) {
			return 0;
		} else {
			return 1;
		}
	}

	//user 탈퇴

	public Members deleteUserOne(String id) {

		return userMapper.deleteUserOne(id);
	}

	public int userDeleterPost(Members members) {
		return userMapper.userDeleterPost(members);
	}

	//버블리스트출력

	public List<Bubble> bubbleList(String id) {
		return userMapper.bubbleList(id);
	}

	//주문내역출력
	public List<OrderList> orderList(String id) {
		return userMapper.orderList(id);
	}

	public OrderProcess myOrderList(String orderNum) {
		return userMapper.myOrderList(orderNum);
	}
	
	public int refundCheck(@Param("id") String id,@Param("orderNum")String orderNum,@Param("bubble") int bubble) {
		
		TransactionStatus txStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());
		//TransactionStatus라는 것을 transactionManager로 부터 가져온다
		// Transaction Test
		try { 
			 userMapper.refundCheck(id,orderNum,bubble);
			 
			 
		} catch (Exception e) { 
			System.out.println("Service ------------------- End");
			// 비정상일때는 rollback
			transactionManager.rollback(txStatus);
			return 0;
		}
		// 정상일때는 commit 저장 (빼먹으면 안됨)
		transactionManager.commit(txStatus);
		
		return  userMapper.refundPro(id,orderNum);		
	}
	
	public int accRefunt(Account account) {
		return userMapper.accRefunt(account);
	}
	// 1013 chat------------------------------------------------------------------------------------------------------
	//게시글 작성
	public void write(Chat chat) {

		System.out.println("chatService-write 호출");

		System.out.println(chat.toString());

		userMapper.write(chat);

	}

	//게시글 목록 조회
	public List<Chat> list(SearchCriteria scri, String logId){

		System.out.println("chatService-list 호출");

		return userMapper.list(scri, logId);
	}

	//게시물 총 개수
	public int listCount(SearchCriteria scri) {

		System.out.println("chatService-listCount 호출");

		return userMapper.listCount(scri);
	}

	//게시물 상세 조회하기
	public Chat selectOne(int c_no) {

		System.out.println("chatService-selectOne 호출");
		return userMapper.selectOne(c_no);
	}

	//게시글 수정

	public void update(Chat chat) {
		System.out.println("chatService-update 호출");

		System.out.println(chat.toString()+"chatService");

		userMapper.update(chat);

	}

	//게시글 삭제하기

	public void delete(int c_no) {
		System.out.println("chatService-delete 호출");

		userMapper.delete(c_no);

	}

	//작성 댓글 조회 —————————————————관리자 외 작성권한 없음 1009

	public List<ChatComment> readComment(int c_no){

		System.out.println("게시글-코멘트 읽으러 들어옴-ok");

		return userMapper.readComment(c_no);
	}

	//  chat user to manager 1019 james ------------------------------------------------------------------------------------------------

	public List<Chat> schatList(SearchCriteria scri, String logId){
		return userMapper.schatList(scri, logId);
	}

	public void schatWrite(Chat chat) {

		System.out.println(" 유저 문의 chatService-write 호출");

		System.out.println(chat.toString());

		userMapper.schatWrite(chat);

	}
	
	//문의글 수정

	public void updateU(Chat chat) {
		System.out.println("chatService-update 호출");

		System.out.println(chat.toString()+"chatService");

		userMapper.updateU(chat);

	}

	//문의글 삭제하기

	public void deleteU(int c_no) {
		System.out.println("chatService-delete 호출");

		userMapper.deleteU(c_no);

	}
	
	// review ----------------------------------------------------------------------------------------
	
	public List<Review> reviewListU(String logId){
		return userMapper.reviewListU(logId);
	}
	

	
	




}	

