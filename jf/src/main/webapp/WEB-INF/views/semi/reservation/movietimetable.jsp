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
</head>
<body>
<%@ include file="../../common/navigation.jsp" %>
<div class="container">
    <div class="tab-menu">
        <div class="row">
            <div class="col-sm-12 text-center" style="margin-top: 20px;">
                <img src="/jf/photos/moviett_ribon_left.png" style="width: 19px; margin-right: -4px; margin-bottom: -14px;"/>
                <div class="select-tam">
                    <a href="theatertimetable.jf">극장별 상영시간표</a>
                    <span>|</span>
                    <a href="movietimetable.jf?sort=1" class="selected-tt">영화별 상영시간표</a>
                </div>
                <img src="/jf/photos/moviett_ribon_right.png" style="width: 19px; margin-left: -4px; margin-bottom: -14px;"/>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 text-center icon">
                <a href="movietimetable.jf?sort=1" class="${param.sort eq '1' ? 'ico ticket on' : 'ico ticket' }"><span>예매율순</span></a>
                <img src="/jf/photos/moviett_bg_writeinfo.gif" style="width: 1px;"/>
                <a href="movietimetable.jf?sort=3" class="${param.sort eq '3' ? 'ico grade on' : 'ico grade' }"><span>평점순</span></a>
                <img src="/jf/photos/moviett_bg_writeinfo.gif" style="width: 1px;"/>
                <a href="movietimetable.jf?sort=4" class="${param.sort eq '4' ? 'ico person on' : 'ico person' }"><span>관람객순</span></a>
            </div>
        </div>
        <div class="row movie-section">
            <div class="col-sm-3 col-movie-detail" id="movie-poster-box"></div>
            <div class="col-sm-5" style="height: 300px; overflow: auto; margin-top: 10px;">
                <div style="width: 95%; float: left; margin-right: 10px;">
		        	<input type="hidden" id="city-name-box"/>
                    <ul class="movie-menu" id="movie-menu">
                    <c:forEach var="movie" items="${movies }">
                       	<li class="" onclick="showScreenings(this, ${param.sort }, ${movie.no })">
             	            <span class="ico-grade grade-${movie.ageLimit }"></span><span class="movie-title">${movie.korTitle }</span>
                       	</li>
                    </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="box-movie-type">
                    <div class="row">
                        <div class="col-sm-5 type-text">
                            <a>2D</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <h1 id="movie-title-box" class="title"></h1>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12 theater-list">
        	<input type="hidden" id="movie-no"/>
        	<input type="hidden" id="screening-date"/>
        	<c:forEach var="city" items="${cities }">
        		<c:choose>
        			<c:when test="${city eq '서울' }">
        				<c:set var="cn" value="seoul"></c:set>
        			</c:when>
        			<c:when test="${city eq '부산/울산' }">
        				<c:set var="cn" value="bsus"></c:set>
        			</c:when>
        			<c:when test="${city eq '인천' }">
        				<c:set var="cn" value="incheon"></c:set>
        			</c:when>
        			<c:when test="${city eq '광주/전라/제주' }">
        				<c:set var="cn" value="gjj"></c:set>
        			</c:when>
        			<c:when test="${city eq '강원' }">
        				<c:set var="cn" value="kangwon"></c:set>
        			</c:when>
        			<c:when test="${city eq '대전/충청' }">
        				<c:set var="cn" value="djcc"></c:set>
        			</c:when>
        			<c:when test="${city eq '대구' }">
        				<c:set var="cn" value="daegu"></c:set>
        			</c:when>
        			<c:when test="${city eq '경상' }">
        				<c:set var="cn" value="kyeongsang"></c:set>
        			</c:when>
        			<c:otherwise>
        				<c:set var="cn" value="kyeongi"></c:set>
        			</c:otherwise>
        		</c:choose>
        		<span id="city-box"><a href="" id="city-name-${cn }" class="${city eq '서울' ? 'select-city-movie on' : 'select-city-movie' }" onclick="showTheaters(event, this, '${city }', '${cn }', ${findMovie.no })">${city }</a></span>
        	</c:forEach>
        </div>
    </div>
    <div class="row theater-list" style="border-top: 1px solid #aaa;">
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
        <div class="col-sm-12" id="timetable-theater-box"></div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <p>* 입장 지연에 따른 관람불편을 최소화하고자 영화는 약 10분 후에 시작됩니다. 관람 에티켓을 위한 사전 입장 부탁드립니다.</p>
        </div>
    </div>
