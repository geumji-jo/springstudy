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
        <div class="row">
        <%@include file="../../common/customerCenterLeft.jsp" %>
			<div class="col-sm-10">
	            <div class="notice1">
	            	<span id="notice">공지/뉴스</span>
	            	<br />
	            	CGV의 주요한 이슈 및 여러가지 소식들을 확인하실수 있습니다.
	            </div>
			    <table class="table tbl_area" >
			        <thead>
			            <tr class="tr_background">
			                <th class="col-sm-7">${notice.title }</th>
			                <th class="col-sm-3">등록일 <fmt:formatDate value="${notice.createDate }"/></th>
			                <th class="col-sm-2">조회수 ${notice.views }</th>
			            </tr>
			        </thead>
			        <tbody class="active">
			        <tr>
		               <td colspan="3">${notice.contents }</td>
			        </tr>
			        </tbody>
			    </table>
			    <hr class="hrStyle"/>
			    <div class="text-right" >
				    <button class="btn btn-sm btn-default" id="buttonlist" onclick="location.href='customercenter-noticelist.jf?pno=1'">목록으로</button>
		        </div>
		        <div class="nextcontents">
			        <c:choose>
			  			<c:when test="${empty nextTitle }">
			  				다음글 ▲  다음글이 존재하지 않습니다.
			  			</c:when>
			  			<c:otherwise>
				  			다음글 ▲  <a style="color:black;" href="customercenter-noticeform.jf?no=1&nno=${nextTitle.no }">${nextTitle.title }</a>
			  			</c:otherwise>
			        </c:choose>
		  		</div>
		        <hr class="hrStyle"/>
		        <div class="nextcontents">
			        <c:choose>
			  			<c:when test="${empty before }">
			  				이전글 ▼  이전글이 존재하지 않습니다.
			  			</c:when>
			  			<c:otherwise>
			  				이전글 ▼  <a style="color:black;" href="customercenter-noticeform.jf?no=1&nno=${before.no }">${before.title }</a>
			  			</c:otherwise>
			        </c:choose>
		  		</div>
		  		<hr/>
		  		<hr class="hrStyle"/>
            </div>
        </div>
	</div>
	<%@include file="../../common/footer.jsp" %>
</body>
</html>