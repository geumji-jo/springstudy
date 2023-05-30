package com.gdu.moovod.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.moovod.service.ReviewsService;

@RequestMapping("/board/reviews")
@Controller
public class ReviewsController {

  @Autowired
  private ReviewsService reviewsService;

// reviewsBoard 컨트롤러


  
  @GetMapping("/list.do")
  public String list(HttpServletRequest request, Model model) {
    reviewsService.getReviewsList(request, model);
    return "board/reviews/list";
  }
  


  @GetMapping("/write.do")
  public String write() {
    return "board/reviews/write";
  }

  @PostMapping("/add.do")
  public String add(HttpServletRequest request, RedirectAttributes redirectAttributes) {
    redirectAttributes.addFlashAttribute("addResult", reviewsService.addReviews(request));
    return "redirect:/board/reviews/list.do";
  }

  @GetMapping("/detail.do")
  public String detail(HttpServletRequest request, Model model) {
    model.addAttribute("r", reviewsService.getReviewsByNo(request));
    return "board/reviews/detail";
  }

  // modifyBoard() 서비스 내부에 location.href를 이용한 /board/detail.do 이동이 있기 때문에 응답할
  // View를 반환하지 않는다.
  @PostMapping("/modify.do")
  public void modify(HttpServletRequest request, HttpServletResponse response) {
    reviewsService.modifyReviews(request, response);
  }

  // removeBoard() 서비스 내부에 location.href를 이용한 /board/list.do 이동이 있기 때문에 응답할 View를
  // 반환하지 않는다.
  @PostMapping("/remove.do")
  public void remove(HttpServletRequest request, HttpServletResponse response) {
    reviewsService.removeReviews(request, response);
  }

// pagination 컨트롤러

  @GetMapping("/change/record.do")
  public String changeRecord(HttpSession session, HttpServletRequest request,
      @RequestParam(value = "recordPerPage", required = false, defaultValue = "10") int recordPerPage) {
    session.setAttribute("recordPerPage", recordPerPage);
    return "redirect:" + request.getHeader("referer"); // 현재 주소(/employees/change/record.do)의 이전 주소(Referer)로 이동하시오.
  }
  
  
  @ResponseBody
  @GetMapping(value="/autoComplete.do", produces="application/json")
  public Map<String, Object> autoComplete(HttpServletRequest request) {
    return reviewsService.getAutoComplete(request);
  }
  

}