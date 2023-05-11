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
  <link rel="stylesheet"href="bootstrap-3.3.2-dist/css/bootstrap.min.css">
  <link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="bootstrap-3.3.2-dist/js/jquery.min.js"></script>
  <script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
</head>
<body  style="background-color: #fdfcf0;">
	<%@include file="../../common/admin.jsp"%>

	<div class="container">
	    <div class="page-header">
	    	<FONT face="Impact" style="font-size: 40px;">
			QUESTION
			</FONT>
		</div>
		
		<table class="table table-bordered" style="background-color: white; border:solid grays; border-width:4px; border-radius: 3;" >
			<tr>
				<th class="active">과정번호</th>
				<td>${question.no }</td>
				<th class="active">등록일</th>
				<td><fmt:formatDate value="${question.createDate }" /> </td>
			</tr>
			<tr>
			    <th class="active">관람한 극장</th>
				<td>${question.theaterName }</td>
				<th class="active">처리 상태</th>
				<td>${question.status }</td>
			</tr>
			
			<tr>
				<th class="active">제목</th>
				<td colspan="3">${question.title }</td>
			</tr>
			<tr>
				<th class="active">문의 내용</th>
				<td colspan="3">${question.contents }</td>
			</tr>
		</table>
	   <div class="text-right">
	      <a href="questionlist.jf" class="btn btn-primary">목록</a>
	   </div>
	   
	   <hr>
	
	   <div class="row well">
	      <form method="post" action="answeradd.jf?qno=${question.no }">
		         <div class="form-group">
		            <textarea rows="3" class="form-control" name="answerContents"></textarea>
		         </div>
		         <div class="text-right">
		            <input type="submit" class="btn btn-success btn-sm" value="등록"/>
		         </div>
	      </form>
	   </div>
	   
	   <div class="row">
	      <ul class="list-group">
		        <li class="list-group-item">
				     	<p><strong>관리자</strong> <small><fmt:formatDate value ="${question.answerCreateDate }"/></small></p>
				        <p>${question.answerContents }</p>
		        </li>
	      </ul>
	   </div>
	   <div style="margin-bottom: 400px;"></div>
	</div>
	<%@include file="../../common/footer.jsp" %>
</body>
</html>