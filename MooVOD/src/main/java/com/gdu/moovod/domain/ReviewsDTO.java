package com.gdu.moovod.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewsDTO {
	
	private int reviewNo;
  private int vodNo;
	private String reviewTitle;
	private String id;
	private String reviewContent;
	private Timestamp reviewCreatedAt;
	private Timestamp reviewModifiedAt;
	private int reviewHits;
	private double reviewStar;

}