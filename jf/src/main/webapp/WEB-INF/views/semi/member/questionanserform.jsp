<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet" href="/jf/resources/bootstrap/css/mycgv.css">
    <link rel="stylesheet" href="/jf/resources/bootstrap/css/mycgv.css">
    <link
	href="https://fonts.googleapis.com/css?family=Gamja+Flower&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Gamja+Flower|Hi+Melody&display=swap"
	rel="stylesheet">
	<style>
		.table >tbody > tr > td{
			padding-left:25px;
		}
	</style>
</head>

<body>
	<%@include file="../../common/navigation.jsp"%>
	<div class="container-fluid bg-bricks main bg-bricks backimg"></div>

	<div class="container">
		<%@include file="../../common/myCgvHeader.jsp" %>
		
		<div class="row" style="margin-top: 80px;">
			<div class="col-sm-10 col-sm-offset-1">
				<div class="text-right">
					<a style="font-size:13px;" href="questionlist.jf?pno=${param.pno }" class="btn btn-warning">목록</a>
				</div>
				<hr>
				<table class="table table-bordered"
					style="border: solid #e6e6e6; border-width: 1px; border-radius: 3px; font-size:13px;">
					<colgroup>
						<col width="15%">
						<col width="25%">
						<col width="15%">
						<col width="25%">
					</colgroup>
					<tr>
						<th class="warning text-center">과정번호</th>
						<td>${question.no }</td>
						<th class="warning text-center">등록일</th>
						<td><fmt:formatDate value="${question.createDate }" /></td>
					</tr>
					<tr class="">
						<th class="warning text-center">관람한 극장</th>
						<td>${question.theaterName }</td>
						<th class="warning text-center">처리 상태</th>
						<td> 
							<c:if test="${not empty question.answerContents }">
		                    	<span class="label label-danger">답변완료</span>
		                   	</c:if>
		                    <c:if test="${empty question.answerContents }">
		                    	<span class="label label-default">답변대기중</span>
		                   	</c:if>
	                   	</td>
					</tr>
					<tr class="">
						<th class="warning text-center">제목</th>
						<td colspan="3">${question.title }</td>
					</tr>
					<tr class="">
						<th class="warning text-center">문의 내용</th>
						<td colspan="3">${question.contents }</td>
					</tr>
				</table>
				<hr>
				<div class="row">
					<div class="col-sm-12">
						<ul class="list-group">
							<li class="list-group-item" style="background-color:rgb(252, 254, 238) !important;">
								<p>
									<strong style="font-size:13px;">관리자</strong> <small> <fmt:formatDate
											value="${question.answerCreateDate }" /></small>
								</p>
								<p>${question.answerContents }</p>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../../common/footer.jsp"%>
	<!--  modal -->
	<div class="modal fade modal-center" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
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
								<div class="col-sm-12" style="padding-bottom:20px;">
									<ul id="mytheater-ul">
										<c:forEach var="m" items="${MyTheaters }">
											<li>
												<div class="li-box">
													<div class="mytheater-li">
														<a style="color:black;" href="/jf/cgv/cgvtheaters.jf?tno=${m.theaterNo }">${m.theaterName }</a>
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
						<div class="col-sm-10 col-sm-offset-1" style="padding-top:10px;">
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
	function deleteSelected() {
		// 아이디로 가져오는 값은 f
		var f = document.getElementById("question-form");
		// 
		f.setAttribute("action", "questiondel.jf");
		f.submit();
	}
	function sendform(pno) {
		document.getElementById("page-no").value = pno; 
		document.getElementById("question-form").submit(); 
	}
	<!-- 자주가는 극장 insert // update -->
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