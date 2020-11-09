package com.hk.saeyan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.saeyan.dto.Notice;
import com.hk.saeyan.dto.SearchCriteria;
import com.hk.saeyan.mapper.SupportMapper;

@Service
public class SupportService {

	@Autowired
	SupportMapper supportMapper;

	public List<Notice> noticeList(SearchCriteria scri){

		return supportMapper.noticeList(scri);
	}
	//게시물 총 개수
	public int noticeListCount(SearchCriteria scri) {

		System.out.println("noticeService-listCount 호출");

		return supportMapper.noticeListCount(scri);
	}

	//게시물 상세 조회하기
	public Notice selectOne(int n_seq) {

		System.out.println("noticeService-selectOne 호출");
		return supportMapper.selectOne(n_seq);
	}
	
	//어드민 게시글 작성
		public void write(Notice notice) {

			System.out.println("noticeService-write 호출");

			System.out.println(notice.toString());

			supportMapper.write(notice);

		}
		
		//게시글 수정

		public void update(Notice notice) {
			System.out.println("noticeService-update 호출");

			System.out.println(notice.toString()+"noticeService");

			supportMapper.update(notice);

		}

		//게시글 삭제하기

		public void delete(int n_seq) {
			System.out.println("noticeService-delete 호출");

			supportMapper.delete(n_seq);

		}
		
		


}
