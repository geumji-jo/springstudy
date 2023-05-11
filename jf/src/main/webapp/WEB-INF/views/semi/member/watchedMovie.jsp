<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
<title>내가 본 영화 &lt; 리스트 | 영화 그 이상의 감동. CGV</title>
 <link rel="shortcut icon" href="/jf/photos/cj_logo.ico" />
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
<link rel="stylesheet" href="/jf/resources/bootstrap/css/header.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/footer.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/wishlist.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/moviediary.css">
<style>

</style>
</head>

<body>
	<!--  헤더 시작  -->
	<%@include file="../../common/navigation.jsp"%>
	<!--      헤더 끝  -->
	<div class="container">
		<div class="row wish_main_row">
			<div class="col-sm-3 text-center wish_mainleft_col">
				<div class="row ">
					<div class="col-sm-9 whole_profile_div">
						<img class="wish_profile" src="/jf/photos/bigProfile.PNG" alt="">
						<span class="wish_username">${LOGINMEMBER.name }님</span> <a
							href=""><span class="glyphicon glyphicon-tag"></span></a>
					</div>
					<div>
						<a href="/jf/member/wishlist.jf">
							<div class="col-sm-9 wish_1 wish_1">
								<div class="row">
									<div class="col-sm-2 wish_1_1">
										<span class="glyphicon glyphicon-hand-right wish_right"></span>
									</div>
									<div class="col-sm-8 wish_1_2">
										<div class="wish_1_2_number">
											<c:out value="${wishListsCount }" default="0" />
										</div>
										<span>위시리스트</span>
									</div>
								</div>
							</div>
						</a>
					</div>
					<a href="/jf/member/watchedMovie.jf">
						<div class="col-sm-9 wish_1 red">
							<div class="row">
								<div class="col-sm-2 wish_1_1 ">
									<span class="glyphicon glyphicon-hand-right wish_right"></span>
								</div>
								<div class="col-sm-8 wish_1_2">
									<div class="wish_1_2_number">
										<c:out value="${watchedCount }" default="0"/>
									</div>
									<span>내가 본 영화</span>
								</div>
							</div>
						</div>
					</a>
					<div>
						<a href="/jf/member/moviediary.jf">
							<div class="col-sm-9 wish_1">
								<div class="row">
									<div class="col-sm-2 wish_1_1 ">
										<span class="glyphicon glyphicon-hand-right wish_right"></span>
									</div>
									<div class="col-sm-8 wish_1_2">
										<div class="wish_1_2_number">
											<c:out value="${diaryCount }" default="0" />
										</div>
										<span>무비 다이어리</span>
									</div>
								</div>
							</div>
						</a>
					</div>

				</div>
			</div>
			<div class="col-sm-9 wish_main_rightcol">
				<div class="row">
					<div class="col-sm-6">
						<div class="row">
							<div class="col-sm-10 col-sm-offset-1">
								<span class="wish_2_1_1">내가 본 영화</span> <span class="wish_2_1_2">CGV와
									함께한 추억들<c:out value="${watchedCount }" default="0" />건
								</span>
							</div>
						</div>

					</div>

				</div>
			</div>
			<div class="col-sm-9 " style="margin-top:20px;">
		<div class="row">
			<div class="col-sm-10">
				<!-- 반복 시작  -->
				<c:forEach var="watched" items="${AllWatched }">
					<div class="row">
						<div class="col-sm-3 mygpa_img_col">
							<a href="/jf/movie/moviedetail.jf?mno=${watched.movieNo }"><img
								style="max-width: 80%;"
								src="/jf/photos/movieposters/${watched.moviePoster }" alt="" /></a>
						</div>
						<div class="col-sm-9">
							<div class="row mygpa_movieName_div">
								<div class="col-sm-12">
									<a href="/jf/movie/moviedetail.jf?mno=${watched.movieNo }" class="mygpa_movieName"
									style="font-size:20px; font-weight:600;">${watched.movieKorTitle }</a>
								</div>
								<div class="col-sm-12">
									<p class="mygpa_movieName" style="font-size:11px;">${watched.movieEngTitle }</p>
								</div>
								
								<!-- 제거 버튼
								<div class="col-sm-1">
									<a href=""><span class="glyphicon glyphicon-remove"></span></a>
								</div>
								-->
							</div>
							<div class="row" style="color: #222;
												    font-weight: 1000;
												    font-size: 13px;
												    line-height: 14px;
												    margin-bottom: 6px;">
								<div class="col-sm-12">
									<div class="theater_border_right_hr"></div>
									<span class="mygpa_idAndDate"><fmt:formatDate value="${watched.reservationDate }"/> </span>
								</div>
							</div>
							<div class="row mygpa_contents">
								<div class="col-sm-12" style="color: #222;
												    font-weight: 1000;
												    font-size: 13px;
												    line-height: 14px;
												    margin-bottom: 6px;">
									<span class="mygpa_contents">${watched.theaterName } ${watched.roomName }</span>
								</div>
								<div class="col-sm-12" style="color: #222;
												    font-weight: 1000;
												    font-size: 13px;
												    line-height: 14px;
												    margin-bottom: 6px;">
									<span class="mygpa_contents">상영일 : <fmt:formatDate value="${watched.screeningDate }"/></span>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-4">
									<ul class="mygpa_ul">
										<li class="mygpa_likes"></li>
									</ul>
									<span class="mygpa_likes_right"><span
										class="glyphicon glyphicon-thumbs-up"></span> <span
										class="mygpa_likes_number">0</span></span>
								</div>
								<div class="col-sm-4 col-sm-offset-3">
									<a href="/jf/member/moviediary.jf" class="btn-diary">
									<span>무비다이어리 쓰기</span></a>
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
			</div>

			<div class="sponser" style="position:fixed; margin-left:700px;">
				<img
					src="http://adimg.cgv.co.kr/images/201905/MeninBlack/0529_160x300.jpg"
					alt="" /> 
				</div>
				<div class="sponser" style="position:fixed; margin-left:700px; margin-top: 306px;">	
				<img
					src="http://adimg.cgv.co.kr/images/201903/childfund/0524_160x300.jpg"
					alt="" />
				</div>
		</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<%@include file="../../common/footer.jsp"%>
	<!-- footer -->

</body>
</html>