package com.gdu.app13.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gdu.app13.domain.BlogDTO;
import com.gdu.app13.domain.MemberDTO;

@Service
public class BlogServiceImpl implements BlogService {
  
  

  @Override
  public void loadBlogList(HttpServletRequest request, Model model) {
    // TODO Auto-generated method stub

  }

  @Override
  public void addBlog(HttpServletRequest request, HttpServletResponse response) {
   // 요청 파라미터
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    int blogNo = Integer.parseInt(request.getParameter("title"));
    
    // DB로 보낼 BlogDTO 만들기
    MemberDTO memberDTO = new MemberDTO();
    memberDTO.setMemberNo(blogNo);;
    BlogDTO blogDTO = new BlogDTO();
    blogDTO.setTitle(title);;
    blogDTO.setContent(content);
    blogDTO.setMemberDTO(memberDTO);
    
    
  }

}
