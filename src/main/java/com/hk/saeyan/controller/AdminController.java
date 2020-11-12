package com.hk.saeyan.controller;

import java.io.File;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hk.saeyan.dto.Chat;
import com.hk.saeyan.dto.ChatComment;
import com.hk.saeyan.dto.Members;
import com.hk.saeyan.dto.PageMaker;
import com.hk.saeyan.dto.Price;
import com.hk.saeyan.dto.Product;
import com.hk.saeyan.dto.SearchCriteria;
import com.hk.saeyan.dto.StoreInfo;
import com.hk.saeyan.dto.Stores;
import com.hk.saeyan.dto.UserInfo;
import com.hk.saeyan.service.AdminService;
import com.hk.saeyan.service.ManagerService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
		@Autowired
		ManagerService managerService;
		
		@Autowired
		AdminService adminService;
		
		@Autowired
		ServletContext sc;
		
		@GetMapping("/memberList")
		public String memberList(Model model) {
			System.out.println("memberList...호출");
			model.addAttribute("memberList",managerService.memberList());
			return "/admin/memberList";
		}

		@GetMapping("/userUpdate")
		public String userUpdateGet(Model model,@RequestParam("id") String id) {
			System.out.println("UserUpdate...호출");

			UserInfo userInfo = adminService.userUpdateGet(id);
			
			System.out.println(userInfo.toString());
			model.addAttribute("userInfo",userInfo);
			
			return "/admin/userUpdateGet";
		}
		
		@PostMapping("/userUpdate")
		public String userUpdatePost(Model model, UserInfo userInfo) {
			System.out.println("바뀐 값:"+userInfo.toString());
			int ret = adminService.userUpdatePost(userInfo);
			System.out.println("정상적으로 수정되었나? "+ret);
			return "admin/userUpdatePost";
		}
		
		@GetMapping("/managerUpdate")
		public String managerUpdateGet(Model model,@RequestParam("id") String id) {
			System.out.println("ManagerUpdate...호출");
			
			Members members = adminService.managerUpdateGet1(id);
			model.addAttribute("members",members);
			List<Stores> stores = adminService.managerUpdateGet2(id);
			model.addAttribute("stores",stores);
			
			System.out.println(members.toString());
			System.out.println(stores.toString());
			return "/admin/managerUpdateGet";
		}
		
		@PostMapping("/managerUpdate")
		public String managerUpdatePost(Model model, Members members) {
			System.out.println("바뀐 값:"+members.toString());
			int ret = adminService.managerUpdatePost(members);
			System.out.println("정상적으로 수정되었나? "+ret);
			return "admin/userUpdatePost";
		}
		
		@GetMapping("/storeList")
		public String storeList(Model model) {
			System.out.println("storeList....호출...");
			model.addAttribute("stores",adminService.storeList());
			return "/admin/storeList";
		}
		
		@GetMapping("/storeUpdate")
		public String storeUpdateGet(Model model,@RequestParam("snum") String snum) {
			
			model.addAttribute("storeInfo",adminService.storeUpdateGet(snum));
			System.out.println(adminService.storeUpdateGet(snum).toString());
			List<Product> product = adminService.getProduct();
			model.addAttribute("product",product);
			System.out.println(product.toString());
			return "/admin/storeUpdateGet";
		}
		
		@PostMapping("/storeUpdate")
		public String storeUpdatePost(Model model,StoreInfo storeInfo, @RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2, @RequestParam("file3") MultipartFile file3, @RequestParam("file4") MultipartFile file4 ) {
			
			String oldFile1 = storeInfo.getSp1();
			String oldFile2 = storeInfo.getSp2();
			String oldFile3 = storeInfo.getSp3();
			String oldFile4 = storeInfo.getSp4();
			
			System.out.println("기존 사진"+oldFile1+oldFile2+oldFile3+oldFile4);
			
			String uploadFolder = sc.getRealPath("/resources/upload/");
			String newFile1 = file1.getOriginalFilename();
			newFile1 = newFile1.substring(newFile1.lastIndexOf("\\")+1);
			UUID uuid = UUID.randomUUID();
			newFile1 = uuid.toString()+"_"+newFile1;
			
			String newFile2 = file2.getOriginalFilename(); 
			newFile2 = newFile2.substring(newFile1.lastIndexOf("\\")+1);
			newFile2 = uuid.toString()+"_"+newFile2;
			
			String newFile3 = file3.getOriginalFilename(); 
			newFile3 = newFile3.substring(newFile1.lastIndexOf("\\")+1);
			newFile3 = uuid.toString()+"_"+newFile3;
					
			String newFile4 = file4.getOriginalFilename(); 
			newFile4 = newFile4.substring(newFile4.lastIndexOf("\\")+1);
			newFile4 = uuid.toString()+"_"+newFile4;
			
			if(file1.isEmpty()) {storeInfo.setSp1(oldFile1);}
			else {storeInfo.setSp1(newFile1);}
			
			if(file2.isEmpty()) {storeInfo.setSp2(oldFile2);}
			else {storeInfo.setSp2(newFile2);}
			
			if(file3.isEmpty()) {storeInfo.setSp3(oldFile3);}
			else {storeInfo.setSp3(newFile3);}
			
			if(file4.isEmpty()) {storeInfo.setSp4(oldFile4);}
			else {storeInfo.setSp4(newFile4);}
			
			File oldSaveFile1 = new File(uploadFolder+file1.getOriginalFilename());
			File newSaveFile1 = new File(uploadFolder+newFile1);
			oldSaveFile1.renameTo(newSaveFile1);
			
			File oldSaveFile2 = new File(uploadFolder+file2.getOriginalFilename());
			File newSaveFile2 = new File(uploadFolder+newFile2);
			oldSaveFile2.renameTo(newSaveFile2);
			
			File oldSaveFile3 = new File(uploadFolder+file3.getOriginalFilename());
			File newSaveFile3 = new File(uploadFolder+newFile3);
			oldSaveFile3.renameTo(newSaveFile3);
			
			File oldSaveFile4 = new File(uploadFolder+file4.getOriginalFilename());
			File newSaveFile4 = new File(uploadFolder+newFile4);
			oldSaveFile4.renameTo(newSaveFile4);
			
		    try {
	              // 소스 디렉토리에 저장된 파일을 실행 디렉토리에 복사하라는 명령?
	              InputStream fileStream = file1.getInputStream();
	              FileUtils.copyInputStreamToFile(fileStream, newSaveFile1);
	           } catch (Exception e) {
	              FileUtils.deleteQuietly(newSaveFile1);
	              e.printStackTrace();
	           }
		    
		    try {
	              // 소스 디렉토리에 저장된 파일을 실행 디렉토리에 복사하라는 명령?
	              InputStream fileStream = file2.getInputStream();
	              FileUtils.copyInputStreamToFile(fileStream, newSaveFile2);
	           } catch (Exception e) {
	              FileUtils.deleteQuietly(newSaveFile2);
	              e.printStackTrace();
	           }
		    
		    try {
	              // 소스 디렉토리에 저장된 파일을 실행 디렉토리에 복사하라는 명령?
	              InputStream fileStream = file3.getInputStream();
	              FileUtils.copyInputStreamToFile(fileStream, newSaveFile3);
	           } catch (Exception e) {
	              FileUtils.deleteQuietly(newSaveFile3);
	              e.printStackTrace();
	           }
		    
		    try {
	              // 소스 디렉토리에 저장된 파일을 실행 디렉토리에 복사하라는 명령?
	              InputStream fileStream = file4.getInputStream();
	              FileUtils.copyInputStreamToFile(fileStream, newSaveFile4);
	           } catch (Exception e) {
	              FileUtils.deleteQuietly(newSaveFile4);
	              e.printStackTrace();
	           }
			
			System.out.println("바뀐 값:"+storeInfo.toString());
			int ret = adminService.storeUpdatePost(storeInfo);
			System.out.println("정상적으로 수정되었나? "+ret);
			return "/admin/storeUpdatePost";
		}
		
		@GetMapping("/price")
		public String itemsPriceGet(Model model) {
			System.out.println("priceGet...호출");
			List<Product> itp = adminService.itemsPriceGet();
			System.out.println(itp.toString());
			model.addAttribute("itp",itp);
			return "/admin/itemsPriceGet";
		}
		
		@PostMapping("/price")
		public String itemsPricePost(Model model,Product product) {
			System.out.println("pricePost...호출");
			System.out.println(product);
			int ret = adminService.itemsPricePost(product);
			return "admin/itemsPricePost";
		}
		
		@GetMapping("/stat")
		public String statList(Model model) {
			System.out.println("statList....호출...");
			model.addAttribute("stores",adminService.storeList());
			return "/admin/statList";
		}
		
		@GetMapping("/statOne")
		public String statOne(Model model,@RequestParam("snum") String snum) {
			System.out.println("statOne....호출...");
			model.addAttribute("snum",snum);
			return "/admin/statOne";
		}
		
		@GetMapping("/assets")
		public String assetList(Model model) {
			System.out.println("assetList....호출...");
			model.addAttribute("stores",adminService.storeList());
			return "/admin/assetList";
		}
		
		@GetMapping("/assetOne")
		public String assetOne(Model model,@RequestParam("snum") String snum) {
			System.out.println("assetOne....호출...");
			model.addAttribute("asset",adminService.assetOne(snum));
			System.out.println(adminService.assetOne(snum).toString());
			return "/admin/assetOne";
		}
		
		@GetMapping("/account")
		public String accountList(Model model) {
			System.out.println("account....호출...");
			model.addAttribute("account",adminService.accountList());
			System.out.println(adminService.accountList().toString());
			return "/admin/accountList";
		}
		
		
		//--------------chat---------------------------------------------------------------------------------------------------------------------------------------------

		@GetMapping("/adminUpdate")
		public String selectMemberOne(Model model,HttpSession session) {

			Members loginMember = (Members) session.getAttribute("loginMember");
			Members admin = adminService.selectMemberOne(loginMember.getId());
			System.out.println(admin.toString());
			model.addAttribute("admin",admin);
			return "/admin/selectMemberOne";
		}

		//  Chat --------------------------------------------------------------------------------------

		//어드민 게시글 작성화면 101 수정 james
		@GetMapping(value="/aChatW")
		public String writeGet() {
			System.out.println("admin 글작성 페이지 호출");


			return "chat/aWriteView";
		}

		//어드민 게시글 작성 - db저장
		@PostMapping(value="/aChatW")
		public String writePost(Model model, Chat chat, HttpSession session) {
			System.out.println("글작성");

			Members loginMember = (Members) session.getAttribute("loginMember");

			System.out.println("admin 여기는 들어오지?");

			Members admin = adminService.selectMemberOne(loginMember.getGrade());

			System.out.println("회원등급은" + loginMember.getGrade());

			model.addAttribute("admin",admin);

			System.out.println("admin 여기도 오니?");

			adminService.write(chat);
			return "redirect:/admin/aChat";
		}

		//어드민 게시글 목록 조회
		@GetMapping(value="/aChat")
		public String list(SearchCriteria scri, Model model) {
			System.out.println("목록 조회 list 호출");
			model.addAttribute("list", adminService.list(scri));

			System.out.println(adminService.list(scri));

			PageMaker pageMaker = new PageMaker();

			pageMaker.setCri(scri);

			pageMaker.setTotalCount(adminService.listCount(scri));

			model.addAttribute("pageMaker", pageMaker);

			return "chat/aList";

		}

		//게시글 상세 조회 -댓글 목록 조회 가능(조회만 가능) james
		@GetMapping(value="/aChatR")
		public String selectOne (Chat chat, Model model) {
			System.out.println("selectOne 들어옴");

			model.addAttribute("selectOne", adminService.selectOne(chat.getC_no()));
			//			       글 목록에서 댓글 보기
			List<ChatComment> commentList = adminService.readComment(chat.getC_no());

			model.addAttribute("commentList", commentList);


			return "chat/aReadView";
		}

		//게시글 수정 화면
		@GetMapping(value="/aChatU")
		public String updateGet(Chat chat, Model model) {
			System.out.println("updateGet 들어옴");

			model.addAttribute("update", adminService.selectOne(chat.getC_no()));

			return "chat/aUpdateView";
		}

		//게시글 수정 - db저장
		@PostMapping(value="/aChatU")
		public String updatePost(Chat chat) {
			System.out.println("update 들어옴");

			adminService.update(chat);

			System.out.println(chat.toString() + "chatCon");

			return "redirect:/admin/aChat";

		}

		//게시글 삭제 - db저장
		@PostMapping(value="/aChatD")

		public String delete(Chat chat) {
			System.out.println("delete 들어옴");

			adminService.delete(chat.getC_no() );

			System.out.println("delete 반환");

			return "redirect:/admin/aChat";
		}

		//게시글 - 댓글달기 1009추가 james(관리자만 작성)

		@PostMapping(value="/aChatCom")

		public String writeCommentPost(ChatComment ccment, @Param("c_no")int c_no) {

			System.out.println("commentWrite-con check");

			adminService.writeComment(ccment);
			
			adminService.updateRplCnt(c_no);

			return "redirect:/admin/aChat";

		}

	}
