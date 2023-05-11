<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>아이디 찾기</title>
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
						<h1>아이디 찾기</h1>
					</div>
				</div>
				<c:if test="${ param.result eq 'infoEmpty'}">
					<div class="col-sm-12" style="padding-left: 0px;">
						<div class="alert alert-danger text-center">
							<strong>아이디찾기 실패</strong> 정보를 모두 입력해야 합니다.
						</div>
					</div>
				</c:if>
				<c:if test="${ param.result eq 'idEmpty'}">
					<div class="col-sm-10 col-sm-offset-1" style="padding-left: 0px;">
						<div class="alert alert-danger text-center">
							<strong>아이디찾기 실패</strong> 해당하는 정보에 대한 아이디가 없습니다.
						</div>
					</div>
				</c:if>
				
				</div>
				
				<div class="row">
					<form class="form-horizontal" action="searchid_result.jf"
						method="post">
						<input type="hidden" name="from" value="${param.from }" />
						<div class="form-group">
							<label class="control-label col-sm-3">이름</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="username" id="user-name">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">생년월일</label>
							<div class="col-sm-4">
								<input type="date" class="form-control" name="userbirth" id="user-pwd">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">휴대폰 번호</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="userphone" id="user-phone">
							</div>
						</div>
						
						<div class="col-sm-3 col-sm-offset-3 login_button_div">
							<button type="submit" class="btn btn-danger login_button">아이디 찾기</button>
						</div>
					</form>
					<div class="login_searchform col-sm-5 col-sm-offset-3 text-right">
						<a href="searchpwd.jf"><span class="login_searchPwd">비밀번호 찾기 <span class="glyphicon glyphicon-chevron-right"></span></span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
    <!-- Footer -->
<%@include file="../../common/footer.jsp" %>
    <!-- footer -->
</body></html>