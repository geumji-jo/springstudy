<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/jf/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/main.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/header.css" />
<link rel="stylesheet" href="/jf/resources/bootstrap/css/login.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<%@include file="../../common/navigation.jsp"%>
	<div class="container">
		<div class="row login_main_row">
			<div class="col-sm-6 col-sm-offset-3">
				<div class="row">
					<div class="page-header">
						<h1>로그인</h1>
					</div>
					<c:if test="${empty param.result }">
						<div class="col-sm-12 login_info ">아이디와 비밀번호를 입력하신 후, 로그인
							버튼을 클릭해 주세요</div>
					</c:if>
					<c:if test="${ param.result eq 'fail'}">
						<div class="col-sm-12" style="padding-left: 0px;">
							<div class="alert alert-danger text-center">
								<strong>로그인 실패</strong> 아이디 혹은 비밀번호가 올바르지 않습니다.
							</div>
						</div>
					</c:if>
					<c:if test="${ param.result eq 'please'}">
						<div class="col-sm-12" style="padding-left: 0px;">
							<div class="alert alert-danger text-center">
								<strong>리뷰</strong> 기능은 로그인 후 사용하실 수 있습니다.
							</div>
						</div>
					</c:if>
					<c:if test="${ param.result eq 'likefail'}">
						<div class="col-sm-12" style="padding-left: 0px;">
							<div class="alert alert-danger text-center">
								<strong>좋아요</strong> 기능은 로그인 후 사용하실 수 있습니다.
							</div>
						</div>
					</c:if>
					<c:if test="${param.result eq 'default' }">
						<div class="col-sm-12" style="padding-left: 0px;">
							<div class="alert alert-danger text-center">
								<strong>해당</strong> 기능은 로그인 후 사용하실 수 있습니다.
							</div>
						</div>
					</c:if>
				</div>
				<div class="row">
					<form class="form-horizontal" action="process_login.jf"
						method="post">
						<input type="hidden" name="from" value="${param.from }" />
						<input type="hidden" name="mno" value="${param.mno }" />
						<input type="hidden" name="sno" value="${param.sno }" />
						<input type="hidden" name="thumbno" value="${param.thumbno }" />
						<div class="form-group">
						
							<label class="control-label col-sm-2">아이디</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="userid" id="user-id">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">비밀번호</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" name="userpwd" id="user-pwd">
							</div>
						</div>
						<div class="col-sm-7 col-sm-offset-2 login_button_div">
							<button type="submit" class="btn btn-danger login_button">로그인</button>
						</div>
					</form>
					<div class="login_searchform col-sm-7 col-sm-offset-2 text-right">
						<a href="searchid.jf"><span class="login_searchId">아이디 찾기 <span class="glyphicon glyphicon-chevron-right"></span></span></a>
						<a href="searchpwd.jf"><span class="login_searchPwd">비밀번호 찾기 <span class="glyphicon glyphicon-chevron-right"></span></span></a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../../common/footer.jsp"%>
</body>
</html>