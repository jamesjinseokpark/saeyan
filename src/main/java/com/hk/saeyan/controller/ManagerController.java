package com.hk.saeyan.controller;

import java.io.File;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.annotations.Param;
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

import com.hk.saeyan.dto.Chat;
import com.hk.saeyan.dto.ChatComment;
import com.hk.saeyan.dto.MapData;
import com.hk.saeyan.dto.Members;
import com.hk.saeyan.dto.PageMaker;
import com.hk.saeyan.dto.SearchCriteria;
import com.hk.saeyan.dto.StoreInfo;
import com.hk.saeyan.service.AdminService;
import com.hk.saeyan.service.ManagerService;
import com.hk.saeyan.service.UserService;

@Controller
@RequestMapping("/manager")
public class ManagerController {

   private static final Logger logger = LoggerFactory.getLogger(AuthRestController.class);

   @Autowired
   ManagerService managerService;

   @Autowired
   UserService userService;

   @Autowired
   AdminService adminService;
   
   @Autowired
   ServletContext sc;

   @GetMapping("/add")
   public String StoreAddGet(Model model) {
      System.out.println("StoreAddGet...호출");
      model.addAttribute("product",adminService.getProduct());
      return "/manager/storeAddGet";
   }

   @PostMapping("/add")
   public String StoreAddPost(@RequestParam("uploadFile") MultipartFile[] uploadFile, Model model,StoreInfo storeInfo ) {
      for(int i=0; i<uploadFile.length; i++) {
         String uploadFolder = sc.getRealPath("/resources/upload/");
         String uploadFileName = uploadFile[i].getOriginalFilename(); 

         uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);

         UUID uuid = UUID.randomUUID();
         uploadFileName = uuid.toString()+"_"+uploadFileName;

         if(i==0) {storeInfo.setSp1(""); storeInfo.setSp2(""); storeInfo.setSp3(""); storeInfo.setSp4("");}
         else if(i==1) {storeInfo.setSp2(""); storeInfo.setSp3(""); storeInfo.setSp4("");}
         else if(i==2) {storeInfo.setSp3(""); storeInfo.setSp4("");}
         else if(i==3) {storeInfo.setSp4("");}
         
         if(i==0) {storeInfo.setSp1(uploadFileName);}
         else if(i==1) {storeInfo.setSp2(uploadFileName);}
         else if(i==2) {storeInfo.setSp3(uploadFileName);}
         else if(i==3) {storeInfo.setSp4(uploadFileName);}

         File saveFile = new File(uploadFolder, uploadFileName);
         try {
            uploadFile[i].transferTo(saveFile);
         }catch (Exception e) {
            logger.error(e.getMessage());
         }//end catch
      }
      System.out.println("StoreAddPost...호출");
      System.out.println("점포정보 잘들어왔나? =>" + storeInfo.toString());

      int ret = managerService.storeAdd(storeInfo);
      managerService.mapDataAdd(storeInfo);
      System.out.println("점포정보 성공적으로 DB에 등록됬나? =>" + ret);

