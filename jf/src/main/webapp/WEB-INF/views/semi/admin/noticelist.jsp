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
		<%@include file="../../common/admin.jsp"%>
	    </div>
	
	   	<div class="container">
	   		<div style="margin-top: 40px; margin-bottom: 40px;">
			    <FONT face="Impact" style="font-size: 50px;">
					NOTICE
				</FONT>
	   		</div>
		    <div class="text-right">
			    <form action="noticelist.jf" class="form-inline" onclick="sendform(1)"> 
			    	<select class="form-control" name="sort" onchange="sendform(1);" >
								<option value="title" ${param.sort eq 'title' ? "selected" : "" }>제목</option>
								<option value="contents" ${param.sort eq 'contents' ? "selected" : "" }>내용</option>
							</select> 
			    	<input type="hidden" name="pno" value="1"/>
				    <input type="text" title="통합검색" id="header_keyword"  class="form-control" name="keyword"  maxlength="10">
				    <button type="submit" class="btn btn-default" id="btn_header_search" >검색</button>
				</form>
		    </div>
		    <br />
		    <form action="noticedelete.jf">
			    <table class="table table-condensed table-hover" >
			       
			        <thead style="background-color: black; color: white;">
			            <tr>
			                <th class="col-sm-1">번호</th>
			                <th class="col-sm-1">번호</th>
			                <th class="col-sm-8">제목</th>
			                <th class="col-sm-2">등록일</th>
			            </tr>
			        </thead>
			        <tbody class="active">
			        	<c:choose>
				        	<c:when test="${not empty notices }">
					            <c:forEach var="notice" items="${notices}"> 
						            <tr>
						                <td><input type="checkbox" name="box" value="${notice.no }" class="checkSelect"></td>
						                <td>${notice.no }</td>
						                <td><a style="color:black;" href="noticedetail.jf?nno=${notice.no }">${notice.title }</a></td>
						                <td><fmt:formatDate value="${notice.createDate }"/></td>
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
		    	<button style="margin-top: -52px; margin-right:60px;" class="btn btn-sm btn-info " onclick="location.href='noticeform.jf'" > 공지등록 </button>
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
	         location.href ='http://localhost/jf/admin/noticelist.jf?pno='+pno;
	         /* document.getElementById("list-form").submit(); */
	      }
	      
	      function goPage(event, pno) {
	         event.preventDefault();   
	         sendform1(pno);
	      }
    </script>
</body>
</html>