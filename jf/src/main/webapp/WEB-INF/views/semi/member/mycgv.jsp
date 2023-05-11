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

		<div class="row my-content"
			style="margin-top: 90px; margin-left: 40px; margin-bottom: 150px; padding-bottom: 50px;">
			<!-- my cgv 메인 컨텐츠 -->
			<div class="container" style="">
				<div class="row">
					<%@include file="../../common/myCgvLeftForm.jsp" %>
					<div class="col-sm-9 mycgv_main_right_col">
						<!-- BOX 시작-->
						<div class="row mycgv_right_top_div">

							<a href="/jf/member/wishlist.jf">
								<div
									class="col-sm-3 mycgv_dotted_class mycgv_right_top_box text-center">
									<div class="row">
										<div class="col-sm-12">
											<img src="/jf/photos/mycgv_1.PNG" alt="" />
										</div>
									</div>
									<div class="row">
										<div class="col-sm-12">
											<span class="mycgv_right_topBoxTitle">위시리스트</span>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-10 col-sm-offset-1">
											<span class="mycgv_right_topBoxContent">보고싶은 영화들을 미리
												담아두고 싶다면?</span>
										</div>
									</div>
								</div>
							</a> <a href="/jf/member/watchedMovie.jf">
								<div
									class="col-sm-3 mycgv_dotted_class mycgv_right_top_box text-center">
									<div class="row">
										<div class="col-sm-12">
											<img src="/jf/photos/mycgv_2.PNG" alt="" />
										</div>
									</div>
									<div class="row">
										<div class="col-sm-12 ">
											<span class="mycgv_right_topBoxTitle">내가 본 영화</span>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-10 col-sm-offset-1">
											<span class="mycgv_right_topBoxContent">관람한 영화들을 한번에
												모아 보고 싶다면?</span>
										</div>
									</div>
								</div>
							</a> <a href="/jf/member/moviediary.jf">
								<div
									class="col-sm-3 mycgv_dotted_class mycgv_right_top_box text-center">
									<div class="row">
										<div class="col-sm-12">
											<img src="/jf/photos/mycgv_3.PNG" alt="" />
										</div>
									</div>
									<div class="row">
										<div class="col-sm-12 ">
											<span class="mycgv_right_topBoxTitle">무비다이어리</span>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-10 col-sm-offset-1">
											<span class="mycgv_right_topBoxContent">관람 후 내 감상평을 적어
												추억하고 싶다면?</span>
										</div>
									</div>
								</div>
							</a> <a href="">
								<div class="col-sm-3 mycgv_right_top_box text-center">
									<div class="row">
										<div class="col-sm-12 ">
											<img src="/jf/photos/mycgv_4.PNG" alt="" />
										</div>
									</div>
									<div class="row">
										<div class="col-sm-12 ">
											<span class="mycgv_right_topBoxTitle">포토티켓</span>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-10 col-sm-offset-1">
											<span class="mycgv_right_topBoxContent">단 하나뿐인 티켓을
												간직하고 싶다면?</span>
										</div>
									</div>
								</div>
							</a>

						</div>
						<!-- BOX 끝-->
						<div class="row">
							<div class="col-sm-4">
								<span class="mycgv_reservationRecord">MY 예매내역</span> <span
									class="mycgv_howmany"><c:out
										value="${reservationCount }" default="0" />건</span>
							</div>
							<div class="col-sm-8 text-right">
								<span class="mycgv_reservation_right">예매번호로만 티켓을 찾을 수 있으니
									반드시 확인 부탁드립니다. </span>
							</div>
						</div>
						<div class="row">
							<c:if test="${empty reservationList }">
								<div class="col-sm-12 mycgv_reservation_records text-center">
									<span class="mycgv_novlaue_content">고객님의 최근 예매내역이 존재하지
										않습니다.</span>
								</div>
							</c:if>
							<c:if test="${not empty reservationList }">
								<div class="col-sm-12 mycgv_reservation_records">
									<c:forEach var="reservation" items="${reservationList }">
										<div class="row reservationList">
											<div class="col-sm-2">
												<div class="row newline text-center">
													<span>예매번호</span>
												</div>
												<div class="row newline text-center">
													<span>${reservation.no }</span>
												</div>
												<div class="row newline text-center">
													<span>(<fmt:formatDate value="${reservation.reservationDate }"	pattern="yyyy.MM.dd" />)
													</span>
												</div>
											</div>
											<div class="col-sm-2">
												<img src="/jf/photos/movieposters/${reservation.moviePoster }" style="width: 70px;" />
											</div>
											<div class="col-sm-4">
												<div class="row newline2">
													<span>${reservation.movieKorTitle }</span>
												</div>
												<div class="row newline">
													<span>관람극장 <strong>${reservation.theaterName }</strong></span>
													<a href="/jf/cgv/cgvtheaters.jf?tno=${reservation.theaterNo }" style="color: gray;">[극장정보]</a>
												</div>
												<div class="row newline">
													<span>관람일시 <strong><fmt:formatDate 	value="${reservation.screeningDate }" pattern="yyyy.MM.dd(E)" /> ${reservation.screeningTime }</strong></span>
												</div>
											</div>
											<div class="col-sm-4">
												<div class="row newline2">
													<span>일반 ${reservation.reservationCount }</span>
												</div>
												<div class="row newline">
													<span>결제 금액 <strong><fmt:formatNumber value="${reservation.reservationCount * 10000 }" pattern="#,###.##"/>원</strong></span>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</c:if>
						</div>
						<div class="row">
							<div class="col-sm-12 mycgv_reservation_records">
								<div class="row">
									<div class="col-sm-4 mycgv_myqna_div">
										<span class="mycgv_reservationRecord2">MY QNA</span> <span
											class="mycgv_howmany">${QuestionCount }건</span>
										<div class="mycgv_plus">
											<a href="http://localhost/jf/member/questionlist.jf?pno=1"><span>+</span></a>
										</div>

									</div>
									<div class="col-sm-12">
										<hr class="mycgv_hr_1" />
									</div>
									<div class="col-sm-12">
										<div class="row" style="margin-top: 10px;">
											<div class="col-sm-12">
												<table class="table">
													<col width="10%">
													<col width="25%">
													<col width="30%">
													<col width="20%">
													<col width="20%">
													<thead>
														<tr class="warning">
															<th class="text-center">번호</th>
															<th class="text-center">문의CGV</th>
															<th class="text-center">제목</th>
															<th class="text-center">등록일</th>
															<th class="text-center">답변상태</th>
														</tr>
													</thead>
													<tbody class="active">
														<c:choose>
															<c:when test="${not empty questions }">
																<c:forEach var="question" items="${questions }">
																	<tr class="text-center" style="font-size: 13px;">
																		<td>
																			${question.no }</td>
																		<td>${question.theaterName }</td>
																		<td><a style="color: black;"
																			href="questionanserform.jf?pno=${param.pno }&qno=${question.no }">${question.title }</a></td>
																		<td><fmt:formatDate
																				value="${question.createDate }" /></td>
																		<td><c:if test="${question.status eq '답변완료' }">
																				<span class="label label-danger">답변완료</span>
																			</c:if> <c:if test="${question.status eq '답변대기중' }">
																				<span class="label label-default">답변대기중</span>
																			</c:if></td>
																	</tr>
																</c:forEach>
															</c:when>
															<c:otherwise>
																<tr>
																	<td style="font-size:14px;" colspan="6" class="text-center">문의사항 글이 없습니다.</td>
																</tr>
															</c:otherwise>
														</c:choose>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-12">
									<hr class="mycgv_hr_2" />
								</div>
							</div>
						</div>
					</div>
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
									<select class="mycgv_selects" id="select_theater" name="show_theater"
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