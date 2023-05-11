<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Nunito"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/jf/resources/bootstrap/css/bootstrap.css">

<link rel="stylesheet" href="/jf/resources//bootstrap/css/mycgv.css">
<link rel="stylesheet" href="/jf/resources//bootstrap/css/wishlist.css">
<link
	href="https://fonts.googleapis.com/css?family=Gamja+Flower&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Gamja+Flower|Hi+Melody&display=swap"
	rel="stylesheet">
</head>
<body>
	<%@include file="../../common/navigation.jsp"%>
	<div class="container-fluid bg-bricks main bg-bricks backimg"></div>

	<div class="container">
		<%@include file="../../common/myCgvHeader.jsp"%>
		<div class="row my-content" style="margin-top: 90px; margin-left: 40px; margin-bottom: 150px; padding-bottom: 50px;">
			<%@include file="../../common/myCgvLeftForm.jsp" %> <!-- div col 2 -->
			<div class="col-sm-8 col-sm-offset-2 mycgv_main_right_col" style="margin-top:40px;">
				<div class="row">
					<form class="form-horizontal" action="process_success_changeInfo.jf"
						method="post">
						<div class="form-group">
							<label class="control-label col-sm-2">비밀번호</label>
							<div class="col-sm-4">
								<input type="password" class=" form-control"
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
									class=" form-control" name="userPwd2" id="user-pwd2">
							</div>
							<div class="row">
								<div class="col-sm-4" id="msg-box5"></div>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-2">닉네임</label>
							<div class="col-sm-4">
								<input type="text" class="register_form form-control "
									name="usernickName" id="user-nickName" value="${LOGINMEMBER.nickName }">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-2">전화번호</label>
							<div class="col-sm-4">
								<input style="letter-spacing: -0.5px;" placeholder=' "-"를 제외하고 입력해 주세요' type="text"
									class="register_form form-control" name="userphone" value="${LOGINMEMBER.phone }"
									id="user-phone" maxlength="11">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-2">이메일</label>
							<div class="col-sm-4">
								<input type="email" class="register_form form-control" value="${LOGINMEMBER.email }"
									name="useremail" id="user-email">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-2">힌트</label>
							<div class="col-sm-4">
								<input type="text" class="register_form form-control" value="${LOGINMEMBER.hint }"
									name="userhint" id="user-hint">
							</div>
							<div class="row">
								<div class="col-sm-4" id="msg-box4">
									<span style="position: relative; top:7px;" class="align-middle">비밀번호 찾기시 이용됩니다.</span>
								</div>
							</div>
						</div>

						<div class="col-sm-4 login_button_div" style="margin-left:103.88px;">
							<button style="width:207.77px;" disabled="disabled" id="registerButton" type="submit"
								class="btn btn-danger changeButton">변경 완료</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<%@include file="../../common/footer.jsp"%>

	<!--  modal -->
	<div class="modal fade modal-center" id="exampleModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-center">
			<div class="modal-content">
				<div class="modal-header">
					<div class="row">
						<div class="col-sm-12 mycgv_modal_top">
							<div class="mycgv_modal_top_title">자주가는 CGV 설정</div>
						</div>
					</div>
					<div class="row mycgv_modal_row_2">
						<div class="col-sm-10 col-sm-offset-1">
							<div class="row mycgv_modal_row_1">
								<div class="col-sm-12">
									영화관을 선택하여 등록해주세요. <strong>최대 5개까지</strong> 등록하실 수 있습니다.
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<!-- 지역 선택 -->
									<select class="mycgv_selects"
										onchange="showTheaters(this.value)" id="select_region"
										name="show_region" title="자주가는 지역선택">
										<option value="" selected="selected">지역선택</option>
										<c:forEach var="city" items="${cities }">
											<option value="${city }">${city }</option>
										</c:forEach>
									</select>

									<!-- 히든값 -->
									<input type="hidden" id="hiddenvalue" value="">
									<!-- 극장 선택 -->
									<select class="mycgv_selects" id="select_theater"
										name="show_theater"
										onchange="document.getElementById('hiddenvalue').value = this.options[this.selectedIndex].value"
										title="자주가는 CGV선택">
										<option value="" selected="selected">극장선택</option>
									</select>
									<!-- ajax 은정이한테 받아와라 해훈아 -->


									<button id="btn_add_favorite_theater" type="button"
										class="round inblack on" onclick="search()">
										<span>자주가는 CGV 추가</span>
									</button>
								</div>
							</div>

						</div>

					</div>
				</div>
				<!-- ---------------- -->
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-10 col-sm-offset-1">
							<div class="row">
								<div class="col-sm-12">
									<strong>${LOGINMEMBER.name }님의 자주가는 CGV</strong>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12" style="padding-bottom: 20px;">
									<ul id="mytheater-ul">
										<c:forEach var="m" items="${MyTheaters }">
											<li>
												<div class="li-box">
													<div class="mytheater-li">
														<a href="/jf/cgv/cgvtheaters.jf?tno=${m.theaterNo }">${m.theaterName }</a>
													</div>
													<button onclick="remove(${m.no})" class="remove-button"></button>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-sm-12">
							<hr class="mycgv_modal_hr_1" />
						</div>
						<div class="col-sm-10 col-sm-offset-1" style="padding-top: 10px;">
							<div class="row">
								<div class="col-sm-12">
									<table class="table table-bordered mycgv_table">
										<tr class="text-center">
											<th style="width: 20%" class="text-center mycgv_th">항목</th>
											<th style="width: 50%" class="text-center mycgv_th">이용목적</th>
											<th style="width: 30%" class="text-center mycgv_th">보유기간</th>
										</tr>
										<tr class="">
											<td>자주가는CGV (최대 5개)</td>
											<td>·상품 결제시(영화 예매시) 편의 제공 <br /> -선호극장의 상영작 및 상영시간 우선
												제공
											</td>
											<td>별도 동의 철회시까지 또는 약관 철회 후 1주일까지</td>
										</tr>
									</table>
								</div>
							</div>
						</div>


					</div>
				</div>
				<div class="modal-footer">
					<form action="" method="post">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-danger">등록하기</button>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!--  modal -->

	<script>
	<!-- 자주가는 극장 insert // update -->
	function checkForms(){
		$(".register_form").each(function() {
			if($(this).val != ""){
				$(this).keyup(function() {
					var isValid = true;
					var items = $('.register_form');
					for (var i = 0; i < items.length; i++) {
						if (!$(items[i]).val()) {
							isValid = false;
							break;
						}
					}
					if (isValid && pwdCheck && pwdLength) {
						$('.changeButton').prop('disabled', false);
					} else {
						$('.changeButton').prop('disabled', true);
					}
				});
			} else if($(this).val == ""){
				$('.changeButton').prop('disabled', true);
				return;
			}
		});
	}
	checkForms();
	var pwdCheck = false;
	var pwdLength = false;
	
	var msgbox4 = document.getElementById('msg-box4');
	msgbox4.style.fontSize = "13px";
	msgbox4.style.color = "gray";
	checkPwd(); // pwd null일경우 첫 화면에서 변경 가능
	
	function checkPwd() {
		confirmPwd();
		
		var userPwd = document.getElementById("user-pwd").value;
		var msgbox2 = document.getElementById("msg-box2");
		if(userPwd == ""){
			msgbox2.textContent = "비밀번호 변경을 하시려면 입력하세요";
			msgbox2.style.fontSize = "13px";
			msgbox2.style.color = "green";
			pwdLength = true;
			checkAll();
			checkForms();
			return;
		}
		if (userPwd.length < 8) {
			msgbox2.textContent = "비밀번호는 8자이상 15자 이하로 입력해야 합니다";
			msgbox2.style.fontSize = "13px";
			msgbox2.style.color = "red";
			pwdLength = false;
			checkAll();
			checkForms();
			return;

		} else if (8 <= userPwd.length <= 15) {
			msgbox2.textContent = "비밀번호의 길이가 적절합니다.";
			msgbox2.style.fontSize = "13px";
			msgbox2.style.color = "green";
			pwdLength = true;
			checkAll();
			checkForms();
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
			checkForms();
			return;
			
		} else{
			msgbox5.textContent = "비밀번호가 일치하지 않습니다.";
			msgbox5.style.color = "red";
			msgbox5.style.fontSize = "13px";
			pwdCheck = false;
			checkAll();
			checkForms();
			return;
		}
	}
    function checkAll(){
    	if(pwdCheck && pwdLength){
    		$(".changeButton").prop("disabled",false);
    		checkForms();
    		return;
    	} else{
    		$(".changeButton").prop("disabled",true);
    		checkForms();
			return;
    	}
    }
    
	function search() {
		var theater = document.getElementById('hiddenvalue').value;
		console.log("theater", theater);
	
		var xhr = new XMLHttpRequest();
	var list = document.querySelectorAll(".modal-body li").length;
	console.log(list);
	
	if(list == 5){
		alert("자주가는 극장은 5곳 까지만 가능합니다!");
		return;
	}
	
	
		xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200) {
			var mytheaters = JSON.parse(xhr.responseText);
			console.log(mytheaters);
			
			var htmlContents = "";
			
			
			for(var i=0; i<mytheaters.length; i++) {
				htmlContents += 
									"<li><div class=\"li-box\"><div class=\"mytheater-li\"><a href=\"/jf/cgv/cgvtheaters.jf?tno="+mytheaters[i].theaterNo+"\">"+mytheaters[i].theaterName+"</a></div><button onclick=\"remove("+mytheaters[i].no+")\" class=\"remove-button\"></button></div></li>";
								}
								$('#mytheater-ul').empty();
			document.getElementById('mytheater-ul').innerHTML = htmlContents;
		}
	}
		
	xhr.open("GET", "addMyTheater.jf?theater="+theater);
	xhr.send();
	}



	function remove(mytheaterNo) {
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var mytheaters = JSON.parse(xhr.responseText);
				console.log(mytheaters);
				
				var htmlContents = "";
				
				for(var i=0; i<mytheaters.length; i++) {
					htmlContents += 
					"<li><div class=\"li-box\"><div class=\"mytheater-li\"><a href=\"/jf/cgv/cgvtheaters.jf?tno="+mytheaters[i].theaterNo+"\">"+mytheaters[i].theaterName+"</a></div><button onclick=\"remove("+mytheaters[i].no+")\" class=\"remove-button\"></button></div></li>";
				}
				$('#mytheater-ul').empty();
				document.getElementById('mytheater-ul').innerHTML = htmlContents;
			}
		}
		
		xhr.open("GET", "removeMyTheater.jf?mytheaterNo="+mytheaterNo);
		xhr.send();
	}


	function showTheaters(city) {
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var theaters = JSON.parse(xhr.responseText);
				console.log(theaters);
				
				var htmlContents = "";
				
				for(var i=0; i<theaters.length; i++) {
					htmlContents += "<option value=\""+theaters[i].no+"\" selected=\"selected\">"+theaters[i].name+"</option>";
				}
				document.getElementById('select_theater').innerHTML = htmlContents;
			}
		}
		xhr.open("GET", "showTheater.jf?city="+city);
		xhr.send();
	}
</script>

</body>
</html>