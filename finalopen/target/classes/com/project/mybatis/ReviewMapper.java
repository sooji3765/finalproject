package com.project.mybatis;

import java.util.List;

import com.project.review.Review;

public interface ReviewMapper {
	public void insertReview(Review review);
	public Review checkPw(String password);
	public List<Review> selectAll();
	public Review selectOne(String title);
	
}
