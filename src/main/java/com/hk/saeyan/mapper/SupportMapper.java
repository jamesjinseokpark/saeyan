package com.hk.saeyan.mapper;

import java.util.List;

import com.hk.saeyan.dto.Notice;
import com.hk.saeyan.dto.SearchCriteria;

public interface SupportMapper {
	
	public List<Notice> noticeList(SearchCriteria scri);// 공지사항 글 목록
	
	public int noticeListCount (SearchCriteria scri); //공지사항페이지 총 게시글 수
	
	public Notice selectOne(int  n_seq); //공지사항 글 상세 조회
	
	public void write(Notice notice); //문의게시판 게시글작성
	
	public void update(Notice notice); // 게시글 수정하기

	public void delete(int n_seq); // 게시글 삭제하기

}