      return "/manager/storeAddPost";
   }

   @GetMapping("/update")
   public String myStoresList(HttpServletRequest request,Model model,HttpSession session) {
      Members loginMember = (Members) session.getAttribute("loginMember");
      System.out.println(loginMember.toString());
      model.addAttribute("url", request.getRequestURI());
      model.addAttribute("storeslist",managerService.myStoresList(loginMember.getId()));
      return "/manager/storesList";
   }

   @GetMapping("/updateOne")
   public String selectStoreOne(@RequestParam("snum") String snum,Model model,HttpSession session) {
      System.out.println(snum);
      StoreInfo storeInfo = managerService.selectStoreOne(snum);
      System.out.println(storeInfo.toString());
      model.addAttribute("product",adminService.getProduct());
      model.addAttribute("storeInfo",storeInfo);
      return "/manager/selectStoreOne";
   }


	@PostMapping("/updateOne")
	public String storeUpdate(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2, 
							  @RequestParam("file3") MultipartFile file3, @RequestParam("file4") MultipartFile file4, Model model,StoreInfo storeInfo, MapData mapData ) {
		System.out.println(storeInfo.toString());
		System.out.println("StoreUpdate...호출");
		System.out.println("점포업데이트 잘들어왔나? =>" + storeInfo.toString());
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
		int ret = managerService.storeUpdate(storeInfo);
		managerService.mapDataUpdate(mapData);
		System.out.println("점포정보 성공적으로 DB에 등록됬나? =>" + ret);

      return "/manager/storeUpdate";
   }

   @GetMapping("/delete")
   public String storeDeleteList(HttpServletRequest request,Model model,HttpSession session) {
      Members loginMember = (Members) session.getAttribute("loginMember");
      System.out.println(loginMember.toString());
      model.addAttribute("url", request.getRequestURI());
      model.addAttribute("storeslist",managerService.myStoresList(loginMember.getId()));
      return "/manager/storesList";
   }

   @GetMapping("/deleteOne")
   public String selectDeleteOne(@RequestParam("snum") String snum,Model model,HttpSession session) {
      System.out.println(snum);
      StoreInfo storeInfo = managerService.selectStoreOne(snum);
      System.out.println(storeInfo.toString());
      model.addAttribute("storeInfo",storeInfo);
      return "/manager/selectDeleteOne";
   }

   @PostMapping("/deleteOne")
   public String storeDelete(@RequestParam("snum") String snum,Model model) {
      System.out.println("storeDelete...호출");
      //System.out.println("점포업데이트 잘들어왔나? =>" + storeInfo.toString());
      int ret = managerService.storeDelete(snum);
      System.out.println("점포정보 성공적으로 삭제 됬나? =>" + ret);
      return "/manager/storeDelete";
   }

   @GetMapping("/ownerUpdate")
   public String selectMemberOne(Model model,HttpSession session) {

      Members loginMember = (Members) session.getAttribute("loginMember");
      Members owner = managerService.selectMemberOne(loginMember.getId());
      System.out.println(owner.toString());
      model.addAttribute("owner",owner);
      return "/manager/selectMemberOne";
   }

   @PostMapping("/ownerUpdate")
   public String ownerUpdate(Model model,Members members) {
      System.out.println("memberUpdate...호출");
      System.out.println("업주정보 잘들어갔나? =>" + members.toString());
      int ret = managerService.ownerUpdate(members);
      System.out.println("업주정보 성공적으로 수정 됬나? =>" + ret);
      return "/manager/ownerUpdate";
   }

   @GetMapping("/ownerDelete")
   public String ownerDeleteGet(Model model,HttpSession session) {
      Members loginMember = (Members) session.getAttribute("loginMember");
      Members owner = managerService.selectMemberOne(loginMember.getId());
      System.out.println("업주 정보 로드가 잘 됬나?" +owner.toString());
      model.addAttribute("owner",owner);
      return "/manager/ownerDeleteGet";
   }

   @PostMapping("/ownerDelete")
   public String ownerDeleterPost(@RequestParam("id") String id,Model model) {
      System.out.println("ownerDeleterPost...호출");
      //System.out.println("점포업데이트 잘들어왔나? =>" + storeInfo.toString());
      int ret = managerService.ownerDeleterPost(id);
      System.out.println("업주정보 성공적으로 삭제 됬나? =>" + ret);
      return "/manager/ownerDeleterPost";
   }

   @GetMapping("/process")
   public String process(HttpServletRequest request,Model model,HttpSession session) {
      Members loginMember = (Members) session.getAttribute("loginMember");
      System.out.println(loginMember.toString());
      model.addAttribute("url", request.getRequestURI());
      model.addAttribute("storeslist",managerService.myStoresList(loginMember.getId()));
      return "/manager/storesList";
   }

   @GetMapping("/processOne")
   public String managerOrderList(@RequestParam("snum") String snum,Model model) {
      model.addAttribute("managerOrderList",managerService.managerOrderList(snum));
      return "/manager/managerOrderList";
   }

   @GetMapping("/orderInfo")
   public String managerOrderInfo(@RequestParam("orderNum") String orderNum,Model model) {
      model.addAttribute("managerOrderInfo",managerService.managerOrderInfo(orderNum));
      return "/manager/managerOrderInfo";
   }

   @GetMapping("/stat")
   public String stat(HttpServletRequest request,Model model,HttpSession session) {
      Members loginMember = (Members) session.getAttribute("loginMember");
      model.addAttribute("url", request.getRequestURI());
      model.addAttribute("storeslist",managerService.myStoresList(loginMember.getId()));
      return "/manager/storesList";
   }

   @GetMapping("/statOne")
   public String managerStatOne(@RequestParam("snum") String snum,Model model) {
      model.addAttribute("snum",snum);
      return "/manager/statOne";
   }
   
   @GetMapping("/assets")
   public String assetList(Model model,HttpSession session) {
      System.out.println("assetList....호출...");
      Members loginMember = (Members) session.getAttribute("loginMember");
      model.addAttribute("stores",managerService.myStoresList(loginMember.getId()));
      return "/manager/assetStoreList";
   }
   
   @GetMapping("/assetOne")
   public String assetOne(Model model,@RequestParam("snum") String snum) {
      System.out.println("assetOne....호출...");
      model.addAttribute("asset",adminService.assetOne(snum));
      System.out.println(adminService.assetOne(snum).toString());
      return "/manager/assetOne";
   }
	//  Review 1015 -------------------------------------------------------------------------------

	@GetMapping("/review")
	public String myReviewList(HttpServletRequest request,Model model,HttpSession session) {
		Members loginMember = (Members) session.getAttribute("loginMember");
		System.out.println(loginMember.toString());
		model.addAttribute("url", request.getRequestURI());
		model.addAttribute("storeslist",managerService.myStoresList(loginMember.getId()));

		return "/manager/reviewList";
	}

	@GetMapping("/reviewOne")
	public String selectReviewOne(@RequestParam("snum") String snum,Model model,HttpSession session) {
		System.out.println(snum);
		StoreInfo storeInfo = managerService.selectStoreOne(snum);
		System.out.println(storeInfo.toString());
		model.addAttribute("storeInfo",storeInfo);
		model.addAttribute("reviewList", managerService.reviewList(snum));
		return "/manager/selectReviewOne";
	}

	//  Chat choice board type  --------------------------------------------------------------------------------------

	//게시판 선택 페이지
	@GetMapping(value="/aChat")
	public String choiceBoardType() {
		return "/chat/choiceBoardType";
	}



	// chat manager to admin 1019 james---------------------------------------------------------------


	//게시글 작성화면  ( manager to admin)
	@GetMapping(value="/aChatW")
	public String writeGet() {
		System.out.println("글작성 페이지 호출");


		return "chat/writeView";
	}

	//게시글 작성 - db저장  ( manager to admin)
	@PostMapping(value="/aChatW")
	public String writePost(Model model, Chat chat, HttpSession session) {
		System.out.println("글작성");

		Members loginMember = (Members) session.getAttribute("loginMember");
		Members user = userService.selectUserOne(loginMember.getId());

		model.addAttribute("user",user);

		managerService.write(chat);
		return "redirect:/manager/aChatL";
	}

	//게시글 목록 조회  ( manager to admin)
	@GetMapping(value="/aChatL")
	public String list(SearchCriteria scri, Model model, HttpSession session) {
		System.out.println("목록 조회 list 호출");

		Members loginMember = (Members) session.getAttribute("loginMember");

		String logId = loginMember.getId();

		System.out.println("넌 누구니 ? 난 " + logId);

		model.addAttribute("list", managerService.list(scri, logId));

		System.out.println(managerService.list(scri, logId));

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCri(scri);

		pageMaker.setTotalCount(managerService.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "chat/list";

	}

	//게시글 상세 조회  ( manager to admin)
	@GetMapping(value="/aChatR")
	public String selectOne (Chat chat, Model model) {
		System.out.println("selectOne 들어옴");

		model.addAttribute("selectOne", managerService.selectOne(chat.getC_no()));
		//			       글 목록에서 댓글 보기
		List<ChatComment> commentList = managerService.readComment(chat.getC_no());

		model.addAttribute("commentList", commentList);


		return "chat/readView";
	}

	//게시글 수정 화면  ( manager to admin)
	@GetMapping(value="/aChatU")
	public String updateGet(Chat chat, Model model) {
		System.out.println("updateGet 들어옴");

		model.addAttribute("update", managerService.selectOne(chat.getC_no()));

		return "chat/updateView";
	}

	//게시글 수정 - db저장  ( manager to admin)
	@PostMapping(value="/aChatU")
	public String updatePost(Chat chat) {
		System.out.println("update 들어옴");

		managerService.update(chat);

		System.out.println(chat.toString() + "chatCon");

		return "redirect:/manager/aChatL";

	}

	//게시글 삭제 - db저장  ( manager to admin)
	@PostMapping(value="/aChatD")

	public String delete(Chat chat) {
		System.out.println("delete 들어옴");

		managerService.delete(chat.getC_no() );

		System.out.println("delete 반환");

		return "redirect:/manager/aChatL";
	}

	// chat manager from user 1019 james ------------------------------------------------------------------------------

	@GetMapping("/schat") //문의게시판 - 업체리스트 선택페이지
	public String mySchatList(HttpServletRequest request,Model model,HttpSession session) {
		Members loginMember = (Members) session.getAttribute("loginMember");
		System.out.println(loginMember.toString());
		model.addAttribute("url", request.getRequestURI());
		model.addAttribute("storeslist",managerService.myStoresList(loginMember.getId()));

		return "/manager/schatList";
	}

	@GetMapping("/schatOne") //업체 1개 선택 
	public String selectSnumOne(@RequestParam("snum") String snum,Model model,HttpSession session) {
		System.out.println(snum);
		StoreInfo storeInfo = managerService.selectStoreOne(snum);
		System.out.println(storeInfo.toString());
		model.addAttribute("storeInfo",storeInfo);
		model.addAttribute("schatList", managerService.schatList(snum));
		return "/manager/selectSchatOne";

	}

	//문의글 상세 조회
	@GetMapping(value="/schatR")
	public String sSelectOne (Chat chat, Model model) {
		System.out.println("selectOne 들어옴");

		model.addAttribute("selectOne", managerService.selectOne(chat.getC_no()));

		List<ChatComment> commentList = managerService.readComment(chat.getC_no());

		model.addAttribute("commentList", commentList);


		return "manager/schatReadView";
	}

	//문의글  - 댓글달기 1020추가 james(업주만 작성 유저는 읽기만)

	@PostMapping(value="/schatCom")

	public String writeCommentPost(ChatComment ccment, @Param("c_no")int c_no) {

		System.out.println("manager commentWrite-con 들어옴");

		managerService.writeComment(ccment);
		
		managerService.updateRplCnt(c_no);

		return "redirect:/manager/schat";

	}








}
