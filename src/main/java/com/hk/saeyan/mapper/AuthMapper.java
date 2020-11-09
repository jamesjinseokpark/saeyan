package com.hk.saeyan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hk.saeyan.dto.EmailCheck;
import com.hk.saeyan.dto.ItemList;
import com.hk.saeyan.dto.ManagerInfo;
import com.hk.saeyan.dto.MemberLikeStores;
import com.hk.saeyan.dto.Members;
import com.hk.saeyan.dto.PersonalPay;
import com.hk.saeyan.dto.Product;
import com.hk.saeyan.dto.Stores;
import com.hk.saeyan.dto.UserInfo;

public interface AuthMapper {

	public int addPersonalPay(UserInfo userInfo);
		
	public Members checkId(@Param("id") String id);
	
	public Members checkEmail(String email);
	
	public int addMembers(UserInfo userInfo);
	
	public int addManager(ManagerInfo managerInfo);
	
	public List<Product> selectPname();
	
	public int addStores(ManagerInfo managerInfo);
	
	public int addItemList(ManagerInfo managerInfo);
	
	public int addMapData(ManagerInfo managerInfo);
	
	public int addEmailCheck(EmailCheck emailCheck);
	
	public String getDbCode(String email);
	
	public Members findId(Members members);
	
	public int updateRandomPwd(Members members);
	
	public void uploadAjaxPost(Stores stores);
	
	public MemberLikeStores getLikeStore1(String id);
	
	public MemberLikeStores getLikeStore2(String id);
	
	public MemberLikeStores getLikeStore3(String id);
}
