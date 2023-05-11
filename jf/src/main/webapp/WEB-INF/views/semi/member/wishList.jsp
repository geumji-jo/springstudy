<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
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
<link rel="stylesheet" href="/jf/resources/bootstrap/css/header.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/footer.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/wishlist.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/GPA.css">
<style>
	.gpa_reservationImg{
		position: relative;
		top:5px;
	}
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
							<div class="col-sm-9 wish_1 wish_1_active">
								<div class="row">
									<div class="col-sm-2 wish_1_1">
										<span class="glyphicon glyphicon-hand-right wish_right"></span>
									</div>
									<div class="col-sm-8 wish_1_2">
										<div class="wish_1_2_number"><c:out value="${wishListsCount }" default="0"/> </div>
										<span>위시리스트</span>
									</div>
								</div>
							</div>
						</a>
					</div>
					<div>
						<a href="/jf/member/watchedMovie.jf">
							<div class="col-sm-9 wish_1 ">
								<div class="row">
									<div class="col-sm-2 wish_1_1 ">
										<span class="glyphicon glyphicon-hand-right wish_right"></span>
									</div>
									<div class="col-sm-8 wish_1_2">
										<div class="wish_1_2_number"><c:out value="${watchedCount }" default="0"/></div>
										<span>내가 본 영화</span>
									</div>
								</div>
							</div>
						</a>
					</div>
					<div>
						<a href="/jf/member/moviediary.jf">
							<div class="col-sm-9 wish_1 ">
								<div class="row">
									<div class="col-sm-2 wish_1_1 ">
										<span class="glyphicon glyphicon-hand-right wish_right"></span>
									</div>
									<div class="col-sm-8 wish_1_2">
										<div class="wish_1_2_number"><c:out value="${diaryCount }" default="0" /></div>
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
					<div class="col-sm-4">
						<div class="row">
							<div class="col-sm-10 col-sm-offset-1">
								<span class="wish_2_1_1">위시리스트</span> <span class="wish_2_1_2"><c:out value="${wishListsCount }" default="0"/>건</span>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<c:if test="${not empty movies }">
						<c:forEach var="movie" items="${movies }">
							<!--                   위시리스트 영화 반복시작-->
							<div class="col-sm-4 wish_2_2_imgdiv">
								<div class="row">
									<div class="col-sm-10 col-sm-offset-1 wish_img_div">
										<a href="#" onclick="removeWishList(event,'${movie.no}')"> <span
											class="glyphicon glyphicon-remove wish_2_2_remove"> </span>
										</a> <a href="/jf/movie/moviedetail.jf?mno=${movie.no }"> <img src="/jf/photos/movieposters/${movie.poster }">
										</a>
									</div>
									<div class="col-sm-10 col-sm-offset-1">
										<div class="row">
											<div class="col-sm-12 wish_2_2_moviename_div">
												<span class="wish_2_2_moviename">${movie.korTitle }</span>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12 wish_2_2_release_div">
												<span class="wish_2_2_releaseDate"><fmt:formatDate value="${movie.releaseDate }"/> 개봉</span>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12 text-center wish_2_2_div">
												<span class="glyphicon glyphicon-heart wish_heart"> </span>
												<span class="wish_likes">${movie.wishList }</span>
												<c:choose>
													<c:when test="${movie.screenYn eq 'Y'}">
														<a href="/jf/reservation/reservation.jf?mno=${movie.no}"><img	class="gpa_reservationImg" src="/jf/photos/reservationImg2.PNG" alt="" /></a>
													</c:when>
													<c:otherwise>
														<span class="wish_usedYn">상영종료</span>
													</c:otherwise>
												</c:choose>
												 
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
					<!-- 위시리스트 영화 반복끝  -->
				<div class="sponser" style="position:fixed; margin-left:800px;">
				<img
					src="http://adimg.cgv.co.kr/images/201905/MeninBlack/0529_160x300.jpg"
					alt="" />
				</div>
				<div class="sponser" style="position:fixed; margin-left:800px; margin-top: 306px;">
				<img
					src="http://adimg.cgv.co.kr/images/201903/childfund/0524_160x300.jpg"
					alt="" />
				</div>
				
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@include file="../../common/footer.jsp"%>
	<!-- footer -->
	<script>
		function removeWishList(event,mno){
			event.preventDefault();
			
			var result = confirm("위시리스트에서 삭제하시겠습니까?");
			if(result){
				location.href="/jf/member/process_removeWishList.jf?mno="+mno;
			}
		}
	</script>
</body>
</html>