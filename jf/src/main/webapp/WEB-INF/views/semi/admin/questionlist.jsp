<%@page import="kr.co.hta.movies.dao.QuestionDao"%>
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
	<%@include file="../../common/admin.jsp"%>
    <div class="container">
    	<div style="margin-top: 40px; margin-bottom: 40px;">
			    <FONT face="Impact" style="font-size: 50px;">
					Q&A
				</FONT>
	   	</div>

        <table class="table table-condensed table-hover">
            <colgroup>
                <col width="10%">
                <col width="*">
                <col width="10%">
                <col width="10%">
                <col width="10%">
            </colgroup>
            <thead >
                <tr style="background-color: black; color: white;">
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>진행상태</th>
                    <th>등록일</th>
                </tr>
            </thead>
            <tbody>
            	<c:choose>
            		<c:when test="${not empty questions }">
		                <c:forEach var="question" items="${questions }">
			                <tr>
			                    <td>${question.no }</td>
			                    <td><a style="color:black;" href="questiondetailform.jf?qno=${question.no}">${question.title }</a></td>
			                    <td>${question.nickname }</td>
			                    <td>
				                    <c:if test="${question.status eq '답변완료' }">
					                    <span class="label label-success">답변완료</span>
				                   	</c:if>
				                    <c:if test="${question.status eq '답변대기중' }">
				                        <span class="label label-default">답변대기중</span>
				                   	</c:if>
			                    </td>
			                    <td><fmt:formatDate value="${question.createDate }"/></td>
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
    </div>
    <%@include file="../../common/footer.jsp" %>
</body>
</html>