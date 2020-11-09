package com.hk.saeyan.mapper;

import java.util.List;

import com.hk.saeyan.dto.Review;

public interface ReviewMapper {
	
	public void rWrite(Review review);
	
	public void rCheckup(String orderNum);
	
	public List<Review> rList();
	

}
