<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	  	<meta charset="utf-8">
	<!--   	<meta name="viewport" content="width=device-width, initial-scale=1"> -->
	  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  	<link rel="stylesheet" href="/resources/css/style.css" />
	  	<link rel="stylesheet" href="/resources/css/home.css" />
	<title>HTA CINEMA</title>
</head>
<body>
<%@include file="common/nav.jsp"%>
	<h1>홈페이지</h1>
	<p><c:out value="${message }" /></p>
	<div>
		<img src="/resources/images/cat.png"/>
	</div>
</body>
</html>