</div>
<%@ include file="../../common/footer.jsp" %>

<script type="text/javascript">
	function showTheaters(e, el, city, cn, mno) {
		e.preventDefault();
		document.getElementById('city-name-box').value = city;
		var xhr = new XMLHttpRequest();
		
		$('#timetable-theater-box').empty();
		
		var cnames = document.querySelectorAll('#city-box a');
		var cname = document.querySelector('#city-name-' + cn);
		for(var i=0; i<cnames.length; i++) {
			cnames[i].classList.remove('on');
		}
		cname.classList.add('on');
		
		var week = ['일', '월', '화', '수', '목', '금', '토'];
		var today = new Date();
		var mm = today.getMonth()+1;
		var dd = today.getDate();
		var dy = week[today.getDay()];
		
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var cities = JSON.parse(xhr.responseText);
				console.log("cities", cities);
				
				var htmlContents1 = "";
				var htmlContents2 = "";
				var htmlContents3 = "";
				
				var cityArray = [{
					city: cities.ticketings[0].theaterCity,
					name: cities.ticketings[0].theaterName
				}];
				var firstcity = cityArray[0].city;
				var firstname = cityArray[0].name;
				for(var i=1; i<cities.ticketings.length; i++) {
					if(firstname != cities.ticketings[i].theaterName) {
						cityArray.push({
							city: cities.ticketings[i].theaterCity,
							name: cities.ticketings[i].theaterName
						});
						firstcity = cities.ticketings[i].theaterCity;
						firstname = cities.ticketings[i].theaterName;
					}
				}
				console.log("cityArray", cityArray);
				
				if(cities.dates.length == 0) {
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
					document.getElementById('timetable-theater-box').innerHTML = htmlContents2;
					return;
				}
				
				var dateArray = [];
				for(var i=0; i<cities.dates.length; i++) {
					var date = cities.dates[i].split('-');
					dateArray.push(date);
				}
				
				console.log("dateArray 배열 ", dateArray);
				
				for(var i=0; i<dateArray.length; i++) {
					htmlContents1 += "<div class=\"col-sm-1 select-date\" id=\"select-date-box-" + cities.dates[i] + "\">";
					htmlContents1 += "<a href=\"#\" onclick=\"showTimes(this, event, " + mno + ", '" + cities.dates[i] + "', '" + cities.ticketings[i].theaterCity + "')\">";
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
			}
		}
		
		xhr.open("GET", "showtheaters.jf?city=" + city + "&mno=" + mno);
		xhr.send();
		
	}
	
	function showScreenings(el, sort, mno) {
		var xhr = new XMLHttpRequest();
		
		document.getElementById('movie-no').value = mno;
		var city = document.getElementById('city-name-box').value;
		if(city == '') {
			city = "서울";
		}
		console.log("받은 거 city", city);
		
		$('#timetable-theater-box').empty();
		
		var week = ['일', '월', '화', '수', '목', '금', '토'];
		var today = new Date();
		var mm = today.getMonth()+1;
		var dd = today.getDate();
		var dy = week[today.getDay()];
		
		var movies = document.querySelectorAll('#movie-menu li');
		for(var i=0; i<movies.length; i++) {
			movies[i].classList.remove('on');
		}
		el.classList.add('on');
		
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var ticketings = JSON.parse(xhr.responseText);
				
				console.log("ticketings", ticketings);

				var htmlContents1 = "";
				var htmlContents2 = "";
				var htmlContents3 = "";
				
				if(ticketings.dates.length == 0) {
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
					
					htmlContents3 += "<img src=\"/jf/photos/movieposters/" + ticketings.movie.poster + "\"/>";
					htmlContents3 += "<p class=\"movie-detail\">" + ticketings.movie.genre + " / " + ticketings.movie.runningTime + "분</p>";
					htmlContents3 += "<p class=\"movie-detail\">" + ticketings.movie.releaseDate + " 개봉</p>";
					
					document.getElementById('timetable-date-box').innerHTML = htmlContents1;
					document.getElementById('timetable-theater-box').innerHTML = htmlContents2;
					document.getElementById('movie-poster-box').innerHTML = htmlContents3;
					document.getElementById('movie-title-box').textContent = ticketings.movie.korTitle;
					return;
				}
				
				var dateArray = [];
				for(var i=0; i<ticketings.dates.length; i++) {
					var date = ticketings.dates[i].split('-');
					dateArray.push(date);
				}
				
				console.log("dateArray 배열 ", dateArray);
				
				for(var i=0; i<dateArray.length; i++) {
					htmlContents1 += "<div class=\"col-sm-1 select-date\" id=\"select-date-box-" + ticketings.dates[i] + "\">";
					htmlContents1 += "<a href=\"#\" onclick=\"showTimes(this, event, " + mno + ", '" + ticketings.dates[i] + "', '" + ticketings.ticketings[i].theaterCity + "')\">";
					htmlContents1 += "<div class=\"row\">";
					htmlContents1 += "<div class=\"col-sm-6 month-week\">";
					htmlContents1 += "<p>" + dateArray[i][0] + "월</p>";						
					htmlContents1 += "<p>" + dateArray[i][2] + "</p>";
					htmlContents1 += "</div>";
					htmlContents1 += "<div class=\"col-sm-6 day\">";
					htmlContents1 += dateArray[i][1];
					htmlContents1 += "</div></div></a></div>";
				}
				
				htmlContents3 += "<img src=\"/jf/photos/movieposters/" + ticketings.movie.poster + "\"/>";
				htmlContents3 += "<p class=\"movie-detail\">" + ticketings.movie.genre + " / " + ticketings.movie.runningTime + "분</p>";
				htmlContents3 += "<p class=\"movie-detail\">" + ticketings.movie.releaseDate + " 개봉</p>";
				
				document.getElementById('timetable-date-box').innerHTML = htmlContents1;
				document.getElementById('movie-poster-box').innerHTML = htmlContents3;
				document.getElementById('movie-title-box').textContent = ticketings.movie.korTitle;
				
			}
		}
		
		xhr.open("GET", "showttformovie.jf?sort=" + sort + "&mno=" + mno + "&city=" + city);
		xhr.send();
	}
	
	function showTimes(el, e, mno, screeningDate, city) {
		e.preventDefault();
		var xhr = new XMLHttpRequest();
		console.log("showTimes에서 받아온 씨티 ", city);
		document.getElementById('screening-date').value = screeningDate;
		var cn = document.getElementById('city-name-box').value;
		if(cn == '') {
			cn = "서울";
		}
		console.log("cn",cn);
		
		var dates = document.querySelectorAll('#timetable-date-box .select-date');
		var date = document.querySelector('#select-date-box-' + screeningDate);
		for(var i=0; i<dates.length; i++) {
			dates[i].classList.remove('selected');
		}
		date.classList.add('selected');
		
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var times = JSON.parse(xhr.responseText);
				
				console.log("times", times);
				
				if(times.length != 0) {
					var tar = [{theater: times.times[0].theaterName, room: times.times[0].roomName, seat: times.times[0].roomSeat}];
					
					firsttheater = times.times[0].theaterName;
					var theaters = [firsttheater];
					for(var i=1; i<times.times.length; i++) {
						if(firsttheater != times.times[i].theaterName) {
							console.log("times[i].theaterName", times.times[i].theaterName);
							console.log("firsttheater", firsttheater);
							theaters.push(times.times[i].theaterName);
							firsttheater = times.times[i].theaterName;
						}
					}
					
					firsttheater = tar[0].theater;
					firstroom = tar[0].room;
					for(var i=1; i<times.times.length; i++) {
						if(firsttheater == times.times[i].theaterName && firstroom == times.times[i].roomName) {
							continue;
						} else {
							tar.push({
								theater: times.times[i].theaterName, 
								room: times.times[i].roomName, 
								seat: times.times[i].roomSeat
							});
							firsttheater = times.times[i].theaterName;
							firstroom = times.times[i].roomName;
						}
					}
					console.log("tar", tar);
					
					var htmlContents = "";
					
					console.log("theaters", theaters);
					
					var firstcity = times.times[0].theaterCity;
					var theaterArray = [];
					for(var j=0; j<times.times.length; j++) {
						console.log("cn aaaaa", cn);
						if (j < 1) {
							if(cn == times.times[j].theaterCity && theaterArray.length == 0) {
								theaterArray.push(times.times[j].theaterName);
							}
						} else {
							if(cn == times.times[j].theaterCity && times.times[j-1].theaterName != times.times[j].theaterName) {
								theaterArray.push(times.times[j].theaterName);
							}
						}
					}
					console.log("theaterArray", theaterArray);
					for(var i=0; i<theaterArray.length; i++) {
						htmlContents += "<div class=\"row\" style=\"border-bottom: 1px solid #aaa;\">";
						htmlContents += "<div class=\"col-sm-2\">";
						for(var j=0; j<times.theaterInfos.length; j++) {
							if(times.theaterInfos[j].name == theaterArray[i]) {
								htmlContents += "<a href=\"../cgv/cgvtheaters.jf?tno=" + times.theaterInfos[j].no + "\" class=\"cgv-title\">";
							}
						}
						htmlContents += "<span>" + theaterArray[i] + "</span></a></div>";
						htmlContents += "<div class=\"col-sm-10\">";
						for(var j=0; j<tar.length; j++) {
							if(theaterArray[i] == tar[j].theater) {
								htmlContents += "<div class=\"row gly\">";
								htmlContents += "<span class=\"glyphicon glyphicon-triangle-right\"></span>";
								htmlContents += tar[j].room + " | 총 " + tar[j].seat + "석</div>";
								htmlContents += "<div class=\"row\">";
								for(var k=0; k<times.times.length; k++) {
									var los = times.times[k].roomSeat;
									for(var x=0; x<times.resCount.length; x++) {
										if(times.times[k].screeningNo == times.resCount[x].SCREENINGNO) {
											los = times.times[k].roomSeat - times.resCount[x].COUNT;
											if(los == 0) {
												los = "매진";
											}
											break;
										}
									}
									if(tar[j].theater == times.times[k].theaterName && tar[j].room == times.times[k].roomName) {
										if(los == "매진") {
											htmlContents += "<a href=\"\" onclick=\"losIsZero(event)\"><div class=\"col-sm-1\" style=\"border: 1px solid #aaa;\">";
											htmlContents += "<div><p><strong style=\"color: #000;\">" + times.times[k].screeningTime + "</strong></p></div>";
											htmlContents += "<div><p style=\"font-size: 13px;\">" + los + "</p></div></div></a>";
										} else {
											htmlContents += "<a href=\"reservation.jf?sno=" + times.times[k].screeningNo + "\"><div class=\"col-sm-1\" style=\"border: 1px solid #aaa;\">";
											htmlContents += "<div><p><strong style=\"color: #000;\">" + times.times[k].screeningTime + "</strong></p></div>";
											htmlContents += "<div><p style=\"font-size: 13px;\">" + los + "석</p></div></div></a>";
										}
									}
								}
								htmlContents += "</div>";
							}
						}
						htmlContents += "</div></div>";
					}
					
					document.getElementById('timetable-theater-box').innerHTML = htmlContents;
				} else {
					var htmlContents = "";
					
					htmlContents += "<div class=\"row text-center\" style=\"border-bottom: 2px solid #000;\">";
					htmlContents += "<p style=\"margin-top: 30px; margin-bottom: 30px; font-weight: bold;\">현재 선택하신 날짜에 상영하는 영화가 없습니다.</p>";
					htmlContents += "</div>";
					
					document.getElementById('timetable-theater-box').innerHTML = htmlContents;
				}
			}
		}
		
		xhr.open("GET", "showttfordate.jf?mno=" + mno + "&sdate=" + screeningDate);
		xhr.send();
	}
	
	function losIsZero(e) {
		e.preventDefault();
		alert("해당 상영시간은 예매할 수 없습니다.");
	}

</script>
</body>
</html>