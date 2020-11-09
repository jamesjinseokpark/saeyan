package com.hk.saeyan.service;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.RequestParam;

import com.hk.saeyan.dto.Account;
import com.hk.saeyan.dto.Bubble;
import com.hk.saeyan.dto.Cart;
import com.hk.saeyan.dto.FinalPay;
import com.hk.saeyan.dto.ItemList;
import com.hk.saeyan.dto.ManagerInfo;
import com.hk.saeyan.dto.Members;
import com.hk.saeyan.dto.OrderList;
import com.hk.saeyan.dto.Price;
import com.hk.saeyan.dto.Product;
import com.hk.saeyan.dto.Review;
import com.hk.saeyan.dto.StoreInfo;
import com.hk.saeyan.dto.Stores;
import com.hk.saeyan.dto.UserInfo;
import com.hk.saeyan.mapper.MainMapper;

@Service
public class MainService {
	
	@Autowired
	DataSourceTransactionManager transactionManager;
	
	@Autowired
	MainMapper mainMapper;
	
	public List<Price> priceList(){
		return mainMapper.priceList();
	}
	
	public List<Stores> storesList(){
		return mainMapper.storesList();
	}
	
	public ManagerInfo userAdr(String id) {
		return mainMapper.userAdr(id);
	}
//	
//	public ItemList itemArry(String items){
//		return mainMapper.itemArry(items);
//	}//수정
	
	public StoreInfo selectsStoreOne(String snum) {
		
		return mainMapper.selectsStoreOne(snum);
	}
	
	public int likeStore(String id, String snum) {
		Members likeStores = mainMapper.selectLikeStore(id);
		System.out.println("likeStores.getLikeStore1()"+likeStores.getLikeStore1());
		System.out.println("snum은"+snum);
		if( likeStores.getLikeStore1() == null ) {
			System.out.println("찍히니1");
			mainMapper.updateLikeStore1(id, snum);
			return 1;
		} else if ( likeStores.getLikeStore2() == null) {
			System.out.println("찍히니2");
			mainMapper.updateLikeStore2(id, snum);
			return 2;
		} else if ( likeStores.getLikeStore3() == null) {
			System.out.println("찍히니3");
			mainMapper.updateLikeStore3(id, snum);
			return 3;
		} else if ( likeStores.getLikeStore1().equals(snum)) {
			System.out.println("likeStroe1에 있나?"+likeStores.getLikeStore1());
			mainMapper.deleteLikeStore1(id, snum);
			return 4;
		} else if ( likeStores.getLikeStore2().equals(snum)) {
			System.out.println("찍히니4");
			mainMapper.deleteLikeStore2(id, snum);
			return 5;
		} else if ( likeStores.getLikeStore3().equals(snum)) {
			System.out.println("찍히니5");
			mainMapper.deleteLikeStore3(id, snum);
			return 6;
		} else {
			return 7;
		}
	}
	
	public List<Product> price(){
		return mainMapper.price();
	}

	public int insert(Cart cart) {
		// TODO Auto-generated method stub
		return mainMapper.insert(cart);
		
	}
	//장바구니 상품확인 
	public int countCart(int cart_seq) {
		return mainMapper.countCart(cart_seq);
	}
	
	public List<Cart> userCart(String id) { //카트
		return mainMapper.userCart(id);
	}
	
	public int cartPrice(List<String> cart_seq){
		System.out.println(cart_seq.toString());
		for(int i=0;i<cart_seq.size();i++) {
//			System.out.println("cart_seq="+cart_seq.get(i));
		 String str = cart_seq.get(i);
		 System.out.println("str="+str);
		 String choice = str.substring(str.length()-1);
		 System.out.println("choice ="+choice);
		 int seq = Integer.parseInt(str.substring(0,str.length()-1));
		 System.out.println("seq ="+seq);
		 int ret = mainMapper.cartPrice(seq,choice);
//		 System.out.println("ret"+i+"="+ret);
		}
		return 1;
	}
	//장바구니 삭제
	public void deleteCart(int cart_seq) {
		 mainMapper.deleteCart(cart_seq);
		
	}
	
	public FinalPay userPay(String id) {
		return mainMapper.userPay(id);
		
	}

	public List<FinalPay> cartpay (String id){
		
		return mainMapper.cartpay(id);
	}
	

	//버블충전
	public int bubblePay(Bubble bubble,Account account) {
		
		TransactionStatus txStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());
		//TransactionStatus라는 것을 transactionManager로 부터 가져온다
		// Transaction Test
		try { 
			 mainMapper.bubblePay(bubble);
		} catch (Exception e) { 
			System.out.println("Service ------------------- End");
			// 비정상일때는 rollback
			transactionManager.rollback(txStatus);
			return 0;
		}
		// 정상일때는 commit 저장 (빼먹으면 안됨)
		transactionManager.commit(txStatus);
		return mainMapper.bubAcc(account);		
	}

	
	public int accpay(Account account) {
		return mainMapper.accpay(account);
	}
	
	@Transactional
	public int bubbleplus(Bubble bubble) {
		int bub;
		TransactionStatus txStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());
		//TransactionStatus라는 것을 transactionManager로 부터 가져온다
		// Transaction Test
		try { 
			bub = mainMapper.bubbleplus(bubble);	
		} catch (Exception e) { 
			System.out.println("Service ------------------- End");
			// 비정상일때는 rollback
			transactionManager.rollback(txStatus);
			return 0;
		}
		// 정상일때는 commit 저장 (빼먹으면 안됨)
		transactionManager.commit(txStatus);
		return bub;		
	}


	//최종결제
	public int finalPay(@RequestParam("pay_price[]") int[] pay_price,@RequestParam("items[]") String[] items,@RequestParam("snum[]") String[] snum,@RequestParam("sname[]") String[] sname,@RequestParam("bubble") int bubble,String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int ret=0;
		TransactionStatus txStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());
		//TransactionStatus라는 것을 transactionManager로 부터 가져온다
		// Transaction Test
		try { 
			for(int i=0;i<items.length;i++) {
				Date now = new Date();
		        SimpleDateFormat vans = new SimpleDateFormat("yyMMddhhmmss");
				String wdate = vans.format(now);
				int randomCode = new Random().nextInt(1000)+1000;
				String joinCode = String.valueOf(randomCode);
				String orderNum=wdate+joinCode;
				map.put("pay_price",pay_price[i]);
				map.put("items",items[i]);
				map.put("snum",snum[i]);
				map.put("sname",sname[i]);
				map.put("bubble",bubble);
				map.put("id", id);
				map.put("orderNum", orderNum);
				ret += mainMapper.finalPay(map);
			}
		} catch (Exception e) { 
			System.out.println("Service ------------------- End");
			// 비정상일때는 rollback
			transactionManager.rollback(txStatus);
			return 0;
		}
		// 정상일때는 commit 저장 (빼먹으면 안됨)
		transactionManager.commit(txStatus);
		 mainMapper.cartChk(id);
		return ret;	
	}
	
	//최종결제시 사용한 버블 
	public int bubblefinal(Bubble bubble1) {
			
		int ret = mainMapper.bubblefinal(bubble1);
			
			
		return ret;	
	}
	
	public int orderAcc(Account account) {
		
		return mainMapper.orderAcc(account);
		
	}
	
	//주문내역
	public List<OrderList> payCheck(String id,int ret){
		
		//System.out.println("서비스ret="+ret);
		
		return mainMapper.payCheck(id,ret);
	}

	// review 1015 james-------------------------------------------------------------
	public List<Review> reviewList(String snum){
		return mainMapper.reviewList(snum);
	}




}
