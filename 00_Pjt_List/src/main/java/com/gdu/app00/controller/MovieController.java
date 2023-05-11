package com.gdu.app00.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.dto.ReviewDto;
import com.example.service.ReviewService;
import com.example.vo.ReviewPointType;

@Controller
public class MovieController {

	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("/movie/list")
	public String movieList() {
		return "/movie/list";
	}
	
	@GetMapping("/movie/detail")
	public String movieDetail(int no, Model model) {
		List<ReviewPointType> pointTypes = reviewService.getAllPointTypes();
		
		model.addAttribute("pointTypes", pointTypes);
		
		return "/movie/detail";
	}
}
