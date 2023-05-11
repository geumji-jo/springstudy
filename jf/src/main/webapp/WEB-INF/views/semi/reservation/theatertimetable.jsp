<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>영화별 상영시간표 &lt; 상영시간표 | 영화 그 이상의 감동. CGV</title>
  <link rel="shortcut icon" href="/jf/photos/cj_logo.ico" />
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/jf/resources/bootstrap/css/bootstrap.min.css">
  <script src="/jf/resources/bootstrap/js/jquery.min.js"></script>
  <script src="/jf/resources/bootstrap/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="/jf/resources/bootstrap/css/timetable.css">
  <link rel="stylesheet" href="/jf/resources/bootstrap/css/mycgv.css">
</head>
<body>
<%@ include file="../../common/navigation.jsp" %>
<div class="container">
    <div class="tab-menu">
        <div class="row">
            <div class="col-sm-12 text-center" style="margin-top: 20px;">
                <img src="/jf/photos/moviett_ribon_left.png" style="width: 19px; margin-right: -4px; margin-bottom: -14px;"/>
                <div class="select-tam">
                    <a href="theatertimetable.jf" class="selected-tt">극장별 상영시간표</a>
                    <span>|</span>
                    <a href="movietimetable.jf?sort=1">영화별 상영시간표</a>
                </div>
                <img src="/jf/photos/moviett_ribon_right.png" style="width: 19px; margin-left: -4px; margin-bottom: -14px;"/>
            </div>
        </div>
        <div class="row">
        	<div class="col-sm-12">
		        <div class="theater-top">
			        <div class="row">
			        	<div class="col-sm-1">
				        	<img src="/jf/photos/theater_favorite_cgv.png" alt="" style="margin-top:30px; position:absolute; margin-left:80px;">
			        	</div>
			        	<div class="col-sm-10 favorite-cgv-list" style="margin-top:15px;">
			        		<ul class="theater-top-favoriteTheaters">
										<li style="" class="text-center"><a
												href="/jf/cgv/cgvtheaters.jf?tno=${Mytheaters[0].theaterNo }">${Mytheaters[0].theaterName }</a></li>
										<li style="" class="text-center"><a
												href="/jf/cgv/cgvtheaters.jf?tno=${Mytheaters[1].theaterNo }">${Mytheaters[1].theaterName }</a></li>
										<li style="" class="text-center"><a
												href="/jf/cgv/cgvtheaters.jf?tno=${Mytheaters[2].theaterNo }">${Mytheaters[2].theaterName }</a></li>
										<li style="" class="text-center"><a
												href="/jf/cgv/cgvtheaters.jf?tno=${Mytheaters[3].theaterNo }">${Mytheaters[3].theaterName }</a></li>
										<li style="" class="text-center"><a
												href="/jf/cgv/cgvtheaters.jf?tno=${Mytheaters[4].theaterNo }">${Mytheaters[4].theaterName }</a></li>
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
		        </div>
        	</div>
        </div>
        <div class="row">
	        <div class="col-sm-10 col-sm-offset-1 theater-list-a">
	        	<c:forEach var="city" items="${cities }">
		            <span><a href="theatertimetable.jf?city=${city }" class="${city eq param.city ? 'select-city' : '' }">${city }</a></span>
	        	</c:forEach>       
	        </div>
    	</div>
    	<div class="row">
    		<div id="theater-box" class="col-sm-10 col-sm-offset-1 theater-list-a-items">
   			<c:forEach var="theater" items="${theaters }">
    			<c:if test="${theater.city eq param.city }">
	    			<span><a href="" onclick="showMovies(event, this, '${theater.name }')" class="theater-name">${theater.name }</a></span>
	    			<!-- <span class="last-line">|</span> -->		
    			</c:if> 				
   			</c:forEach>
    		</div>
    	</div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <h1 class="title" id="theater-name-box"></h1>
        </div>
    </div>
    <div class="row theater-list">
        <div class="col-sm-12">
            <div class="row time-table">
                <div class="col-sm-1">
                    <button class="btn btn-link">
                        <img src="/jf/photos/moviett_left2.png" class="select-left"/>
                    </button>
                </div>
                <div class="col-sm-10" id="timetable-date-box"></div>
                <div class="col-sm-1">
                    <button class="btn btn-link">
                        <img src="/jf/photos/moviett_right2.png" class="select-right"/>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="row" style="border-bottom: 1px solid #aaa;">
        <div class="col-sm-12">
            <p>
                <img src="/jf/photos/moviett_sun.png" class="movie-sun"/><strong>조조</strong>
                <img src="/jf/photos/moviett_moon.png" class="movie-moon"/><strong>심야</strong>
                <span style="color: #794623">* 시간을 클릭하시면 빠른 예매를 하실 수 있습니다.</span>
            </p>
        </div>
    </div>
    <div class="row time-table">
        <div class="col-sm-12" id="timetable-movie-box"></div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <p>* 입장 지연에 따른 관람불편을 최소화하고자 영화는 약 10분 후에 시작됩니다. 관람 에티켓을 위한 사전 입장 부탁드립니다.</p>
        </div>
    </div>
