package com.hk.saeyan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hk.saeyan.dto.Account;
import com.hk.saeyan.dto.Asset;
import com.hk.saeyan.dto.Chat;
import com.hk.saeyan.dto.ChatComment;
import com.hk.saeyan.dto.MapData;
import com.hk.saeyan.dto.Members;
import com.hk.saeyan.dto.Product;
import com.hk.saeyan.dto.SearchCriteria;
import com.hk.saeyan.dto.StatisticDay;
import com.hk.saeyan.dto.StoreInfo;
import com.hk.saeyan.dto.Stores;
import com.hk.saeyan.dto.StoresAsset;
import com.hk.saeyan.dto.UserInfo;

@Repository
public interface AdminMapper {
	
	public UserInfo userUpdateGet(String id);
	
	public List<Product> getProduct();
	
	public int userUpdatePost1(UserInfo userInfo); //유저 정보 변경시 Member 테이블 수정
	
	public int userUpdatePost2(UserInfo userInfo); //유저 정보 변경시 PersonalPay 테이블 수정
	
	public int userInsertPost2(UserInfo userInfo); //유저 정보 변경시 PersonalPay 테이블 추가
	
	public Members managerUpdateGet1(String id); //업주 정보 변경시 Member 테이블 수정
	
	public List<Stores> managerUpdateGet2(String id); //업체 정보 리스트 출력
	
	public int managerUpdatePost(Members members); //업주 정보 수정
	
	public List<Stores> storeList();  //업체 리스트 출력
	
	public StoreInfo storeUpdateGet(String snum); //업체 상세 정보 출력
	
	public int storeUpdatePost1(StoreInfo storeInfo); //업체 정보 수정1 (Stores)
	
	public int storeUpdatePost2(StoreInfo storeInfo); //업체 정보 수정2 (itemList)
	
	public List<MapData> mapLoad(); //맵 정보를 실시간으로 가져오는 ajax
	
	public List<Product> itemsPriceGet(); //가격표 불러오기
	
	public int insertItem(Product product); //품목 추가하기
	
	public int deleteItem(int pno); //품목 제거하기
	
	public int itemsPricePost(Product product); //제품 수정하기
	
	public List<StatisticDay> chartData(@Param("snum") String snum,@Param("pStart") String pStart,@Param("pEnd") String pEnd); //일일 통계 불러오기
	
	public List<Asset> assetOne(String snum); // 업체별 정산 가져오기
	
	public List<Asset> assetAcheck(); // 미정산 업체 가져오기
	
	public int assetAcheckPost(@Param("asset_seq") String asset_seq,@Param("a_check") String a_check); // 정산 상태 변경
	
	public StoresAsset selectIdPrice(@Param("asset_seq") String asset_seq); // 정산용 id와 price를 가져옴
	
	public Account selectBalanceSeq(); //마지막 seq와 balance값 가져오기

	public int assetAddAccount(Account account); //관리자 자산내역에 정산내역 넣기
	
	public List<Account> accountList(); //관리자 자산 리스트 가져오기
	
	
	//  admin chat 1013 james--------------------------------------------------------------------------------------------------------------------------------

	public Members selectMemberOne(String id); // 관리의 개인정보 호출
	
	public void write(Chat chat); //문의게시판 게시글작성

	public List<Chat> list(SearchCriteria cri); //게시글 목록 조회

	public int listCount(SearchCriteria scri); //게시글 총 개수

	public Chat selectOne(int c_no); //게시글 상세보기

	public void update(Chat chat); // 게시글 수정하기

	public void delete(int c_no); // 게시글 삭제하기
	//	admin 1013 chatComment--------------------------------------------------------------------------------------------------------------------------
	public void writeComment(ChatComment ccment); //댓글 작성
	public List<ChatComment> readComment(int c_no); //작성 댓글 조회
	public void updateRplCnt(int c_no);
}


