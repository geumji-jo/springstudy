<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>극장 &lt; ${param.city } &lt; ${theater.name} | 영화 그 이상의 감동. CGV</title>
 <link rel="shortcut icon" href="/jf/photos/cj_logo.ico" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/footer.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Nunito"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/jf/resources/bootstrap/css/header.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/CGVtheater.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/main.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/mycgv.css">
<style>
@media ( min-width : 768px) {
	.container {
		width: 750px;
	}
}

@media ( min-width : 992px) {
	.container {
		width: 1010px;
	}
}

.theater_3_1_mainImg {
	
	width: 980px;
	height: 420px;
	background-origin: padding-box;
}

.theater_bottom_hands_div>a {
	color: black;
}
</style>
</head>

<body onload="">
	<%@ include file="../../common/navigation.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="theater-top">
					<div class="row">
						<div class="col-sm-10 col-sm-offset-1 theater-top-row-1">
							<img src="/jf/photos/theater_favorite_cgv.png" alt="">
							<ul class="theater-top-favoriteTheaters">
								<c:forEach begin="0" end="4" varStatus="status" >
									<li style="" class="text-center"><a	href="/jf/cgv/cgvtheaters.jf?tno=${Mytheaters[status.index].theaterNo }&city=${Mytheaters[status.index].city}">${Mytheaters[status.index].theaterName }</a></li>
								</c:forEach>
							</ul>
							<c:choose>
								<c:when test="${not empty LOGINMEMBER }">
									<button class="theater_btn_set_myFavorite" data-toggle="modal" data-target="#exampleModal">
										<span>+</span>
									</button>
								</c:when>
								<c:otherwise>
									<button class="theater_btn_set_myFavorite" onclick="goWrite(${param.tno})">
										<span>+</span>
									</button>
								</c:otherwise>
							</c:choose>
							
						</div>
					</div>
					<div class="row">
						<div class="col-sm-10 col-sm-offset-1 theater_1_1">
							<hr class="theater_top_hr">
							<div class="row">
								<div class="col-sm-12 top_CGVregion">
									<ul class="theater_top_Theaters text-center">
										<c:forEach var="city" items="${cats }"> <!--cats: city and theater -->
											<a href="cgvtheaters.jf?tno=${city.tno }&city=${city.city}">
												<li class=" text-center ${param.city eq city.city? 'theater_active' : '' }">${city.city }</li>
											</a>
										</c:forEach>
									</ul>
								</div>
							</div>
							<hr class="theater_top_hr_2">
							<div class="row">
								<div class="col-sm-12">
									<ul class="theater_top_CGVList">
										<c:forEach var="theater" items="${theaters }">
											<a href="cgvtheaters.jf?tno=${theater.no }&city=${theater.city}"><li class="${(empty param.tno ? 1 : param.tno) eq theater.no ? 'theater_active2' : ''}">${theater.name }</li></a>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row theater_main_row">
			<div class="col-sm-12 theater_bottom_main_col">
				<div class="row">
					<div class="col-sm-12 text-center theater_2_1_img">
						<img src="/jf/photos/theater_theater.gif" alt="">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12 theater_3_1_mainInfoName">
						<h1>
							<strong>${theater.name }</strong>
						</h1>
					</div>
				</div>
				<div class="row theater_3_1_main_img_row1">
				<c:choose>
					<c:when test="${not empty theater.photo }">
						<div style="background-image: url('/jf/photos/theaterphotos/${theater.photo}');" class="col-sm-12 theater_3_1_mainImg">
					</c:when>
					<c:otherwise>
						<div style="background-image: url('/jf/photos/theaterphotos/northpohang.jpg');" class="col-sm-12 theater_3_1_mainImg">
					</c:otherwise>
				</c:choose>
					<div style="" class="col-sm-12 theater_3_1_mainImg">
					
						<div class="row theater_3_1_main_ImgRow">
							<div class="col-sm-5 theater_3_1_main_info">
								<p>
									<strong>${theater.location } <a
										class="theater_parking" href="">위치/주차 안내></a></strong>
								</p>
								<p>1544-1122</p>
								<p>${roomsCount }관/${seatsCount }석</p>
							</div>
							<div class="col-sm-2 theater_3_1_main_info tmi">
								<span id="theater_sweetbox"> SWEETBOX </span>
							</div>
							<div class="col-sm-5 theater_info_notice">
								<div class="row ">
									<div class="col-sm-3">
										<p>
										<a class="theater_notice_title1" href="http://localhost/jf/semi/admin/customercenter-noticelist.jf?pno=1">
											공지사항
										</a>
										</p>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12 ">
										<c:forEach var="notice" items="${notices }">
											<p>
												<a class="theater_notice_title" href="/jf/semi/admin/customercenter-noticeform.jf?pno=1&nno=${notice.no }">
													${notice.title } </a>
											</p>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row theater_MIBjpg_row ">
					<div class="col-sm-12 ">
						<img src="/jf/photos/MIB.jpg" alt="">
					</div>
				</div>
				<div class="row theater_3_1_main_img_row1">
					<div class="col-sm-12 text-center time-parking_main-info">
						<a href=""><span class="theater_time_parking_main_info_span"><span
								class="glyphicon glyphicon-hand-right"></span> 상영시간표 & 위치/주차안내</span></a>
					</div>
				</div>
				<div class="row theaxxter_bottom_timetable_row">
					<div class="col-sm-10">
						<hr class="theater_bottom_timetable_hr">
						<div class="row theater_bottom_timetable_time">
							<div
								class="col-sm-1 theater_bottom_hands_div theater_bottom_hands_div_left">
								<a href=""><span class="glyphicon glyphicon-hand-left"></span></a>
							</div>
							<div class="col-sm-10 theater_bottom_date_div">
								<!--                               날짜 반복 시작-->
								<c:choose>
									<c:when test="${not empty monthAndDates }">
										<c:forEach var="a" items="${monthAndDates }">
											<a class="theater_screening_dates" id="${a.fullDate }"
												onclick="selectDate(event,'${a.fullDate}',${param.tno })"
												href="#">
												<span class="">
													<span class="theater_bottom_dates_1"> ${a.month }월 </span>
													<span class="theater_bottom_dates_2">${a.date }</span>
											</span>
											</a>
										</c:forEach>
										<!--                               날짜 반복 끝-->
									</c:when>
								</c:choose>

							</div>
							<div
								class="col-sm-1 theater_bottom_hands_div theater_bottom_hands_div_right">
								<a href=""> <span class="glyphicon glyphicon-hand-right"></span>
								</a>
							</div>

							<div class="col-sm-12">
								<hr class="theater_bottom_timetable_hr_2">
							</div>
						</div>

						<div class="row">
							<div class="col-sm-7 theater_BN_imgDiv">
								<img src="/jf/photos/theater_sun.PNG" alt=""> <span>조조</span>
								<img src="/jf/photos/theater_moon.png" alt=""><span>심야</span>
								<span class="theater_BN_info">* 시간을 클릭하시면 빠른 예매를 하실 수
									있습니다.</span>
							</div>
							<div class="col-sm-5 text-right">
								<span class="glyphicon glyphicon-info-sign"></span>
								<a style="color:black;" href="price.jf"><span class="theater_BN_info_2">관람가격 안내</span></a>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12 theater_bottom_timetable_hr_3_div">
								<hr class="theater_bottom_timetable_hr_3">
							</div>
						</div>
						<!-- 영화 1개 시간표 시작-->
						<div id="ajax_theater_timetable" class=""></div>
						<!-- 영화 1개 시간표 끝-->

						<div class="theater_bottom_event_div ">
							<div class="row ">
								<div class="col-sm-12 text-center theater_bottom_event_img_div">
									<img src="/jf/photos/theater_relation_event.gif" alt="">
								</div>
							</div>

							<div class="row theater_bottom_event_imgs">
								<a href="">
									<div class="col-sm-4">
										<img src="/jf/photos/theater_event_mileage.jpg" alt="">
									</div>
								</a> <a href="">
									<div class="col-sm-4">
										<img src="/jf/photos/theater_event_erand.jpg" alt="">
									</div>
								</a> <a href="">
									<div class="col-sm-4">
										<img src="/jf/photos/theater_event_citizen.jpg" alt="">
									</div>
								</a>
							</div>

							<div class="row theater_bottom_event_info">
								<div class="col-sm-4 ">
									CGV 극장별 <br> 이랜드몰 제휴 전사 프로모션
								</div>
								<div class="col-sm-4">

									CGV 극장별 <br> [CGV 강남 23개 극장]
								</div>
								<div class="col-sm-4">
									CGV 극장별 <br> [CGV 강남 외 25개극장] 서울시...
								</div>
							</div>
							</a>
							<div class="row theater_bottom_event_period">
								<div class="col-sm-4">기간: 2019.05.22 ~ 2019.05.22</div>
								<div class="col-sm-4">기간: 2019.05.22 ~ 2019.05.22</div>
								<div class="col-sm-4">기간: 2019.05.22 ~ 2019.05.22</div>
							</div>

						</div>
					</div>
					<div class="col-sm-2 theater_sideADimg">
						<img src="/jf/photos/sidead_gozila.png" alt=""> <img
							src="/jf/photos/sidead_giftcard.jpg" alt="">
					</div>
				</div>
			</div>
		</div>
	</div>

	<!----- 지우지마시오 ----->
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
										<c:forEach var="my" items="${Mytheaters }">
											<li>
												<div class="li-box">
													<div class="mytheater-li">
														<a href="/jf/cgv/cgvtheaters.jf?tno=${my.theaterNo }&city=${my.city}">${my.theaterName }</a>
													</div>
													<button onclick="remove(${my.no})" class="remove-button"></button>
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

	

	<!-- Footer -->
	<%@ include file="../../common/footer.jsp"%>
	<!-- footer -->
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
			
		xhr.open("GET", "/jf/member/addMyTheater.jf?theater="+theater);
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
			
			xhr.open("GET", "/jf/member/removeMyTheater.jf?mytheaterNo="+mytheaterNo);
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
			xhr.open("GET", "/jf/member/showTheater.jf?city="+city);
			xhr.send();
		}
		function goWrite(tno){
			if('${empty LOGINMEMBER}'){
	    		var result = confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?");
	    		if(result){
	    			location.href = '/jf/member/login.jf?result';
	    			return;
	    		}
			} else{
				location.href = 'cgv/cgvtheaters.jf?tno='+tno;
			}
		}
		
		
        
		function selectDate(event,fullDate,tno){
			
			if (event) {
				event.preventDefault();
			}
			
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					var screening = JSON.parse(xhr.responseText);
					var htmlContent = '';
					console.log(screening);
					if(screening != undefined){
					for(var i=0; i<screening.length; i++){
						var screen = screening[i];
						htmlContent += '<div class="movie_showing_time_div">';
						htmlContent += '<div class="row"><div class="col-sm-1"><img class="theater_screening_image1" src="/jf/photos/theater_age_'+screen.ageLimit+'.PNG" alt="">';
						htmlContent += '</div>';
						htmlContent += '<div class="col-sm-11 thater_movie_bottom_infotable"><span class="theater_bottom_movieName"><a href="/jf/movie/moviedetail.jf?mno='+screen.movieNo+'">'+screen.movieName+'</a></span>';
						htmlContent += '<img class="theater_screening_image2" src="/jf/photos/theater_movie_showing.PNG"> ';
						htmlContent += '<span class="theater_bottom_movieInfo">'+screen.genre+'/'+screen.runningTime+'분/'+screen.releaseDate+' 개봉 </span>';
						/* 2d 1관 1층, 밑에 시간표 1줄 시작 */
						for(var j=0; j<screen.rooms.length; j++){
							var room = screen.rooms[j];
							htmlContent += '<div class="row thater_movie_bottom_infotable_2"><div class="col-sm-12 thater_movie_bottom_infotable_2_1">';
							htmlContent += '<span class="glyphicon glyphicon-play"></span>'+room.roomNo+'관	<div class="theater_border_right_hr"></div>	총 '+room.totalSeat+'석';
							htmlContent += '<div class="theater_border_right_hr"></div></div><div class="col-sm-10 theater_movie_timetable_div">';
							/* 상영시간 반복 시작  */
							for(var k=0; k<room.roomDetail.length; k++){
								var roomDetail = room.roomDetail[k];
								htmlContent += '<span class="screeningDatediv">'+roomDetail.dates+'</span>';
								htmlContent += '<a class="screeningAtag" href="/jf/reservation/reservation.jf?sno='+roomDetail.screeningNo+'">';
								htmlContent += '<div class="theater_movie_timetable ">';
								htmlContent += '	<div id="screeningTimes" class="theater_movie_timetable_1 text-center">';
								htmlContent += '		<span class="scTime">'+roomDetail.times+'</span>';
								htmlContent += '	</div>';
								htmlContent += '	<div class="theater_movie_timetable_2 text-center">';
								htmlContent += '		<span class="scSeats">'+roomDetail.leftSeat+'</span>'+'<span class="scSeats2">석</span>';
								htmlContent += '	</div>';
								htmlContent += '</div>';
								htmlContent += '</a>';
								
							}
							/* 상영시간 반복 끝 */
							htmlContent += '</div>';
							htmlContent += '</div>';
						}
						htmlContent += '</div>';
						htmlContent += '</div><hr class="theater_bottom_timetable_hr_4"></div>';
					}
					document.getElementById("ajax_theater_timetable").innerHTML = htmlContent;
					
					$(".theater_screening_dates").removeClass('theater_date_active');
					$('#'+fullDate).addClass('theater_date_active');

/* 					var element = document.getElementById(fullDate);
					element.classList.add('theater_date_active'); */
					}
					
					checkScreeningTime();
					
				}
			}
			xhr.open("GET", "/jf/member/ajaxTimeTable.jf?tno="+tno+"&date="+fullDate);
		    xhr.send();
		}
		selectDate(null, '${today}','${param.tno}');
		
		function checkScreeningTime() {
			var screeningDiv = document.querySelectorAll(".theater_movie_timetable");
			var screeningAtage = document.querySelectorAll(".screeningAtag");
			var screeningDates = document.querySelectorAll(".screeningDatediv");
			
			var ScreeningTime = document.querySelectorAll(".scTime");
			var ScreeningSeats = document.querySelectorAll(".scSeats");
			var ScreeningSeats2 = document.querySelectorAll(".scSeats2");
			
			for(var i=0; i<ScreeningTime.length; i++){
				var screeningLeftSeats = ScreeningSeats[i].innerHTML;
				screeningLeftSeats = Number(screeningLeftSeats);
				
				var nowTimeMonth = new Date().getMonth()+1;
				var nowTimeDate = new Date().getDate();
				
				var nowTimeHours = new Date().getHours();
		        var nowTimeMinutes = new Date().getMinutes();
		        
		        var screeningMonth = screeningDates[i].innerHTML.substr(0,2);
		        var screeningDate = screeningDates[i].innerHTML.substr(3,2);
		        
		        var screeningHours = ScreeningTime[i].innerHTML.substr(0,2);
		        var screeningMinutes = ScreeningTime[i].innerHTML.substr(3,2);
		        var screeningseats2 = ScreeningSeats2[i].innerHTML;
		        
		        if(screeningLeftSeats <= 0){
		        	screeningAtage[i].removeAttribute("href");
		        	screeningDiv[i].style.cursor="default";
		        	ScreeningTime[i].style.color="#b3b3b3";
		        	ScreeningSeats[i].style.color="#b3b3b3";
		        	ScreeningSeats[i].innerHTML = "매진";
		        	ScreeningSeats2[i].innerHTML = "";
		        	
				}
		        if(nowTimeMonth == screeningMonth && nowTimeDate == screeningDate){
			        if(nowTimeHours > screeningHours){
			        	screeningAtage[i].removeAttribute("href");
			        	screeningDiv[i].style.cursor="default";
			        	ScreeningTime[i].style.color="#b3b3b3";
			        	ScreeningSeats[i].style.color="#b3b3b3";
			        	ScreeningSeats[i].innerHTML = "마감";
			        	ScreeningSeats2[i].innerHTML = "";
			        } else if(nowTimeHours == screeningHours){
			        	if(nowTimeMinutes > screeningMinutes){
			        		screeningAtage[i].removeAttribute("href");
			        		screeningDiv[i].style.cursor="default";
			        		ScreeningTime[i].style.color="#b3b3b3";
			        		ScreeningSeats[i].style.color="#b3b3b3";
			        		ScreeningSeats[i].innerHTML = "마감";
			        		ScreeningSeats2[i].innerHTML = "";
				        }	
			        }
		        }
			}
		};
		</script>
</body>
</html>

