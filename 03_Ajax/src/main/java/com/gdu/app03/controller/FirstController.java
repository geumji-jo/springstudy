package com.gdu.app03.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gdu.app03.domain.Person;
import com.gdu.app03.service.FirstServiceImpl;

@Controller
public class FirstController {
	
	
	
	@ResponseBody	// 메소드의 반환 값을 Jsp이름이 아니다. 응답하는 값(데이터)이다.(요청한 곳으로 보내는 데이터이다.)
	@GetMapping(value="/first/ajax1", produces = "application/json")	// produces : 응답할 데이터의 MINE TYPE
	public Person ajax1(HttpServletRequest request) {
		return (new FirstServiceImpl()).execute1(request);
	}
	
	

}
