package com.example.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.service.ReviewService;
import com.example.vo.Review;
import com.example.vo.ReviewPoint;
import com.example.web.form.ReviewInsertForm;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@PostMapping("/review")
	public String addReview(ReviewInsertForm form) {
		
		// loginException 추가해야 됨
		// 고객테이블/티켓테이블 조인, 티켓테이블의 영화 취소여부가 N이면 리뷰등록 ㄱㄴ
		
		Review review = Review.builder()
				.movieNo(form.getMovieNo())
				.customerNo(form.getCustomerNo())
				.reviewScore(form.getReviewScore())
				.reviewContent(form.getContent())
				.build();
		
		List<ReviewPoint> reviewPoints = new ArrayList<>();
		List<Integer> pointNo = form.getPointNo();
		
		for (Integer point : pointNo) {
			ReviewPoint reviewPoint = new ReviewPoint();
			reviewPoint.setReviewNo(review.getReviewNo());
			reviewPoint.setReviewPointNo(point);
			
			reviewPoints.add(reviewPoint);
		}
		reviewService.addReview(review, reviewPoints);
		
		return "redirect:detail?no=" + form.getMovieNo();
	}
}
