package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.dto.ReviewDto;
import com.example.vo.Review;
import com.example.vo.ReviewPoint;
import com.example.vo.ReviewPointType;

@Mapper
public interface ReviewMapper {

	Review getReviewByNo(int reviewNo);
	void insertReview(Review review);
	void insertReviewPoint(ReviewPoint reviewPoint);
	int getReviewsTotalByMovieNo(int movieNo);
	List<ReviewPointType> getAllPointTypes();
	List<ReviewDto> getAllReviewsByMovieNo(int movieNo);
}
