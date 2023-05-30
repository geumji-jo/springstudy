package com.gdu.moovod.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.moovod.domain.ReviewsDTO;

@Mapper
public interface ReviewsMapper {
	
	//public List<ReviewsDTO> getReviewsList();
	public int insertReviews(ReviewsDTO reviewsDTO);
	public ReviewsDTO selectReviewsByNo(int reviewNo);
	public int up(int reviewNo);
	public int updateReviews(ReviewsDTO reviewsDTO);
	public int deleteReviews(int reviewNo);
	
	
	//pagination 서비스
	public int getReviewsCount();
  public List<ReviewsDTO> getReviewsList(Map<String, Object> map);
  public List<ReviewsDTO> getReviewsListUsingSearch(Map<String, Object> map);
  public int getReviewsSearchCount(Map<String, Object> map);
  public List<ReviewsDTO> getAutoComplete(Map<String, Object> map);

  
 


}