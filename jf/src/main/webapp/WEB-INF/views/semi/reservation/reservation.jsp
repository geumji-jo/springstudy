<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>영화 그 이상의 감동. CGV</title>
  <link rel="shortcut icon" href="/jf/photos/cj_logo.ico" />
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/jf/resources/bootstrap/css/bootstrap.min.css">
  <script src="/jf/resources/bootstrap/js/jquery.min.js"></script>
  <script src="/jf/resources/bootstrap/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="/jf/resources/bootstrap/css/reservation.css">
</head>
<c:choose>
	<c:when test="${not empty param.sno }">
		<body onload="initTicketing(${param.sno })">
	</c:when>
	<c:when test="${not empty param.mno }">
		<body onload="initMovie(${param.mno })">
	</c:when>
	<c:otherwise>
		<body>
	</c:otherwise>
</c:choose>
<%@ include file="../../common/navigation.jsp" %>
<div class="container">
<input id="forlikes-from" type="hidden" name="from" value="/jf/reservation/reservation.jf" /> <!-- 로그인시 화면 바로 뜨게 하기  -->
    <div class="row">
        <div class="col-sm-12 text-right return-res">
        	<input id="from-res" type="hidden" name="from" value="res"/>
            <button onclick="window.location.reload()" class="btn btn-default" style="background-color: #f2f0e4;">
                <span class="glyphicon glyphicon-repeat"></span>예매 다시하기
            </button>
        </div>
    </div>
    <div class="row step">
        <div class="col-sm-3 col-section">
            <div class="row">
                <div class="col-sm-12 text-center col-head">
                    <h4>영화</h4>
                </div>
            </div>
            <div class="row col-body">
                <div class="col-sm-12">
                	<div class="row">
	                    <div class="col-sm-12 movie-select">
	                    <c:choose>
	                    	<c:when test="${empty param.sort }">
	                    		<a href="reservation.jf?sort=1" class="on">예매율순</a>
	                    	</c:when>
	                    	<c:otherwise>
		                        <a href="reservation.jf?sort=1" class="${param.sort eq 1 ? 'on' : '' }">예매율순</a>
	                    	</c:otherwise>
	                    </c:choose>
		                        <a href="reservation.jf?sort=2" class="${param.sort eq 2 ? 'on' : '' }">가나다순</a>
	                    </div>	
                	</div>
                	<div class="row">
	                    <div class="col-sm-12" style="height: 500px; overflow: auto;">
	                        <ul id="movie-menu" class="ul-deco">
	                        <c:forEach var="movie" items="${movies }">
	                            <li id="movie-list-${movie.no }" onclick="showCities(this, ${movie.no })">
	                                <span class="ico-grade grade-${movie.ageLimit }"></span><a>${movie.korTitle }</a>
	                            </li>                        
	                        </c:forEach>
	                        </ul>
	                    </div>
                	</div>
                </div>
            </div>
        </div>
        <div class="col-sm-3 col-section">
            <div class="row">
                <div class="col-sm-12 text-center col-head">
                    <h4>극장</h4>
                </div>
            </div>
            <div class="row col-body">
                <div class="col-sm-12">
            <c:if test="${not empty LOGINMEMBER }">
                    <div class="favorite-cgv-title">
                        <p>자주가는 CGV</p>
                    </div>
                    <div class="favorite-cgv">
                        <ul class="theaters ul-deco">
                        <c:forEach var="myTheater" items="${Mytheaters }">
                        	<li><a href="../cgv/cgvtheaters.jf?tno=${myTheater.theaterNo }">${myTheater.theaterName }</a></li>
                        </c:forEach>
                        </ul>
                    </div>
			</c:if>
                    <div class="row theater-list">
                        <div class="col-sm-6 theater-area-list">
                            <ul id="city-box" class="ul-deco">
                            <c:forEach var="city" items="${cities }">
                            	<li><a>
                            		<span>${city }</span>
                            		<span> (0)</span>
                            	</a></li>
                            </c:forEach>
                            </ul>
                        </div>
                        <div class="col-sm-6 theater-cgv-list">
                            <ul id="theater-box" class="ul-deco"></ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-1 col-section">
            <div class="row">
                <div class="col-sm-12 text-center col-head">
                    <h4>날짜</h4>
                </div>
            </div>
            <div class="row col-body" id="month-day-box"></div>
        </div>
        <div class="col-sm-5 col-section">
            <div class="row">
                <div class="col-sm-12 text-center col-head">
                    <h4>시간</h4>
                </div>
            </div>
            <div class="row col-body">
                <div class="col-sm-12">
                    <div class="time-option">
                        <span class="ico-sun"></span>조조
                        <span class="ico-moon"></span> 심야
                    </div>
                    <div class="placeholder" id="time-box" style="overflow: auto;">
        	            <p style="text-align: center;">영화, 극장, 날짜를 선택해주세요.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
    	<div class="col-sm-12">
    		<div class="row" style="height: 100px;">
    			<div class="col-sm-4 col-sm-offset-8 tnb">
    				<input type="hidden" id="screening-no"/>
    				<input type="hidden" id="left-over-seat"/>
	    			<c:choose>
						<c:when test="${not empty LOGINMEMBER }">
		    				<button class="btn-right on" onclick="goReservation(event, '${LOGINMEMBER.id }')" disabled="disabled"></button>
						</c:when>
						<c:otherwise>
		    				<button class="btn-right on" onclick="goReservation(event, '')" disabled="disabled"></button>
						</c:otherwise>
					</c:choose>
    			</div>
    		</div>
    	</div>
    </div>
