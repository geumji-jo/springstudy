<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/jf/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/main.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/header.css" />
<link rel="stylesheet" href="/jf/resources/bootstrap/css/login.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="/jf/resources/bootstrap/js/gpaHeader.js"></script>
</head>
<body>
	<%@include file="../../common/navigation.jsp"%>
	<div class="container">
		<div class="row login_main_row">
			<div class="col-sm-10 col-sm-offset-1 ">
				<div class="row">
					<div class="col-sm-12 login_info ">
						<div class="page-header">
							<h1>회원가입</h1>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-10 col-sm-offset-2">
						<div class="row">
							<c:if test="${param.result eq 'fail' }">
								<div class="col-sm-8" style="padding-left: 0px;">
									<div class="alert alert-danger">
										<strong>회원가입 실패</strong> 동일한 아이디가 이미 존재합니다.
									</div>
								</div>
							</c:if>
							<c:if test="${param.result eq 'none' }">
								<div class="col-sm-8" style="padding-left: 0px;">
									<div class="alert alert-danger">
										<strong>회원가입 실패</strong> 이름, 아이디, 비밀번호, 이메일을 모두 입력해야 합니다.
									</div>
								</div>
							</c:if>
						</div>
					</div>
					<div class="col-sm-10 col-sm-offset-2">
						<div class="row">
							<form class="form-horizontal" action="process_register.jf"
								method="post" enctype="multipart/form-data">
								<div class="row">
									<div class="col-sm-12">
										<div class="form-group">
											<label class="control-label col-sm-2">아이디</label>
											<div class="col-sm-2">
												<input type="text" class="register_form form-control"
													name="userid" id="user-id" onkeyup="checkId()">
											</div>
											<div class="col-sm-2 btn-group-sm">
												<button onclick="isValidId()" type="button"
													class="btn btn-warning">
													<strong>중복확인</strong>
												</button>
											</div>
											<div class="col-sm-6" id="msg-box"></div>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-2">비밀번호</label>
									<div class="col-sm-4">
										<input type="password" class="register_form form-control"
											name="userpwd" maxlength="15" id="user-pwd"
											onkeyup="checkPwd()">
									</div>
									<div class="row">
										<div class="col-sm-6" id="msg-box2"></div>
									</div>
								</div>
								<div class="form-group">
									<label style="padding-left:0px;" class="control-label col-sm-2">비밀번호 확인</label>
									<div class="col-sm-4">
										<input onkeyup="confirmPwd()" type="password"
											class="register_form form-control" name="userPwd2" id="user-pwd2">
									</div>
									<div class="row">
										<div class="col-sm-4" id="msg-box5"></div>
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-2">이름</label>
									<div class="col-sm-3">
										<input type="text" class="register_form form-control "
											name="username" id="user-name">
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-2">닉네임</label>
									<div class="col-sm-4">
										<input type="text" class="register_form form-control "
											name="usernickName" id="user-nickName">
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-2">전화번호</label>
									<div class="col-sm-4">
										<input placeholder=' "-"를 제외하고 입력해 주세요' type="text"
											class="register_form form-control" name="userphone"
											id="user-phone" maxlength="11">
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-2">이메일</label>
									<div class="col-sm-5">
										<input type="email" class="register_form form-control"
											name="useremail" id="user-email">
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-2">생일</label>
									<div class="col-sm-3">
										<input type="date" class="register_form form-control"
											name="userbirth" id="user-birth">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">힌트</label>
									<div class="col-sm-5">
										<input type="text" class="register_form form-control"
											name="userhint" id="user-hint">
									</div>
									<div class="row">
										<div class="col-sm-4" id="msg-box4">
											<span class="align-middle">비밀번호 찾기시 이용됩니다.</span>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-2">성별</label>
									<div class="col-sm-6">
										<label for="" class="checkbox-inline"><input
											type="radio" checked="checked" class="custom-control-input"
											name="usergender" value="남자" id="user-gender-male" />남</label> <label
											for="" class="checkbox-inline"><input type="radio"
											class="custom-control-input" name="usergender" value="여자"
											id="user-gender-female" />여</label>
									</div>
								</div>
								<div class="col-sm-7 col-sm-offset-2 login_button_div">
									<button disabled="disabled" id="registerButton" type="submit"
										class="btn btn-danger changeButton">회원가입</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	
	
		var id = false;
		var pwdCheck = false;

		var msgbox4 = document.getElementById('msg-box4');
		msgbox4.style.fontSize = "13px";
		msgbox4.style.color = "gray";

		function isValidId() {
			var xhr = new XMLHttpRequest();
			var memberId = $('#user-id').val();

			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {

					var result = JSON.parse(xhr.responseText);
					if (memberId.length<6 || memberId.length>12) {
						alert("아이디는 6글자 이상 12글자 이하로 입력해야 합니다.");
						return;
					}
					if (result.isEmpty == "Y") {
						alert("사용 가능한 아이디 입니다.");
					} else if (result.isEmpty == "N") {
						alert("아이디가 이미 존재합니다.");
					}
				}
			}
			xhr.open("GET", "/jf/member/process_checkId.jf?memberId="
					+ memberId);
			xhr.send();
		}
		
		$(".register_form").each(function() {
			$(this).keyup(function() {
				var isValid = true;
				var items = $('.register_form');
				for (var i = 0; i < items.length; i++) {
					if (!$(items[i]).val()) {
						isValid = false;
						break;
					}
				}

				if (isValid && id && pwdCheck && pwdLength) {
					$('.changeButton').prop('disabled', false);
				} else {
					$('.changeButton').prop('disabled', true);
				}
			});
		});

		function checkPwd() {
			confirmPwd();
			var userPwd = document.getElementById("user-pwd").value;
			var msgbox2 = document.getElementById("msg-box2");

			if (userPwd.length < 8) {
				msgbox2.textContent = "비밀번호는 8자이상 15자 이하로 입력해야 합니다";
				msgbox2.style.fontSize = "13px";
				msgbox2.style.color = "red";
				pwdLength = false;

			} else if (8 <= userPwd.length <= 15) {
				msgbox2.textContent = "비밀번호의 길이가 적절합니다.";
				msgbox2.style.fontSize = "13px";
				msgbox2.style.color = "green";
				pwdLength = true;
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
	    function checkAll(){
	    	if(pwdCheck && pwdLength){
	    		$(".changeButton").prop("disabled",false);
	    	} else{
	    		$(".changeButton").prop("disabled",true);
	    	}
	    }
	</script>

	<%@ include file="../../common/footer.jsp"%>
</body>
</html>