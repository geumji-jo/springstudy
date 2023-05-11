<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>${movie.korTitle }&lt; 영화상세</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Nunito"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/GPA.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/main.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Nunito"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="stylesheet" href="/jf/resources/bootstrap/css/header.css">
<link rel="stylesheet"
	href="/jf/resources/bootstrap/css/moviedetail.css">
<script type="text/javascript"
	src="/jf/resources/bootstrap/js/gpaHeader.js"></script>
<style>
.detail_4_likes_1 {
	position: relative;
	display: inline-block;
	bottom: 10px;
	color: red !important;
}
</style>
</head>

<body>
	<!-- header 시작-->
	<%@include file="../../common/navigation.jsp"%>
	<!-- header 끝-->
	<div class="container">
		<div class="row">
			<div class="col-sm-4">
				<h1 id="div4" class="detail_1_title">영화상세</h1>
			</div>
		</div>
		<hr class="detail_1_hr">
		<div class="row detail_main_row">
			<div class="col-sm-3">
				<a href=""><img class="detail_2_movieposter"
					src="/jf/photos/movieposters/${movie.poster }" alt=""></a>
			</div>
			<div class="col-sm-9">
				<div class="row">
					<div class="col-sm-12">
						<span class="detail_2_korTitle">${movie.korTitle }</span> <span
							class="detail_2_nowShowing"> <img src="/jf/photos/NowShowing.PNG" alt="" />
						</span>
					</div>
				</div>
				<div class="row detail_2_blank_1">
					<div class="col-sm-12 detail_2_engTitle">

						<p class="detail_2_engTitle_p">${movie.engTitle }</p>
					</div>
				</div>
				<div class="up">
					<div class="row">
						<div style="padding-right:0px;" class="col-sm-2 detail_3_reservationRatiodiv">
							<span class="detail_3_reservationRatio">예매율
								${movie.reservationRate }%</span>
							<div class="theater_border_right_hr"></div>
						</div>

						<div class="col-sm-4 detail_3_eggpercentdiv">
							<img class="detail_3_egg" src="/jf/photos/GREAT.PNG" alt="">
							<span class="detail_3_eggpercentandviewer">
								${movie.goldenEgg }% (실관람객 : ${movie.realMembers }명) </span>
						</div>
					</div>
					<hr class="detail_3_hr">
					<div class="row">
						<div class="col-sm-8 detail_4_info">
							<p>감독: ${movie.director }:${movie.genre }/ 기본:
								${movie.ageLimit }세 이상, ${movie.runningTime }분, ${movie.country }</p>
							<p>개봉: <fmt:formatDate value="${movie.releaseDate }"/></p>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4 ">
							<span class="glyphicon glyphicon-heart detail_4_likes_1"></span>
							<span class="detail_4_likes_2">: ${movie.wishList }</span> <span
								class="detail_4_likes_img"><a href="/jf/reservation/reservation.jf?mno=${movie.no}"><img
									src="/jf/photos/reservationImg.PNG" alt=""></a> </span>
						</div>
					</div>
				</div>
			</div>

		</div>
		<div class="row main_detail_row">
			<div class="col-sm-10">
				<div class="row">
					<div class="col-sm-12 text-center">
						<p class="">
							<span class="detail_5_info"> &lt; <a href="" onclick="fnMove(event,'4')">주요정보</a> | <a
								href="" onclick="fnMove(event,'1')">트레일러</a> | <a onclick="fnMove(event,'2')" href="">스틸컷</a> | <a onclick="fnMove(event,'3')" href="">평점/리뷰</a> &gt;
							</span>
						</p>
					</div>
				</div>
				<div class="row main_detail_row_2">
					<div class="col-sm-12 detail_5_movie_explain">
						<p>${movie.info }</p>
					</div>
				</div>
				<div class="row detail_5_row">
					<div class="col-sm-12">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th class="text-center">매력포인트</th>
									<th class="text-center">성별 예매 분포</th>
									<th class="text-center">연령별 예매 분포</th>
								</tr>
							</thead>
							<tbody>
								<tr class="text-center">
									<td><div id="chart_div2"></div></td>
									<td><img src="/jf/photos/genderRatio.png" alt=""></td>
									<td><img src="/jf/photos/ageRatio.PNG" alt=""></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12 detail_6_event_img">
						<img
							src="http://adimg.cgv.co.kr/images/201808/citi/0516_800x90.jpg"
							alt="">
					</div>
				</div>
				<div class="row">
					<div id="div1" class="col-sm-12 detail_6_trailer_info">
						<span class="detail_6_trailer_info_1"><strong>트레일러</strong></span><span
							class="detail_6_trailer_info_2">1건</span>
							<span class="glyphicon glyphicon glyphicon-facetime-video"></span>
					</div>
				</div>
				<div class="row youtube_videos">
					<div class="col-sm-12 youtube_video_div">
						<iframe width="100%" height="467.94px"
							src="${movie.trailer }" frameborder="0"
							allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen class="youtube_video"></iframe>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 text-center">
							<p>
								<img style="position: relative; top:4px;" src="/jf/photos/HD.PNG" alt=""> <strong>${movie.engTitle } Trailer</strong>
							</p>
							<p class="detail_7_date"><fmt:formatDate value="${movie.releaseDate }"/> 개봉</p>
					</div>
				
				</div>
				<div class="row">
					<div id="div2" class="col-sm-12 detail_6_trailer_info">
						<span class="detail_6_trailer_info_1"><strong>스틸컷</strong></span><span
							class="detail_6_trailer_info_2"><strong>3</strong>건</span>
							<span class="glyphicon glyphicon-picture"></span>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1 detail_6_steelcut_img">
						<!-- 캐러샐 시작 -->
						<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
						  <!-- Wrapper for slides -->
						  <div class="carousel-inner detail_carousel_inner" role="listbox">
						    <div class="item active">
						      <img style="width:840px; height:467.94px;" class="carouselImg" src="/jf/photos/steelcuts/${steelcuts[0] }" alt="">
						    </div>
						    <div class="item">
						      <img style="width:840px; height:467.94px;" class="carouselImg" src="/jf/photos/steelcuts/${steelcuts[1] }" alt="">
						    </div>
						    <div class="item">
						      <img style="width:840px; height:467.94px;" class="carouselImg" src="/jf/photos/steelcuts/${steelcuts[2] }" alt="">
						    </div>
						  </div>
						
						  <!-- Controls -->
						  <a class="left carousel-control detail_carousel_control" href="#carousel-example-generic" role="button" data-slide="prev">
						    <span style="width:40px; height:40px; font-size:40px;" class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						    <span class="sr-only">Previous</span>
						  </a>
						  <a class="right carousel-control detail_carousel_control" href="#carousel-example-generic" role="button" data-slide="next">
						    <span style="width:40px; height:40px; font-size:40px;" class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						    <span class="sr-only">Next</span>
						  </a>
						</div>
						<!-- 캐러샐 끝 -->
						
					</div>
				</div>
			</div>
			<div class="col-sm-2 detail_5_sideAD">
				<ul>
					<li><a href=""><img src="/jf/photos/detail_1.jpg" alt=""></a></li>
					<li><a href=""><img
							src="http://adimg.cgv.co.kr/images/201808/citi/0516_160x300.jpg"
							alt=""></a></li>
				</ul>
			</div>
		</div>
		<div class="row GPA_main_2">
			<input id="forlikes-from" type="hidden" name="from" value="detail" />
			<div id="div3"></div>
			<%@include file="../../common/GPAcommon.jsp"%>
		</div>
		<div class="row text-center">
			<div class="col-sm-10">
				<ul class="pagination">
					<li><a href="">&laquo</a></li>
					<c:forEach var="a" begin="1" end="${totalreviewsCount }">
						<li id="${a}" class="gpa_pagination_number"><a
							onclick="showReviews(event,0,${empty param.mno ? rank1movie : param.mno},${a})"
							href="#">${a}</a></li>
					</c:forEach>
					<li><a href="">&raquo</a></li>
				</ul>
			</div>
		</div>
	</div>
    	<a id="MOVE_TOP_BTN" href="#">TOP</a>
	<script>
	$('.carousel').carousel({
		  interval: false
	})
	function fnMove(event,seq){
		event.preventDefault();
		
		var offset = $("#div" + seq).offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
	}
	
    // Load the Visualization API and the corechart package.
    google.charts.load('current', {
        'packages': ['corechart']
    });

    // Set a callback to run when the Google Visualization API is loaded.
    google.charts.setOnLoadCallback(drawChart);

    // Callback that creates and populates a data table,
    // instantiates the pie chart, passes in the data and
    // draws it.
    function drawChart() {
		var production = ${fivePoint.production};
		var story = ${fivePoint.story};
		var ost = ${fivePoint.ost};
		var actor = ${fivePoint.actor};
		var beauty = ${fivePoint.beauty};
		
        // Create the data table.
        var data = google.visualization.arrayToDataTable([
            ['힝', '%', {
                role: 'style'
            }],
            ['감독연출', production, 'color: #A30096; opacity: 0.8'], // RGB value
            ['스토리', story, 'color: #00A626; opacity: 0.8'], // English color name
            ['OST', ost, 'color: #FF9E00; opacity: 0.8'],
            ['배우연기', actor, 'color: #E31F00; opacity: 0.8'], // CSS-style declaration
            ['영상미', beauty, 'color: #4539D0; opacity: 0.8'], // CSS-style declaration
        ]);

        // Set chart options
        var options = {
        	backgroundColor : '#FBFFEC',
            legend: {
                position: 'none'
            },
            width: 330,
            height: 200,
            
            chartArea: {
                width: '50%'
            },
            hAxis: {
                title: '영화평가지수(%)',
                minValue: 0,
                maxValue: 100,
            }
        };

        var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
        var chart2 = new google.visualization.BarChart(document.getElementById('chart_div2'));
        chart.draw(data, options);
        chart2.draw(data,options);
    }
    $(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 500) {
                $('#MOVE_TOP_BTN').fadeIn();
            } else {
                $('#MOVE_TOP_BTN').fadeOut();
            }
        });
        
        $("#MOVE_TOP_BTN").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
    });
    </script>
    
</body>
</html>