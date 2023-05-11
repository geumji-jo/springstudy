<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
			<div class="col-sm-6 col-sm-offset-3">
				<div class="row">
				<div class="col-sm-12">
					<div class="page-header">
						<h1>비밀번호 찾기</h1>
					</div>
				</div>
				<c:if test="${ param.result eq 'noId'}">
					<div class="col-sm-12" style="padding-left: 0px;">
						<div class="alert alert-danger text-center">
							<strong>비밀번호 찾기 실패</strong> 정보가 일치하지 않습니다.
						</div>
					</div>
				</c:if>
				<c:if test="${ param.result eq 'noSession'}">
					<div class="col-sm-12" style="padding-left: 0px;">
						<div class="alert alert-danger text-center">
							<strong>세션이 만료되었습니다.</strong> 다시 시도해 주세요.
						</div>
					</div>
				</c:if>
				
				</div>
				<div class="row">
					<form class="form-horizontal" action="searchpwd_result.jf"
						method="post">
						<input type="hidden" name="from" value="${param.from }" />
						<div class="form-group">
							<label class="control-label col-sm-3">아이디</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" name="userid" id="user-id">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">휴대폰 번호</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="userphone" id="user-phone">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">비밀번호 힌트</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="userhint" id="user-phone">
							</div>
						</div>
						<div class="col-sm-4 col-sm-offset-3 login_button_div">
							<button type="submit" class="btn btn-danger login_button">비밀번호 찾기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
    <!-- Footer -->
<%@include file="../../common/footer.jsp" %>
    <!-- footer -->
</body>
</html>