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
    <script type="text/javascript" src="/jf/resources/bootstrap/js/gpaHeader.js"></script>
    
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
							<h1>비밀번호 변경</h1>
						</div>
					</div>
				</div>
				
				<div class="row">
					<form class="form-horizontal" action="process_changepwd_result.jf"
						method="post">
						<input type="hidden" name = "userId" value="${userId }" />
						<div class="form-group">
							<label class="control-label col-sm-4">아이디: </label>
							<div class="col-sm-4">
								<span class="changePwd_userId">${userId }</span>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">변경할 비밀번호 입력</label>
							<div class="col-sm-4">
								<input onkeyup="checkPwd()" type="password" class="form-control" name="userPwd" id="user-pwd">
							</div>
							<div class="row">
								<div class="col-sm-4" id="msg-box4"></div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">비밀번호 확인</label>
							<div class="col-sm-4">
								<input onkeyup="confirmPwd()" type="password" class="form-control" name="userPwd2" id="user-pwd2">
							</div>
							<div class="row">
								<div class="col-sm-4" id="msg-box5"></div>
							</div>
						</div>
						<div class="col-sm-4 col-sm-offset-4 login_button_div">
							<button id="changeButton" disabled="disabled" type="submit" class="btn btn-danger login_button">비밀번호 변경하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
    <!-- Footer -->
<%@include file="../../common/footer.jsp" %>
    <!-- footer -->
    <script>
    var pwdLength = false;
    var pwdCheck = false;
    
    function checkAll(){
    	if(pwdCheck && pwdLength){
    		$("#changeButton").prop("disabled",false);
    	} else{
    		$("#changeButton").prop("disabled",true);
    	}
    }
    
    function checkPwd() {
    	confirmPwd();
    	var userPwd = document.getElementById("user-pwd").value;
    	var msgbox4 = document.getElementById("msg-box4");

    	if (userPwd.length < 8) {
    		msgbox4.textContent = "비밀번호는 8자이상 15자 이하로 입력해야 합니다";
    		msgbox4.style.fontSize = "13px";
    		msgbox4.style.color = "red";
    		pwdLength = false;
    		return;

    	} else if (8 <= userPwd.length <= 15) {
    		msgbox4.textContent = "비밀번호의 길이가 적절합니다.";
    		msgbox4.style.fontSize = "13px";
    		msgbox4.style.color = "green";
    		pwdLength = true;
    		return;
    	}
    }
    function confirmPwd(){
    	var pwd = document.getElementById("user-pwd").value;
    	var pwd2 = document.getElementById("user-pwd2").value;
    	
    	var msgbox4 = document.getElementById("msg-box4");
        var msgbox5 = document.getElementById("msg-box5");
        
    	if(pwd == pwd2){
    		msgbox5.textContent = "비밀번호가 일치합니다";
    		msgbox5.style.color = "green";
    		msgbox5.style.fontSize = "13px";
    		pwdCheck = true;
    		checkAll();
    		return;
    		
    	} else{
    		msgbox5.textContent = "비밀번호가 일치하지 않습니다.";
    		msgbox5.style.color = "red";
    		msgbox5.style.fontSize = "13px";
    		pwdCheck = false;
    		checkAll();
    		return;
    	}
    }
    
    </script>
</body></html>