package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mapper.ReviewMapper;
import com.example.vo.Review;
import com.example.vo.ReviewPoint;
import com.example.vo.ReviewPointType;

@Service
@Transactional
public class ReviewService {

	@Autowired
	private ReviewMapper reviewMapper;
	
	public List<ReviewPointType> getAllPointTypes() {
		return reviewMapper.getAllPointTypes();
	}
	
	public void addReview(Review review, List<ReviewPoint> pointTypes) {
		reviewMapper.insertReview(review);
		
		for (ReviewPoint point : pointTypes) {
			point.setReviewNo(review.getReviewNo());
			point.setReviewPointNo(point.getReviewPointNo());
			reviewMapper.insertReviewPoint(point);
		}
	}
}
