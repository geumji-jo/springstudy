package com.gdu.app09.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gdu.app09.service.EmployeeListService;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeListService employeeListService;
	
	@GetMapping("/employees/pagination.do")
	public String  pagination(HttpServletRequest request, Model model) {
		employeeListService.getEmployeeListUsingPagination(request, model);
		return "employees/pagination";
	}
	
	@GetMapping("/employees/change/record.do")
	public String changeRecord(HttpSession session
			                 , HttpServletRequest request
			                 , @RequestParam(value="recordPerPage", required=false, defaultValue="10") int recordPerPage) {
		session.setAttribute("recordPerPage", recordPerPage);
		return "redirect:" + request.getHeader("referer");	// 현재 주소(/employees/change/record.do)의 이전 주소(Referer)
	}

	

	@GetMapping("/employees/scroll.page")
	public String scrollPage() {
		return "employees/scroll";
	}
	
	@ResponseBody// ajax로 반환시켜주는 애너테이션
	@GetMapping(value="/employees/scroll.do", produces="application/json")
	public Map<String, Object> scroll(HttpServletRequest request) {
		return employeeListService.getEmployeeListUsingScroll(request);
	}
	
	
	@GetMapping("/employees/search.do")
	public String search(HttpServletRequest request, Model model) {
		employeeListService.getEmployeeListUsingSearch(request, model);
		return "employees/search";
	}
	@ResponseBody// ajax로 반환시켜주는 애너테이션(jsp로 읽혀지지 않게 해줌)
	@GetMapping(value="/employees/autoComplete.do", produces="application/json")
	public Map<String, Object> autoComplete(HttpServletRequest request) {
		return employeeListService.getAutoComplete(request);
	}
	
}
