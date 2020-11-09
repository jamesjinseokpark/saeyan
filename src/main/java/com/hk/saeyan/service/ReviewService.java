package com.hk.saeyan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.saeyan.dto.Review;
import com.hk.saeyan.mapper.ReviewMapper;

@Service
public class ReviewService {
	
	@Autowired
	ReviewMapper reviewMapper;
	
	public void rWrite(Review review) {
		reviewMapper.rWrite(review);
		
		reviewMapper.rCheckup(review.getOrderNum());
		
	}
	
	public List<Review> rList(){
		return reviewMapper.rList();
	}
	

}
