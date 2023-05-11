<%@page import="kr.co.hta.util.DateUtils"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.hta.movies.dao.MovieDao"%>
<%@page import="kr.co.hta.vo.Movie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>일반 평점 > 평점 > ${movie.korTitle }</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/main.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/header.css" />
<link rel="stylesheet" href="/jf/resources/bootstrap/css/event.css" />
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Nunito"
	rel="stylesheet">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/GPA.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/CGVtheater.css" />
<link rel="stylesheet" href="/jf/resources/bootstrap/css/mymoviegpa.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="/jf/resources/bootstrap/js/gpaHeader.js"></script>
<style>
@media ( min-width : 768px) {
	.container {
		width: 750px;
	}
}

@media ( min-width : 1022px) {
	.container {
		width: 1080px;
	}
}
</style>
</head>

<body>
	<%@include file="../../common/navigation.jsp"%>
	<div class="container">
	<%@include file="../../common/gpa_main_CommonHeader.jsp"%>
		<div class="row">
			<hr class="event_hr_1" />
		</div>

		<div class="row">
			<div class="col-sm-10">
				<!-- 반복 시작  -->
				<c:choose>
					<c:when test="${ not empty myWishLists}">
				<c:forEach var="myReview" items="${myWishLists }">
					<div class="row">
						<div class="col-sm-3 mygpa_img_col">
							<a href="/jf/movie/moviedetail.jf?mno=${myReview.movieNo }"><img
								style="max-width: 90%;"
								src="/jf/photos/movieposters/${myReview.poster }" alt="" /></a>
						</div>
						<div class="col-sm-9">
							<div class="row mygpa_movieName_div">
								<div class="col-sm-11">
									<span class="mygpa_movieName">${myReview.name }</span>
								</div>
								<div class="col-sm-1">
									<a href="/jf/member/process_removeReview.jf?rno=${myReview.reviewNo }"><span class="glyphicon glyphicon-remove"></span></a>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<span class="mygpa_idAndDate">${LOGINMEMBER.id }</span>
									<div class="theater_border_right_hr"></div>
									<span class="mygpa_idAndDate"><fmt:formatDate value="${myReview.reviewCreateDate }"/> </span>
								</div>
							</div>
							<div class="row mygpa_contents">
								<div class="col-sm-11">
									<span class="mygpa_contents">${myReview.reviewContents }</span>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<a href=""><span class="mygpa_modify">수정하기</span></a>
									<ul class="mygpa_ul">
										<li class="mygpa_likes"></li>
									</ul>
									<span class="mygpa_likes_right"><span
										class="glyphicon glyphicon-thumbs-up"></span> <span
										class="mygpa_likes_number">${myReview.reviewLikes }</span></span>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div
							class="col-sm-12 mygpa_bottom_hr theater_bottom_timetable_hr_3_div">
							<hr class="theater_bottom_timetable_hr_3">
						</div>
					</div>
					<!-- 반복 끝  -->
				</c:forEach>
				</c:when>
					<c:otherwise>
						<div class="row" style="margin-top : 150px;">
							<div class="col-sm-12 text-center">
								<p style="font-size:20px;">아직 평점을 작성하지 않았습니다!! 평점을 작성해 보세요~</p>
								<p style="font-weight: bold; padding : 10px; display:inline-block; background-color : #2F2F2F; "><a style="color:white; text-decoration: none;" href="/jf/movie/gpa.jf">평점 작성하러 가기 <span class="glyphicon glyphicon-chevron-right"></span></a></p>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>

			<div class="col-sm-2">
				<img
					src="http://adimg.cgv.co.kr/images/201905/MeninBlack/0529_160x300.jpg"
					alt="" /> <img
					src="http://adimg.cgv.co.kr/images/201903/childfund/0524_160x300.jpg"
					alt="" />

			</div>
		</div>
	</div>

	</div>
	<%@ include file="../../common/footer.jsp"%>

</body>
</html>
