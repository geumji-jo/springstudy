<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <div class="nabar navbar-inverse">
     <div class="container">
         <div class="navbar-header">
             <a href="/jf/main.jf" class="navbar-brand"><img style=" margin: -12px; height: 40px;" alt="" src="http://img.cgv.co.kr/R2014/images/title/h1_cgv.png"></a>
         </div>
         <ul class="nav navbar-nav">
             <li><a href="adminform.jf?pno=1" class="dropdown-toggle" data-toggle="dropdown">관리자</a></li>
             <li><a href="movielist.jf?pno=1" class="dropdown-toggle" data-toggle="dropdown">영화리스트</a></li>
             <li><a href="screeningmovielist.jf?pno=1">상영관리</a></li>
             <li><a href="questionlist.jf?pno=1">Q&amp;A</a></li>
             <li><a href="noticelist.jf?pno=1">공지등록</a></li>
             <li><a href="eventlist.jf?pno=1">이벤트관리</a></li>
         </ul>

         <ul class="nav navbar-nav navbar-right">
             <li><a href="/jf/member/process_logout.jf">로그아웃</a></li>
         </ul>
         <p class="navbar-text  navbar-right">관리자님환영합니다</p>
     </div>
 </div>