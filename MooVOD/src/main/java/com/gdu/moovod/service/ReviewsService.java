package com.gdu.moovod.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.gdu.moovod.domain.ReviewsDTO;

public interface ReviewsService {
	
  
  //reviewsBoard 서비스
	public List<ReviewsDTO> getReviewsList();
	public int addReviews(HttpServletRequest request);
	public ReviewsDTO getReviewsByNo(HttpServletRequest request);
	public void modifyReviews(HttpServletRequest request, HttpServletResponse response);
	public void removeReviews(HttpServletRequest request, HttpServletResponse response);
	
	//pagination 서비스
	public void getReviewsListUsingPagination(HttpServletRequest request, Model model);
	
	
	//search
	
	public void getReviewsListUsingSearch(HttpServletRequest request, Model model);

 
}
	
