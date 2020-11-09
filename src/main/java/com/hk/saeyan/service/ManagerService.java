package com.hk.saeyan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.hk.saeyan.dto.Chat;
import com.hk.saeyan.dto.ChatComment;
import com.hk.saeyan.dto.MapData;
import com.hk.saeyan.dto.Members;
import com.hk.saeyan.dto.OrderProcess;
import com.hk.saeyan.dto.Review;
import com.hk.saeyan.dto.SearchCriteria;
import com.hk.saeyan.dto.StoreInfo;
import com.hk.saeyan.dto.Stores;
import com.hk.saeyan.mapper.ManagerMapper;

@Service
public class ManagerService {

   @Autowired
   ManagerMapper managerMapper;

   @Autowired
   DataSourceTransactionManager transactionManager;

   public List<Members> memberList(){
      return managerMapper.memberList();
   }

   public String pwdCheck(String id, String pwd){
      System.out.println("서비스들어옴");
      Members checkMember = managerMapper.pwdCheck(id,pwd);
      System.out.println("서비스 실행완료");
      if(checkMember==null) {
         return "N";  //비번이 일치하지않음
      } else {
         return "Y";  //비번이 일치함
      }
   }


   // 업체정보 추가
    @Transactional
   public int storeAdd(StoreInfo storeInfo) { 
       TransactionStatus txStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());    
      try {
       managerMapper.storeAdd(storeInfo);
      managerMapper.itemListAdd(storeInfo);
      } catch (Exception e) {
         transactionManager.rollback(txStatus);
            return 0;
      }
       transactionManager.commit(txStatus);
         return 1;    
   }

   //업체정보 추가2-MapData테이블에도 데이터 insert
   public int mapDataAdd(StoreInfo storeInfo) {
      int ret = managerMapper.mapDataAdd(storeInfo);
      return ret;
   }

   // 전체 업체 리스트
   public List<Stores> myStoresList(String id) {

      return managerMapper.myStoresList(id);
   }

   // 업체 1개 상세정보
   public StoreInfo selectStoreOne(String snum) {

      return managerMapper.selectStoreOne(snum);
   }

   // 업체 정보 수정1
    @Transactional
   public int storeUpdate(StoreInfo storeInfo) {
       TransactionStatus txStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());    
          try {
             managerMapper.storeUpdate(storeInfo); 
             managerMapper.itemListUpdate(storeInfo);
          } catch (Exception e) {
             transactionManager.rollback(txStatus);
               return 0;
         }
          transactionManager.commit(txStatus);
            return 1;   
   }

   // 업체 정보 삭제(sdcheck=>true)
   public int storeDelete(String snum) {

      int ret = managerMapper.storeDelete(snum);

      return ret;
   }


	//업체 정보 수정2
	public int mapDataUpdate(MapData mapData) {
		int ret = managerMapper.mapDataUpdate(mapData);
		if(ret == 1) {
			return 1;
		} else {
			return 0;
		}
	}

   // 업주의 개인정보 호출 + 업주 탈퇴 확인을 위한 호출
   public Members selectMemberOne(String id) {


      return managerMapper.selectMemberOne(id);
   }

   // 업주 개인정보 수정
   public int ownerUpdate(Members members) {
      return managerMapper.ownerUpdate(members);
   }

   // 업주 개인정보 삭제
   public int ownerDeleterPost(String id) {
      return managerMapper.ownerDeleterPost(id);
   }

   // 업체 오더리스트 호출
   public List<OrderProcess> managerOrderList(String snum) {
      return managerMapper.managerOrderList(snum);
   }

   // 주문 내역 상세 보기
   public OrderProcess managerOrderInfo(String orderNum) {
      return managerMapper.managerOrderInfo(orderNum);
   }

   // 상태 실시간 ajax 변경
   public int managerProcess(String orderNum, String process) {
      System.out.println("managerProcess...호출");
      System.out.println("orderNum="+orderNum+":::::process ="+process);
      int ret = managerMapper.managerProcess(orderNum,process);
      System.out.println("실시간으로 상태가 잘 업데이트 되었나? ="+ret);
      return ret;
   }
	// review 1015 james-------------------------------------------------------------
	public List<Review> reviewList(String snum){
		return managerMapper.reviewList(snum);
	}

	//  chat------------------------------------------------------------------------------------------------------
	//게시글 작성
	public void write(Chat chat) {

		System.out.println("chatService-write 호출");

		System.out.println(chat.toString());

		managerMapper.write(chat);

	}

	//게시글 목록 조회
	public List<Chat> list(SearchCriteria scri, String logId){

		System.out.println("chatService-list 호출");

		return managerMapper.list(scri, logId);
	}

	//게시물 총 개수
	public int listCount(SearchCriteria scri) {

		System.out.println("chatService-listCount 호출");

		return managerMapper.listCount(scri);
	}

	//게시물 상세 조회하기
	public Chat selectOne(int c_no) {

		System.out.println("chatService-selectOne 호출");
		return managerMapper.selectOne(c_no);
	}

	//게시글 수정

	public void update(Chat chat) {
		System.out.println("chatService-update 호출");

		System.out.println(chat.toString()+"chatService");

		managerMapper.update(chat);

	}

	//게시글 삭제하기

	public void delete(int c_no) {
		System.out.println("chatService-delete 호출");

		managerMapper.delete(c_no);

	}

	//작성 댓글 조회 —————————————————관리자 외 작성권한 없음 1009

	public List<ChatComment> readComment(int c_no){

		System.out.println("게시글-코멘트 읽으러 들어옴-ok");

		return managerMapper.readComment(c_no);
	}

	//  chat  manager from user 1019 james ------------------------------------------------------------------------------------------------

	public List<Chat> schatList(String snum){
		return managerMapper.schatList(snum);
	}
	
	public void writeComment(ChatComment ccment) {
		
		System.out.println("manager - ccmentService -writeComment 호출");

		System.out.println(ccment.toString());

		managerMapper.writeComment(ccment);
		
	}
	
	public void updateRplCnt(int c_no) {
		managerMapper.updateRplCnt(c_no);
	


	}


}	



