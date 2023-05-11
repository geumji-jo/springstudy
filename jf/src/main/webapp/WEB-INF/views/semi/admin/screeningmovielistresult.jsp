<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="bootstrap-3.3.2-dist/js/jquery.min.js"></script>
  <script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
</head>
<body  style="background-color: #fdfcf0;">
	<div>
		<div class="nabar navbar-inverse">
	        <div class="container" >
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
		            <li><a href="">로그아웃</a></li>
		        </ul>
		        <p class="navbar-text  navbar-right">관리자님환영합니다</p>
		    </div>
	    </div>
	
	   	<div class="container">
	   		<div style="margin-top: 40px; margin-bottom: 40px;">
			    <FONT face="Impact" style="font-size: 50px;">
					
				</FONT>
	   		</div>
		    <div class="row">
            <div class="col-sm-12 text-right">
                <form action="screeningmovielistresult.jf" class="form-inline">
                    <select name="opt" style="height:28px;">
                        <option value="korTitle" ${param.opt eq 'movie_kortitle' ? 'selected' : '' }> 영화제목</option>
                    </select>
                    <input type="hidden" name="pno" value="1" />
                    <input id="searchtext" type="text" class="c_input" title="검색어 입력" placeholder="검색어 입력" name="keyword" style="width:185px; padding-top:3px;" value="">
                    <button type="submit" class="btn" id="btn_header_search">검색하기</button>
                </form>
            </div>
        </div>
        <hr />
		    <br />
		    <form action="deletescreening.jf">
			    <table class="table table-condensed table-hover" >
			       
			        <thead style="background-color: black; color: white;">
			            <tr>
			                <th class="col-sm-1"></th>
			                <th class="col-sm-1">번호</th>
			                <th class="col-sm-3">제목</th>
			                <th class="col-sm-2">영화관</th>
			                <th class="col-sm-1">상영관</th>
			                <th class="col-sm-2">상영일</th>
			                <th class="col-sm-2">상영시간</th>
			            </tr>
			        </thead>
			        <tbody class="active">
			        	<c:choose>
				        	<c:when test="${not empty details }">
					            <c:forEach var="detail" items="${details}"> 
						            <tr>
						                <td><input type="checkbox" name="box" value="${detail.no }" class="checkSelect"></td>
						                <td>${detail.no }</td>
						                <td>${detail.korTitle }</td>
						                <td>${detail.theaterName }</td>
						                <td>${detail.roomName }</td>
						                <td><fmt:formatDate value="${detail.screeningDate }"/></td>
						                <td>${detail.time }</td>
						            </tr>
					            </c:forEach>
				            </c:when>
				            <c:otherwise>
					            <tr>
					                <td colspan="5" class="text-center">조회된 글이 없습니다.</td>
					            </tr>
				            </c:otherwise>
						</c:choose>
			        </tbody>
			    </table>
			    <br />
			    <div class="text-right">
					<button type="submit" class="btn btn-sm btn-danger" style="color:white;">삭제</button>
			    </div>
		    </form>
	    	<div class="text-right">
		    	<button style="margin-top: -52px; margin-right:60px;" class="btn btn-sm btn-info " onclick="location.href='screeningmovielist.jf?pno=1'" > 상영등록 </button>
		    </div>
		    <div class="text-center" >
			    <ul class="pagination">
		            <c:if test="${not pagination.first }">
		               <li><a href="#" onclick="goPage(event, ${pagination.page - 1})">prev</a></li>
		            </c:if>
		         
		            <c:forEach var="num" begin="${pagination.begin }" end="${pagination.end }">
		               <c:choose>
		                  <c:when test="${num eq pagination.page }">
		                     <li class="active"><a href="#" onclick="goPage(event, ${num})">${num }</a></li>
		                  </c:when>
		                  <c:otherwise>
		                     <li><a href="#" onclick="goPage(event, ${num})">${num }</a></li>
		                  </c:otherwise>
		               </c:choose>
		            </c:forEach>
		         
		            <c:if test="${not pagination.last }">
		               <li><a href="#" onclick="goPage(event, ${pagination.page + 1})">next</a></li>
		            </c:if>
		         </ul>
	        </div>
		</div>
	</div>
	<%@include file="../../common/footer.jsp" %>
	<script type="text/javascript">
	      function sendform(pno) {
	         document.getElementById("page-no").value = pno; 
	         document.getElementById("list-form").submit(); 
	      }
	      
	      function sendform1(pno) {
	         /* document.getElementById("page-no").value = pno; */
	         location.href ='http://localhost/jf/admin/screeningmovielistresult.jf?pno='+pno;
	         /* document.getElementById("list-form").submit(); */
	      }
	      
	      function goPage(event, pno) {
	         event.preventDefault();   
	         sendform1(pno);
	      }
    </script>
</body>
</html>