</div>
<%@ include file="../../common/footer.jsp" %>

<script>
function initMovie(mno) {
	var xhr = new XMLHttpRequest();
	console.log("mno", mno);
	
	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200) {
			var movie = JSON.parse(xhr.responseText);
			console.log("movie", movie);
			
			showCities('#movie-list-' + movie.no, movie.no);
		}
	}
	
	xhr.open("GET", "selectedres.jf?mno=" + mno, false);
	xhr.send();
}

	function initTicketing(sno) {
		var xhr = new XMLHttpRequest();
		console.log("sno", sno);
		
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var tickets = JSON.parse(xhr.responseText);
				console.log("tickets", tickets);
				
				var cityforEng = '';
				if(tickets.ticket.theaterCity == '서울') {
					cityforEng = 'seoul';
				} else if(tickets.ticket.theaterCity == '부산/울산') {
					cityforEng = 'bsus';
				} else if(tickets.ticket.theaterCity == '인천') {
					cityforEng = 'incheon';
				} else if(tickets.ticket.theaterCity == '광주/전라/제주') {
					cityforEng = 'gjj';
				} else if(tickets.ticket.theaterCity == '강원') {
					cityforEng = 'kangwon';
				} else if(tickets.ticket.theaterCity == '대전/충청') {
					cityforEng = 'djcc';
				} else if(tickets.ticket.theaterCity == '대구') {
					cityforEng = 'daegu';
				} else if(tickets.ticket.theaterCity == '경상') {
					cityforEng = 'kyeongsang';
				} else if(tickets.ticket.theaterCity == '경기') {
					cityforEng = 'kyeongi';
				}
				console.log('cityforEng', cityforEng);
				
				showCities('#movie-list-' + tickets.ticket.movieNo, tickets.ticket.movieNo);
				showTheaters('#cities-' + cityforEng, tickets.ticket.movieNo, tickets.ticket.theaterCity);
				showDates('#theater-' + tickets.ticket.theaterName, tickets.ticket.movieNo, tickets.ticket.theaterName);
				showTimes('#' + tickets.ticket.movieNo + tickets.ticket.screeningDate + tickets.ticket.theaterName, tickets.ticket.movieNo, tickets.ticket.screeningDate, tickets.ticket.theaterName);
				
				var leftOverSeat = tickets.ticket.roomSeat;
				for(var j=0; j<tickets.counts.length; j++) {
					if(tickets.ticket.screeningNo == tickets.counts[j].SCREENINGNO) {
						leftOverSeat = tickets.ticket.roomSeat - tickets.counts[j].COUNT;
						break;
					}
				}
				addCount('#screening-no-' + tickets.ticket.screeningNo, tickets.ticket.screeningNo, leftOverSeat);
			}
		}
		
		xhr.open("GET", "alreadyres.jf?sno=" + sno, false);
		xhr.send();
	}

	function showCities(el, movieNo) {
		var xhr = new XMLHttpRequest();
		
		$('#theater-box').empty();
		$('#month-day-box').empty();
		$('#time-box').empty();
		
		var movies = document.querySelectorAll("#movie-menu li");
		for(var i=0; i<movies.length; i++) {
			movies[i].classList.remove("selected-movie");
		}
		//el.classList.add('selected-movie');
		
		$(".tnb button").prop("disabled", true);

		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var infos = JSON.parse(xhr.responseText);
				
				console.log(infos);
				
				var htmlContents = "";
				
				
				htmlContents += "<li id=\"cities-seoul\" onclick=\"showTheaters(this, " + movieNo + ", '서울')\"><a><span>";
				htmlContents += infos.cities[0];
				if(infos.counts.length == 0) {
					htmlContents += " (0)";
				} else {
					htmlContents += " (" + infos.counts[0].seoul + ")";
				}
				htmlContents += "</span></a></li>";
				htmlContents += "<li id=\"cities-bsus\" onclick=\"showTheaters(this, " + movieNo + ", '부산/울산')\"><a><span>";
				htmlContents += infos.cities[1];
				if(infos.counts.length == 0) {
					htmlContents += " (0)";
				} else {
					htmlContents += " (" + infos.counts[0].bsus + ")";
				}
				htmlContents += "</span></a></li>";
				htmlContents += "<li id=\"cities-incheon\" onclick=\"showTheaters(this, " + movieNo + ", '인천')\"><a><span>";
				htmlContents += infos.cities[2];
				if(infos.counts.length == 0) {
					htmlContents += " (0)";
				} else {
					htmlContents += " (" + infos.counts[0].incheon + ")";
				}
				htmlContents += "</span></a></li>";
				htmlContents += "<li id=\"cities-gjj\" onclick=\"showTheaters(this, " + movieNo + ", '광주/전라/제주')\"><a><span>";
				htmlContents += infos.cities[3];
				if(infos.counts.length == 0) {
					htmlContents += " (0)";
				} else {
					htmlContents += " (" + infos.counts[0].gjj + ")";
				}
				htmlContents += "</span></a></li>";
				htmlContents += "<li id=\"cities-kangwon\" onclick=\"showTheaters(this," + movieNo + ", '강원')\"><a><span>";
				htmlContents += infos.cities[4];
				if(infos.counts.length == 0) {
					htmlContents += " (0)";
				} else {
					htmlContents += " (" + infos.counts[0].kangwon + ")";
				}
				htmlContents += "</span></a></li>";
				htmlContents += "<li id=\"cities-djcc\" onclick=\"showTheaters(this, " + movieNo + ", '대전/충청')\"><a><span>";
				htmlContents += infos.cities[5];
				if(infos.counts.length == 0) {
					htmlContents += " (0)";
				} else {
					htmlContents += " (" + infos.counts[0].djcc + ")";
				}
				htmlContents += "</span></a></li>";
				htmlContents += "<li id=\"cities-daegu\" onclick=\"showTheaters(this, " + movieNo + ", '대구')\"><a><span>";
				htmlContents += infos.cities[6];
				if(infos.counts.length == 0) {
					htmlContents += " (0)";
				} else {
					htmlContents += " (" + infos.counts[0].daegu + ")";
				}
				htmlContents += "</span></a></li>";
				htmlContents += "<li id=\"cities-kyeongsang\" onclick=\"showTheaters(this, " + movieNo + ", '경상')\"><a><span>";
				htmlContents += infos.cities[7];
				if(infos.counts.length == 0) {
					htmlContents += " (0)";
				} else {
					htmlContents += " (" + infos.counts[0].kyeongsang + ")";
				}
				htmlContents += "</span></a></li>";
				htmlContents += "<li id=\"cities-kyeongi\" onclick=\"showTheaters(this, " + movieNo + ", '경기')\"><a><span>";
				htmlContents += infos.cities[8];
				if(infos.counts.length == 0) {
					htmlContents += " (0)";
				} else {
					htmlContents += " (" + infos.counts[0].kyeongi + ")";
				}
				htmlContents += "</span></a></li>";
				
				document.getElementById('city-box').innerHTML = htmlContents;

				$(el).addClass('selected-movie');
			}
		}
		xhr.open("GET", "selectmovie.jf?mno=" + movieNo, false);
		xhr.send();
	}
	
	function showTheaters(el, movieNo, city) {
		var xhr = new XMLHttpRequest();
		
		$('#month-day-box').empty();
		$('#time-box').empty();
		
		$(".tnb button").prop("disabled", true);
		
		var cities = document.querySelectorAll("#city-box li");
		for (var i=0; i<cities.length; i++) {
			cities[i].classList.remove("selected");
		}
		//el.classList.add("selected");
		console.log("showtheaters el", el);
		
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var theaters = JSON.parse(xhr.responseText);
				theaters.reverse();
				console.log(theaters);
				
				var htmlContents = "";
				
				for(var i=0; i<theaters.length; i++) {
					htmlContents += "<li id=\"theater-" + theaters[i] + "\" onclick=\"showDates(this, " + movieNo + ", '" + theaters[i] + "')\"><a>";
					htmlContents += theaters[i]; 
					htmlContents += "</a></li>";
				}
				
				document.getElementById('theater-box').innerHTML = htmlContents;
				$(el).addClass('selected');
			}
		}
		xhr.open("GET", "selectcity.jf?mno=" + movieNo + "&city=" + city, false);
		xhr.send();
	}

	function showDates(el, movieNo, theaterName) {
		var xhr = new XMLHttpRequest();
		
		var theaters = document.querySelectorAll('#theater-box li');
		for(var i=0; i<theaters.length; i++) {
			theaters[i].classList.remove('selected-city');
		}
		//el.classList.add('selected-city');
		$(el).addClass('selected-city');
		
		$('#time-box').empty();
		
		$(".tnb button").prop("disabled", true);
		
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var dates = JSON.parse(xhr.responseText);
				
				// console.log(dates);
				
				var dateArray = [];
				
				for(var i=0; i<dates.length; i++) {
					var date = dates[i].split('-');
					dateArray.push(date);
				}
				
				console.log("dateArray배열", dateArray);
				
				var firstmonth = dateArray[0][0];
				var months = [firstmonth];
				for(var i=1; i<dateArray.length; i++) {
					if(firstmonth == dateArray[i][0]) {
						continue;
					} else {
						months.push(dateArray[i][0]);
						firstmonth == dateArray[i][0];
					}
				}
				
				var days = [];
				for(var i=0; i<dateArray.length; i++) {
					days.push({month: dateArray[i][0], day: dateArray[i][1], week: dateArray[i][2]});
				}
				
				
				console.log("dates", dates);
				
				// console.log("months배열", months);
				console.log("days배열", days);
				
				var htmlContents = "";
				
				for(var i=0; i<months.length; i++) {
					htmlContents += "<div class=\"date-list\"><div>";
					htmlContents += "<div class=\"year-month\">";
					htmlContents += "<div class=\"year\">2019</div>";
					htmlContents += "<div class=\"month\"><span>";
					htmlContents += months[i];
					htmlContents += "</span></div></div></div>";
					htmlContents += "<ul class=\"dayweek-day ul-deco\" id=\"day-box\">";
					for(var j=0; j<days.length; j++) {
						if(days[j].month == months[i]) {
							htmlContents += "<li id=\"" + movieNo + "2019-" + days[j].month + "-" + days[j].day + theaterName +"\" onclick=\"showTimes(this, " + movieNo + ", '" + dates[j] + "', '" + theaterName + "')\">"
							if(days[j].week == '토') {
								htmlContents += "<a class=\"saturday\"><span class=\"dayweek\">";
							} else if(days[j].week == '일') {
								htmlContents += "<a class=\"sunday\"><span class=\"dayweek\">";
							} else {
								htmlContents += "<a><span class=\"dayweek\">";
							}
							htmlContents += days[j].week;
							htmlContents += "</span>";
							htmlContents += "<span class=\"day\">";
							htmlContents += days[j].day;
							htmlContents += "</span></a>";
							htmlContents += "</li>";
						}
					}
					htmlContents += "</ul></div>";
				}
				
				document.getElementById('month-day-box').innerHTML = htmlContents;
			}
		}
		
		xhr.open("GET", "selecttheater.jf?mno=" + movieNo + "&tname=" + theaterName, false);
		xhr.send();
	}
	
	function showTimes(el, movieNo, screeningDate, theaterName) {
		var xhr = new XMLHttpRequest();
		
		var dates = document.querySelectorAll('#day-box li');
		for(var i=0; i<dates.length; i++) {
			dates[i].classList.remove('selected-city');
		}
		//el.classList.add('selected-city');
		$(el).addClass('selected-city');
		
		$(".tnb button").prop("disabled", true);
		
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var times = JSON.parse(xhr.responseText);
				
				console.log("times", times);
				
				var firstroom = times.screenings[0].roomName;
				var rooms = [{room: times.screenings[0].roomName, seat: times.screenings[0].roomSeat}];
				for(var i=1; i<times.screenings.length; i++) {
					if(firstroom == times.screenings[i].roomName) {
						continue;
					} else {
						rooms.push({room: times.screenings[i].roomName, seat: times.screenings[i].roomSeat});
						firstroom = times.screenings[i].roomName;
					}
				}
				// console.log("rooms", rooms);
				
				var htmlContents = "";
				for(var i=0; i<rooms.length; i++) {
					htmlContents += "<div class=\"row\">";
					htmlContents += "<div class=\"col-sm-12\">";
					htmlContents += "<div class=\"col-sm-12 theater\">";
					htmlContents += "<strong>" + rooms[i].room + "</strong> (총 " + rooms[i].seat + "석)";
					htmlContents += "<ul class=\"res-ul ul-deco\" id=\"time-ul\">";
					for(var j=0; j<times.screenings.length; j++) {
						if(rooms[i].room == times.screenings[j].roomName) {
							var leftOverSeat = times.screenings[j].roomSeat;
							if(times.counts.length == 0) {
								leftOverSeat = times.screenings[j].roomSeat;
							} else {
								for(var k=0; k<times.counts.length; k++) {
									if(times.counts[k].SCREENINGNO == times.screenings[j].screeningNo) {
										leftOverSeat = times.screenings[j].roomSeat - times.counts[k].COUNT;
										break;
									} else {
										leftOverSeat = times.screenings[j].roomSeat;
									}
								}
							}
							htmlContents += "<li id=\"screening-no-" + times.screenings[j].screeningNo + "\" onclick=\"addCount(this, " + times.screenings[j].screeningNo + ", " + leftOverSeat + ")\" style=\"width: 33%; float: left;\">";
							htmlContents += "<a><span id=\"time-span-" + times.screenings[j].screeningNo + "\" class=\"res-time\">" + times.screenings[j].screeningTime + "</span>";
							htmlContents += "<span class=\"res-seat\">" + leftOverSeat + "석</span>";							
							htmlContents += "</a></li>";
							
						}
					}
					htmlContents += "</ul></div></div></div>";
				}
				document.getElementById('time-box').innerHTML = htmlContents;
			}
		}
		
		xhr.open("GET", "selectdate.jf?mno=" + movieNo + "&sdate=" + screeningDate + "&tname=" + theaterName, false);
		xhr.send();
	}
	
	function addCount(el, screeningNo, leftOverSeat) {
		if(leftOverSeat == 0) {
			alert("해당 상영시간에는 잔여석이 없습니다.");
			return;
		}
		
		$(".tnb button").prop("disabled", false);
		
		var time = document.querySelector('#time-ul li a #time-span-' + screeningNo);
		var times = document.querySelectorAll('#time-ul li a .res-time');
		console.log("time", time, "times", times);
		for(var i=0; i<times.length; i++) {
			times[i].classList.remove('select-time');
		}
		//time.classList.add('res-time', 'select-time');
		$(time).addClass('res-time select-time');
		
		document.getElementById('screening-no').value = screeningNo;
		document.getElementById('left-over-seat').value = leftOverSeat;
	}
	
	function goReservation(e, memberId) {
		e.preventDefault();
		var from = document.getElementById('forlikes-from').value;
		var screeningNo = document.getElementById('screening-no').value;
		var leftOverSeat = document.getElementById('left-over-seat').value;
		var from = document.getElementById('from-res').value;
		
		if(memberId == ''){
    		var result = confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?");
    		if(result){
    			location.href = '/jf/member/login.jf?from=' + from + '&sno=' + screeningNo;
    			return;
    		}
		} else{
			var count = prompt("구매 수량을 입력해주세용", 1);
			if(count) {
				console.log("count", count);
				var ticket = parseInt(count);
				
				if(ticket < 1) {
					alert("구매 수량은 1장 이상부터 가능합니다.");
					return;
				}
				
				if(leftOverSeat < ticket) {
					alert("잔여석보다 더 많은 구매 수량을 입력할 수 없습니다.");
					return;
				}
				
				location.href = 'goreservation.jf?count=' + count + '&sno=' + screeningNo;
			} else {
				if(count == "") {
					alert("구매 수량을 1장 이상 입력해 주세요.");
				} else{
					alert("예매가 취소되었습니다.");
				}
			}
		}
	}
</script>
</body>
</html>