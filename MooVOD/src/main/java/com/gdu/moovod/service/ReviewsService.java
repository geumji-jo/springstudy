package com.gdu.moovod.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.gdu.moovod.domain.ReviewsDTO;

public interface ReviewsService {
	
  
  //reviewsBoard 서비스
	public void getReviewsList(HttpServletRequest request,Model model);
	public int addReviews(HttpServletRequest request);
	public ReviewsDTO getReviewsByNo(HttpServletRequest request);
	public void modifyReviews(HttpServletRequest request, HttpServletResponse response);
	public void removeReviews(HttpServletRequest request, HttpServletResponse response);
	
	//pagination 서비스
	//public void getReviewsListUsingPagination(HttpServletRequest request, Model model);
	 //public void getReviewsList(HttpServletRequest request, Model model);
	//public void getReviewsListUsingSearch(HttpServletRequest request, Model model);
  public Map<String, Object> getAutoComplete(HttpServletRequest request);

 
}
	
