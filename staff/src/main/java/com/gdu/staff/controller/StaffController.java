package com.gdu.staff.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gdu.staff.domain.StaffDTO;
import com.gdu.staff.service.StaffService;

@Controller
public class StaffController {
	
	@Autowired
	private StaffService staffService;
	
	@ResponseBody		//jsp가 아니라 요청한 곳으로 곧바로 보내주는 애너테이션//애너테이션이 없으면 return값을jsp로 인식한다
	@GetMapping(value="/list.json", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<StaffDTO> list1() {
		return staffService.getStaffList1();
	}
	
	
	
	@ResponseBody	//jsp가 아니라 요청한 곳으로 곧바로 보내주는 애너테이션//애너테이션이 없으면 return값을jsp로 인식한다
	@PostMapping(value="/add.do", produces = "text/plain; charset=UTF-8")
	public String add1(HttpServletRequest request) {
		return staffService.addStaff1(request);
	}
	
	@ResponseBody
	@GetMapping(value="/query.json", produces=MediaType.APPLICATION_JSON_VALUE)
	public List<StaffDTO> searchStaff(@RequestParam String sno) {
	    StaffDTO staffDTO = new StaffDTO(sno, null, null, 0); // 나머지 검색 조건은 null/0 처리
	    List<StaffDTO> searchResult = staffService.getSearch(staffDTO);
	    return searchResult;
	}
	
}
