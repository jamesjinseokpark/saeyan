package com.hk.saeyan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.hk.saeyan.dto.Account;
import com.hk.saeyan.dto.Asset;
import com.hk.saeyan.dto.Chat;
import com.hk.saeyan.dto.ChatComment;
import com.hk.saeyan.dto.MapData;
import com.hk.saeyan.dto.Members;
import com.hk.saeyan.dto.Price;
import com.hk.saeyan.dto.Product;
import com.hk.saeyan.dto.SearchCriteria;
import com.hk.saeyan.dto.StatisticDay;
import com.hk.saeyan.dto.StoreInfo;
import com.hk.saeyan.dto.Stores;
import com.hk.saeyan.dto.StoresAsset;
import com.hk.saeyan.dto.UserInfo;
import com.hk.saeyan.mapper.AdminMapper;

@Service
public class AdminService {

	@Autowired
	AdminMapper adminMapper;
	
	@Autowired
	DataSourceTransactionManager transactionManager;
	
	public UserInfo userUpdateGet(String id) {
		
		return adminMapper.userUpdateGet(id);
	}
	
	public List<Product> getProduct(){
		return adminMapper.getProduct();
	}
	
	@Transactional
	public int userUpdatePost(UserInfo userInfo) {
		TransactionStatus txStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());
		
		if(userInfo.getCardCheck().equals("Y")) {
			try {
			adminMapper.userUpdatePost1(userInfo);
			adminMapper.userUpdatePost2(userInfo);
			} catch (Exception e){
				 transactionManager.rollback(txStatus);
				 return 0;
			}
			transactionManager.commit(txStatus);
		    return 1;    
		} else {
			if(userInfo.getCardCom()!=null) {
				userInfo.setCardCheck("Y");
				try {
				adminMapper.userUpdatePost1(userInfo);
				adminMapper.userInsertPost2(userInfo);
				} catch (Exception e) {
					transactionManager.rollback(txStatus);
					 return 0;
				}
				transactionManager.commit(txStatus);
			    return 1;    
			} else {
				int ret = adminMapper.userUpdatePost1(userInfo);
				return ret;
			}
		}
				
	}
	
	
	public Members managerUpdateGet1(String id) {
		
		return adminMapper.managerUpdateGet1(id);
	}
	
	public List<Stores> managerUpdateGet2(String id) {
		
		return adminMapper.managerUpdateGet2(id);
	}
	
	public int managerUpdatePost(Members members) {
		
		return adminMapper.managerUpdatePost(members);
	}
	
	public List<Stores> storeList(){
		
		return adminMapper.storeList();
	}
	
	public StoreInfo storeUpdateGet(String snum) {
		return adminMapper.storeUpdateGet(snum);
	}
	
	@Transactional
	public int storeUpdatePost(StoreInfo storeInfo) {
		TransactionStatus txStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());
		try {
		adminMapper.storeUpdatePost1(storeInfo);
		adminMapper.storeUpdatePost2(storeInfo);
		} catch (Exception e) {
			transactionManager.rollback(txStatus);
			return 0;
		}
		transactionManager.commit(txStatus);
	    return 1;  
	}
	
	public List<MapData> mapLoad() {
		return adminMapper.mapLoad();
	}
	
	public List<Product> itemsPriceGet() {
		return adminMapper.itemsPriceGet();
	}
	
	public int insertItem(Product product) {
		return adminMapper.insertItem(product);
	}
	
	public int itemsPricePost(Product product) {
		return adminMapper.itemsPricePost(product);
	}
	
	public int deleteItem(int pno) {
		return adminMapper.deleteItem(pno);
	}

	public List<StatisticDay> chartData(String snum,String pStart,String pEnd) {
		return adminMapper.chartData(snum,pStart,pEnd);
	}
	
	public List<Asset> assetOne(String snum){
		return adminMapper.assetOne(snum);
	}
	public List<Asset> assetAcheck(){
		return adminMapper.assetAcheck();
	}
	
	@Transactional
	public int assetAcheckPost(String asset_seq,String a_check) {
		TransactionStatus txStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());
		StoresAsset storesAsset = new StoresAsset();
		Account account = new Account();
		adminMapper.assetAcheckPost(asset_seq,a_check);
		if(a_check.equals("Y")) {
			try {
				storesAsset = adminMapper.selectIdPrice(asset_seq);
				account = adminMapper.selectBalanceSeq();
			} catch (Exception e) {
				transactionManager.rollback(txStatus);
				return 0;
			}
			transactionManager.commit(txStatus);
		    			
			account.setId(storesAsset.getId());
			account.setO_price(storesAsset.getA_price());
			
			if(storesAsset!=null&&account!=null) {
				adminMapper.assetAddAccount(account);
				return 1;
			}
		}
		return 1;
	}
	
	public List<Account> accountList(){
		return adminMapper.accountList();
	}
	
	
	// 관리자 one
	public Members selectMemberOne(String id) {

		return adminMapper.selectMemberOne(id);
	}
	//  admin chat 1011 james------------------------------------------------------------------------------------------------------
	//어드민 게시글 작성
	public void write(Chat chat) {

		System.out.println("chatService-write 호출");

		System.out.println(chat.toString());

		adminMapper.write(chat);

	}

	//어드민 게시글 목록 조회
	public List<Chat> list(SearchCriteria scri){

		System.out.println("chatService-list 호출");

		return adminMapper.list(scri);
	}

	//어드민 게시물 총 개수
	public int listCount(SearchCriteria scri) {

		System.out.println("chatService-listCount 호출");

		return adminMapper.listCount(scri);
	}

	//게시물 상세 조회하기
	public Chat selectOne(int c_no) {

		System.out.println("chatService-selectOne 호출");
		return adminMapper.selectOne(c_no);
	}

	//게시글 수정

	public void update(Chat chat) {
		System.out.println("chatService-update 호출");

		System.out.println(chat.toString()+"chatService");

		adminMapper.update(chat);

	}

	//게시글 삭제하기

	public void delete(int c_no) {
		System.out.println("chatService-delete 호출");

		adminMapper.delete(c_no);

	}

	//작성 댓글 조회 -----------------------------------관리자 외 작성권한 없음 1009

	public List<ChatComment> readComment(int c_no){

		System.out.println("게시글-코멘트 읽으러 들어옴-ok");

		return adminMapper.readComment(c_no);
	}

	//댓글 작성하기
	public void writeComment(ChatComment ccment) {

		System.out.println("ccmentService -writeComment 호출");

		System.out.println(ccment.toString());

		adminMapper.writeComment(ccment);


	}
	
	public void updateRplCnt(int c_no) {
		adminMapper.updateRplCnt(c_no);
	


	}



}