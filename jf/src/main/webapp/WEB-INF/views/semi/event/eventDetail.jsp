<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>이벤트 > 이벤트 상세 | 영화 그 이상의 감동. CGV </title>
<link rel="shortcut icon" href="/jf/photos/cj_logo.ico" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/main.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/header.css" />
<link rel="stylesheet" href="/jf/resources/bootstrap/css/event.css" />
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Nunito"
	rel="stylesheet">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/GPA.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
<%@include file="../../common/navigation.jsp"%>

<div class="container-fluid"
style="position:relative; 
margin : 0;
padding : 0;
background: url(/jf/photos/eventPhotos/${event.content}) no-repeat 50% 0; 
height: 4670px">
	<div style="margin-left:1900px; margin-top:900px; position:fixed; ">
		<a class="btn btn-default" href="eventlist.jf" style="width:110px; height:60px; font-size:30px;">목록<span class="glyphicon glyphicon-share-alt"></span></a>
	</div>
</div>
		
		
		<!-- 이벤트 내용담을 사진 컬럼 추가하기! -->
		
		
		
<%@ include file="../../common/footer.jsp"%>
</body>
</html>