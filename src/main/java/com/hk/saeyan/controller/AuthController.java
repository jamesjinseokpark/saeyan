package com.hk.saeyan.controller;

import java.io.File;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hk.saeyan.dto.ItemList;
import com.hk.saeyan.dto.ManagerInfo;
import com.hk.saeyan.dto.MapData;
import com.hk.saeyan.dto.Members;
import com.hk.saeyan.dto.PersonalPay;
import com.hk.saeyan.dto.Stores;
import com.hk.saeyan.dto.UserInfo;
import com.hk.saeyan.service.AuthService;

@Controller
@RequestMapping("/auth")
public class AuthController {

	private static final Logger logger = LoggerFactory.getLogger(AuthRestController.class);

	
	@Autowired
	AuthService authService;
	
	@Autowired
	ServletContext sc;
	
	@GetMapping("/registration")
	public String choiceMemberType() {
		System.out.println("타니?");
		return "/auth/choiceMemberType";
	}
	
	@GetMapping("/addCustomer")
	public String addMemberGet(Members member) {
		return "/auth/addMember";
	} 
	
	@PostMapping("/addCustomer")
	public String addCustomerPost(Model model, UserInfo userInfo) {
		System.out.println("userInfo는"+userInfo);
		authService.addMembers(userInfo);
		return "redirect:/";
	}
	
	@GetMapping("/addOwner")
	public String addOwnerGet(Model model, Members member) {
		model.addAttribute("product", authService.selectPname());
		return "/auth/addOwner";
	}
	
	@PostMapping("/addOwner")
	public String addOwnerPost(@RequestParam("uploadFile") MultipartFile[] uploadFile, Model model, ManagerInfo managerInfo) {
		for(int i=0; i<uploadFile.length; i++) {
			 String uploadFolder = sc.getRealPath("/resources/upload/");
			 String uploadFileName = uploadFile[i].getOriginalFilename(); 
			 logger.info("---------------------------------");
	         logger.info("Upload File Name :"+uploadFile[i].getOriginalFilename());
	         logger.info("Upload File Size : " + uploadFile[i].getSize());
	         
	       //IE has file path
	            uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
	            logger.info("only file name : " + uploadFileName);
	            
	            //중복 방지를 위햔 UUID적용
	            //동일한 이름으로 업로드 되면 기존파일을 지운데 그래서 java.util.UUID의 값을 이용
	            UUID uuid = UUID.randomUUID();
	            uploadFileName = uuid.toString()+"_"+uploadFileName;
	            
//	            if(i==0 ) {managerInfo.setSp2(""); managerInfo.setSp3(""); managerInfo.setSp4("");}
//	            else if(i==1) {managerInfo.setSp3(""); managerInfo.setSp4("");}
//	            else if(i==2) {managerInfo.setSp4(""); }
	           
	            
	            if(i==0) {managerInfo.setSp1(""); managerInfo.setSp2(""); managerInfo.setSp3(""); managerInfo.setSp4("");}
	            else if(i==1) {managerInfo.setSp2(""); managerInfo.setSp3(""); managerInfo.setSp4("");}
	            else if(i==2) {managerInfo.setSp3(""); managerInfo.setSp4("");}
	            else if(i==3) {managerInfo.setSp4("");}
	            
	            if(i==0) {managerInfo.setSp1(uploadFileName);}
	            else if(i==1) {managerInfo.setSp2(uploadFileName);}
	            else if(i==2) {managerInfo.setSp3(uploadFileName);}
	            else if(i==3) {managerInfo.setSp4(uploadFileName);}
	           // stores.setSnum(snum);
	            System.out.println("uploadFile.length는"+uploadFile.length);
	            //File saveFile = new File(uploadFolder, uploadFileName);
	            File oldProfFile = new File(uploadFolder + uploadFile[i].getOriginalFilename());   // 업로드한 파일이 실제로 저장되는 위치  + 파일명 (확장자 포함) => 실행 디렉토리
	            File newProfFile = new File(uploadFolder + uploadFileName);
	            oldProfFile.renameTo(newProfFile);   // 파일명 변경
	           //logger.info("newProfFile = " + newProfFile);
	           try {
	              // 소스 디렉토리에 저장된 파일을 실행 디렉토리에 복사하라는 명령?
	              InputStream fileStream = uploadFile[i].getInputStream();
	              FileUtils.copyInputStreamToFile(fileStream, newProfFile);
	           } catch (Exception e) {
	              FileUtils.deleteQuietly(newProfFile);
	              e.printStackTrace();
	           }
			}
		System.out.println("managerInfo는"+managerInfo);
		authService.addManager(managerInfo);
		authService.addMapData(managerInfo);
		return "redirect:/";
	}
	
	@GetMapping("/findId")
	public String findIdGet() {
		return "/auth/findIdGet";
	}
	
	@PostMapping("/findId")
	public String findIdPost(Model model, Members members) {
		System.out.println("members에 아이디/이멜 있나 확인"+members);
		
		
		model.addAttribute("members", authService.findId(members));
		
		return "/auth/findIdPost";
	}
	
	@GetMapping("/findPwd")
	public String findPwd() {
		return "/auth/findPwd";
	}

}
