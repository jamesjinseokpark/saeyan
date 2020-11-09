package com.hk.saeyan.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hk.saeyan.dto.Members;
import com.hk.saeyan.dto.Notice;
import com.hk.saeyan.dto.PageMaker;
import com.hk.saeyan.dto.SearchCriteria;
import com.hk.saeyan.service.AdminService;
import com.hk.saeyan.service.SupportService;

@Controller
@RequestMapping("/support")
public class SupportController {

	@Autowired
	SupportService supportService;
	
	@Autowired
	AdminService adminService;

	@GetMapping(value="/notice")
	public String noticeList(SearchCriteria scri, Model model) {
		System.out.println("공지사항 list 호출");

		model.addAttribute("noticeList", supportService.noticeList(scri));

		System.out.println(supportService.noticeList(scri));

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCri(scri);

		pageMaker.setTotalCount(supportService.noticeListCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "notice/list";

	}

	//게시글 상세 조회
	@GetMapping(value="/noticeR")
	public String selectOne (Notice notice, Model model) {
		System.out.println("notice-selectOne 들어옴");

		model.addAttribute("selectOne", supportService.selectOne(notice.getN_seq()));
		//			       글 목록에서 댓글 보기
		//			List<noticeComment> commentList = supportService.readComment(notice.getC_no());
		//
		//			model.addAttribute("commentList", commentList);


		return "notice/readView";
	}

	//어드민 게시글 작성화면 101 수정 james
	@GetMapping(value="/noticeW")
	public String writeGet() {
		System.out.println("admin 글작성 페이지 호출");


		return "notice/writeView";
	}

	//어드민 게시글 작성 - db저장
	@PostMapping(value="/noticeW")
	public String writePost(Model model, Notice notice, HttpSession session) {
		System.out.println("글작성");

		Members loginMember = (Members) session.getAttribute("loginMember");

		System.out.println("admin 여기는 들어오지?");

		Members admin = adminService.selectMemberOne(loginMember.getGrade());

		System.out.println("회원등급은" + loginMember.getGrade());

		model.addAttribute("admin",admin);

		System.out.println("admin 여기도 오니?");

		supportService.write(notice);
		return "redirect:/support/notice";
	}

	//게시글 수정 화면
	@GetMapping(value="/noticeU")
	public String updateGet(Notice notice, Model model) {
		System.out.println("updateGet 들어옴");

		model.addAttribute("update", supportService.selectOne(notice.getN_seq()));

		return "notice/updateView";
	}

	//게시글 수정 - db저장
	@PostMapping(value="/noticeU")
	public String updatePost(Notice notice) {
		System.out.println("update 들어옴");

		supportService.update(notice);

		System.out.println(notice.toString() + "noticeCon");

		return "redirect:/support/notice";

	}

	//게시글 삭제 - db저장
	@PostMapping(value="/noticeD")

	public String delete(Notice notice) {
		System.out.println("delete 들어옴");

		supportService.delete(notice.getN_seq() );

		System.out.println("delete 반환");

		return "redirect:/support/notice";
	}
	@GetMapping("/faq")
	public String use() {
		
		
		return "main/faq";
	}

}
