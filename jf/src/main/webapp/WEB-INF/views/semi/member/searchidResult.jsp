<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Nunito" rel="stylesheet">
    <link rel="stylesheet" href="/jf/resources/bootstrap/css/footer.css">
    <link rel="stylesheet" href="/jf/resources/bootstrap/css/wishlist.css">
    <link rel="stylesheet" href="/jf/resources/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/jf/resources/bootstrap/css/main.css">
    <link rel="stylesheet" href="/jf/resources/bootstrap/css/header.css" />
    <link rel="stylesheet" href="/jf/resources/bootstrap/css/login.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>

<body>
    <!--  헤더 시작  -->
<%@include file="../../common/navigation.jsp" %>
    <!--      헤더 끝  -->
    <div class="container">
		<div class="row login_main_row">
			<div class="col-sm-8 col-sm-offset-2">
				<div class="row">
					<div class="col-sm-12">
						<div class="page-header">
							<h1>아이디 찾기 결과</h1>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<span>회원님의 아이디는
							<c:if test="${not empty userId }">${userId }</c:if>
						 입니다.</span> 
					</div>
				</div>
				
				<div class="row">
					<div class="login_goLoginForm col-sm-5 col-sm-offset-3 text-center">
						<a href="/jf/member/login.jf"><span class="login_searchPwd">로그인하러 가기 <span class="glyphicon glyphicon-chevron-right"></span></span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
    <!-- Footer -->
<%@include file="../../common/footer.jsp" %>
    <!-- footer -->
</body></html>