</div>
<%@ include file="../../common/footer.jsp" %>
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
														<a href="/jf/cgv/cgvtheaters.jf?tno=${my.theaterNo }">${my.theaterName }</a>
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

	<script>
		function showMovies(e, el, tname) {
			e.preventDefault();
			
			$('#timetable-movie-box').empty();
			$('#theater-name-box').empty();
			
			var week = ['일', '월', '화', '수', '목', '금', '토'];
			var today = new Date();
			var mm = today.getMonth()+1;
			var dd = today.getDate();
			var dy = week[today.getDay()];
			
			var theaterList = document.querySelectorAll('#theater-box span a');
			for(var i=0; i<theaterList.length; i++) {
				theaterList[i].classList.remove('theater-name-on');
			}
			el.classList.add('theater-name-on');
			
			var xhr = new XMLHttpRequest();
			
			xhr.onreadystatechange = function() {
				if(xhr.readyState == 4 && xhr.status == 200) {
					var movies = JSON.parse(xhr.responseText);
					
					console.log("movies", movies);
					
					var htmlContents1 = "";
					var htmlContents2 = "";
					if(movies.dates.length == 0) {
						htmlContents1 += "<div class=\"col-sm-1 select-date selected\">";
						htmlContents1 += "<a href=\"#\">";
						htmlContents1 += "<div class=\"row\">";
						htmlContents1 += "<div class=\"col-sm-6 month-week\">";
						if(mm < 10) {
							htmlContents1 += "<p>0" + mm + "월</p>";
						} else {
							htmlContents1 += "<p>" + mm + "월</p>";						
						}
						htmlContents1 += "<p>" + dy + "</p>";
						htmlContents1 += "</div>";
						htmlContents1 += "<div class=\"col-sm-6 day\">";
						if(dd < 10) {
							htmlContents1 += "0" + dd;
						} else {
							htmlContents1 += dd;
						}
						htmlContents1 += "</div></div></a></div>";
						
						htmlContents2 += "<div class=\"row text-center\" style=\"border-bottom: 2px solid #000;\">";
						htmlContents2 += "<p style=\"margin-top: 30px; margin-bottom: 30px; font-weight: bold;\">현재 선택하신 날짜에 상영하는 영화가 없습니다.</p>";
						htmlContents2 += "</div>";
						
						document.getElementById('timetable-date-box').innerHTML = htmlContents1;
						document.getElementById('timetable-movie-box').innerHTML = htmlContents2;
						document.getElementById('theater-name-box').textContent = tname;
						return;
					}
					
					var dateArray = [];
					for(var i=0; i<movies.dates.length; i++) {
						var date = movies.dates[i].split('-');
						dateArray.push(date);
					}
					console.log("dateArray", dateArray);
					
					for(var i=0; i<dateArray.length; i++) {
						htmlContents1 += "<div class=\"col-sm-1 select-date\" id=\"select-date-box-" + movies.dates[i] + "\">";
						htmlContents1 += "<a href=\"\" onclick=\"showTimes(this, event, '" + tname + "', '" + movies.dates[i] + "', " + movies.movies[i].movieNo + ")\">";
						htmlContents1 += "<div class=\"row\">";
						htmlContents1 += "<div class=\"col-sm-6 month-week\">";
						htmlContents1 += "<p>" + dateArray[i][0] + "월</p>";						
						htmlContents1 += "<p>" + dateArray[i][2] + "</p>";
						htmlContents1 += "</div>";
						htmlContents1 += "<div class=\"col-sm-6 day\">";
						htmlContents1 += dateArray[i][1];
						htmlContents1 += "</div></div></a></div>";
					}
					
					document.getElementById('timetable-date-box').innerHTML = htmlContents1;
					document.getElementById('theater-name-box').textContent = tname;
				}
			}
			
			xhr.open("GET", "showmovie.jf?tname=" + tname);
			xhr.send();
		}
		
		function showTimes(el, e, tname, screeningDate, mno) {
			e.preventDefault();
			var xhr = new XMLHttpRequest();
			
			var dates = document.querySelectorAll('#timetable-date-box .select-date');
			var date = document.querySelector('#select-date-box-' + screeningDate);
			for(var i=0; i<dates.length; i++) {
				dates[i].classList.remove('selected');
			}
			date.classList.add('selected');
			
			xhr.onreadystatechange = function() {
				if(xhr.readyState == 4 && xhr.status == 200) {
					var screenings = JSON.parse(xhr.responseText);
					
					console.log("screenings", screenings);
					
					var htmlContents = "";
					
					var leftOverSeat = [];
					for(var i=0; i<screenings.screenings.length; i++) {
						for(var j=0; j<screenings.resCount.length; j++) {
							if(screenings.screenings[i].screeningNo == screenings.resCount[j].SCREENINGNO) {
								var los = screenings.screenings[i].roomSeat - screenings.resCount[j].COUNT;
								leftOverSeat.push({
									sno: screenings.screenings[i].screeningNo,
									leftoverseat: los
								});
							} else {
								leftOverSeat.push({
									sno: screenings.screenings[i].screeningNo,
									leftoverseat: screenings.screenings[i].roomSeat
								});
							}
						}
					}
					
					var firstMno = screenings.screenings[0].movieNo;
					var mnoArray = [firstMno];
					for(var i=1; i<screenings.screenings.length; i++) {
						if(firstMno != screenings.screenings[i].movieNo) {
							mnoArray.push(screenings.screenings[i].movieNo);
							firstMno = screenings.screenings[i].movieNo;
						}
					}
					console.log("mnoArray", mnoArray);
					var agelimit = 0;
					var findMovie = {};
					var findScreenings = [{no: screenings.screenings[0].movieNo,
										   room: screenings.screenings[0].roomName,
										   seat: screenings.screenings[0].roomSeat}];
					for(var j=0; j<screenings.screenings.length-1; j++) {
						if(screenings.screenings[j].movieNo == screenings.screenings[j+1].movieNo) {
							if(screenings.screenings[j].roomName == screenings.screenings[j+1].roomName) {
								continue;
							} else {
								findScreenings.push({
									no: screenings.screenings[j+1].movieNo,
									room: screenings.screenings[j+1].roomName,
									seat: screenings.screenings[j+1].roomSeat
								});
							}
						} else {
							findScreenings.push({
								no: screenings.screenings[j+1].movieNo,
								room: screenings.screenings[j+1].roomName,
								seat: screenings.screenings[j+1].roomSeat
							});
						}
					}
					for(var i=0; i<mnoArray.length; i++) {
						for(var j=0; j<screenings.ageLimits.length; j++) {
							if(mnoArray[i] == screenings.ageLimits[j].MOVIENO) {
								agelimit = screenings.ageLimits[j].MOVIEAGELIMIT;
								break;
							}
						}
						for(var j=0; j<screenings.movies.length; j++) {
							if(mnoArray[i] == screenings.movies[j].no) {
								findMovie = {
										korTitle: screenings.movies[j].korTitle,
										genre: screenings.movies[j].genre,
										runningTime: screenings.movies[j].runningTime,
										releaseDate: screenings.movies[j].releaseDate
								};
								break;
							}
						}
						/*
						var firstroom = screenings.screenings[0].roomName;
						for(var j=1; j<screenings.screenings.length; j++) {
							if(mnoArray[i] == screenings.screenings[j].movieNo && firstroom != screenings.screenings[j].roomName) {
								findScreenings.push({
										no: screenings.screenings[j].movieNo,
										room: screenings.screenings[j].roomName,
										seat: screenings.screenings[j].roomSeat
								});
								firstroom = screenings.screenings[j].roomName;
							}
						}
						*/
						
						
						console.log("findScreenings", findScreenings);
						htmlContents += "<div class=\"row\" style=\"border-bottom: 1px solid #aaa;\">";
						htmlContents += "<div class=\"col-sm-12 timetable-list\">";
						htmlContents += "<div class=\"cgv-movie-info\" style=\"margin: 5px 30px;\">";
						htmlContents += "<span class=\"ico-grade grade-" + agelimit + "\"></span>";
						htmlContents += "<a href=\"\">" + findMovie.korTitle + "</a>";
						htmlContents += "<img src=\"/jf/photos/screeningY.png\"/>";
						htmlContents += "<div>" + findMovie.genre + " / " + findMovie.runningTime + "분 / " + findMovie.releaseDate + " 개봉</div>";
						htmlContents += "</div>";
						for(var j=0; j<findScreenings.length; j++) {
							if(mnoArray[i] == findScreenings[j].no) {
								htmlContents += "<div style=\"margin: 10px 55px;\">";
								htmlContents += "<div class=\"row gly\">";
								htmlContents += "<span class=\"glyphicon glyphicon-triangle-right\"></span> 2D | ";
								htmlContents += findScreenings[j].room + " | 총 ";
								htmlContents += findScreenings[j].seat + "석</div>";
								htmlContents += "<div class=\"row\" style=\"margin: 5px 15px;\">";
								for(var k=0; k<screenings.screenings.length; k++) {
									var los = screenings.screenings[k].roomSeat;
									for(var x=0; x<screenings.resCount.length; x++) {
										if(screenings.screenings[k].screeningNo == screenings.resCount[x].SCREENINGNO) {
											los = screenings.screenings[k].roomSeat - screenings.resCount[x].COUNT;
											if(los == 0) {
												los = "매진";
											}
											break;
										}
									}
									if(findScreenings[j].no == screenings.screenings[k].movieNo && findScreenings[j].room == screenings.screenings[k].roomName) {
										if(los == "매진") {
											htmlContents += "<a href=\"\" onclick=\"losIsZero(event)\"><div class=\"col-sm-1\" style=\"border: 1px solid #aaa;\">";
											htmlContents += "<p><strong style=\"color: #000;\">" + screenings.screenings[k].screeningTime + "</strong></p>";
											htmlContents += "<p style=\"font-size: 13px;\">" + los + "</p>";
											htmlContents += "</div></a>";
										} else {
											htmlContents += "<a href=\"reservation.jf?sno=" + screenings.screenings[k].screeningNo + "\"><div class=\"col-sm-1\" style=\"border: 1px solid #aaa;\">";
											htmlContents += "<p><strong style=\"color: #000;\">" + screenings.screenings[k].screeningTime + "</strong></p>";
											htmlContents += "<p style=\"font-size: 13px;\">" + los + "석</p>";
											htmlContents += "</div></a>";
										}
									}
								}
								htmlContents += "</div></div>";
							}
						}
						htmlContents += "</div></div>";							
					}
					document.getElementById('timetable-movie-box').innerHTML = htmlContents;
				}
			}
			
			xhr.open("GET", "showtime.jf?tname=" + tname + "&sdate=" + screeningDate + "&mno=" + mno);
			xhr.send();
		}
		
		function losIsZero(e) {
			e.preventDefault();
			alert("해당 상영시간은 예매할 수 없습니다.");
		}
		
		
		// 해훈
		
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
				location.href = 'reservation/theatertimetable.jf';
			}
		}
	</script>
	
	
</body>
</html>