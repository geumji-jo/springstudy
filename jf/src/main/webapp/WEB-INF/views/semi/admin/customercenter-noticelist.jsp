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
  <link rel="stylesheet" href="/jf/resources/bootstrap/css/header.css">
  <link rel="stylesheet" href="/jf/resources/bootstrap/css/footer.css">
  <link rel="stylesheet" href="/jf/resources/bootstrap/css/client.css">
  <link rel="stylesheet" href="/jf/resources/bootstrap/css/customercenter-noticelist.css">
</head>
<%@include file="../../common/navigation.jsp"%>
    <div class="container">
        <div class="row" style="margin-top:20px;">
			<%@include file="../../common/customerCenterLeft.jsp" %>
            <div class="col-sm-10">
	            <div class="notice1">
	            	<span id="notice">공지/뉴스</span>
	            	<br />
	            	CGV의 주요한 이슈 및 여러가지 소식들을 확인하실수 있습니다.
	            </div>
			    <form action="customercenter-noticelist.jf" class="form-inline" id="list-form">  
		            <div class="text-left">
							<select class="form-control" name="sort" onchange="sendform(1);" >
								<option value="title" ${param.sort eq 'title' ? "selected" : "" }>제목</option>
								<option value="contents" ${param.sort eq 'contents' ? "selected" : "" }>내용</option>
							</select>
					    	<input type="hidden" name="pno" value="1"/>
					    	<input id="searchtext" type="text" class="c_input" title="검색어 입력" placeholder="검색어를 입력해 주세요" name="keyword" value="">
						    <button type="submit" class="btn"  id="btn_header_search" >검색하기</button>
		            	<br/>
				    </div>
				    <div id="count">
				    	총 ${records }건이 검색되었습니다.
				    </div>
				    <table class="table tbl_area" >
				        <thead>
				            <tr class="tr_background">
				                <th class="text-center">번호</th>
				                <th class="text-center">제목</th>
				                <th class="text-center">등록일</th>
				            </tr>
				        </thead>
				        <tbody class="active">
				        	<c:choose>
					        	<c:when test="${not empty notices }">
						            <c:forEach var="notice" items="${notices}"> 
							            <tr class="notice_td_area">
							                <td class="text-center">${notice.no }</td>
							                <td><a class="atagblack" href="customercenter-noticeform.jf?pno=1&nno=${notice.no }&toggleNo=3">${notice.title }</a></td>
							                <td class="text-center"><fmt:formatDate value="${notice.createDate }"/></td>
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
				</form>
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
         location.href ='http://localhost/jf/semi/admin/customercenter-noticelist.jf?pno='+pno;
         /* document.getElementById("list-form").submit(); */
      }
      
      function goPage(event, pno) {
         event.preventDefault();   
         sendform1(pno);
      }
   </script>
</body>
</html>