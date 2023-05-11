package com.example.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Review {

	private long reviewNo;
	private int customerNo;
	private int movieNo;
	private int reviewScore;
	private String reviewContent;
	private Date createdDate;
}
