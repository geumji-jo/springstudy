<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>영화 &lt; 무비차트 | 영화 그 이상의 감동. CGV</title>
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
<link rel="stylesheet" href="/jf/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/GPA.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/main.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/chart.css">
<script type="text/javascript"
	src="/jf/resources/bootstrap/js/gpaHeader.js"></script>
</head>
<body>
	<%@include file="../../common/navigation.jsp"%>
	<input id="forlikes-from" type="hidden" name="from" value="chart" />
	<div class="container">
		<div class="row chart_title_row">
			<div class="col-sm-3">
				<h1 class="h1-title">무비차트</h1>
			</div>
		</div>
		<input type="hidden" id="hiddenvalue" value="">
		<div class="row movie-chart">
			<div class="col-sm-12 chart_main_top_row" style="text-align: right">
				<select name="sort" id="familysite"
					onchange="document.getElementById('hiddenvalue').value = this.options[this.selectedIndex].value">
					<!-- hidden 만들어서 값 -->
					<option value="1" ${param.sort eq '1' ? 'selected' : '' }>예매율순</option>
					<option value="2" ${param.sort eq '2' ? 'selected' : '' }>평점순</option>
					<option value="3" ${param.sort eq '3' ? 'selected' : '' }>관객순</option>
				</select>
				<button class="chart_main_top_row_button" type="button" title="새창"
					onclick="search()">GO</button>
			</div>
			<!-- sort 정렬 스크립트 -->
			<script>
                	function search() {
                		var sort = document.getElementById('hiddenvalue').value;
                		console.log("sort", sort);
                		location.href="chart.jf?sort=" + sort;
                	}
                </script>
			<!-- -------------- -->
			<div class="row chart-list">
				<div class="col-sm-3 list-content">
					<strong class="rank rank-first">NO.1</strong> <a
						href="/movies/detail-view/?midx=81749"> <span
						class="thumb-image"> <a
							href="/jf/movie/moviedetail.jf?mno=${rank1.no }"><img
								class="aa" src="/jf/photos/movieposters/${rank1.poster }"
								alt="어벤져스: 엔드게임 포스터"></a> <span
							class="ico-grade grade-${rank1.ageLimit }">${rank1.ageLimit }세
								이상</span>
					</span> <strong class="no1">1위</strong>
					</a>
					<div class="box-contents">
						<div class="row">
							<div class="col-sm-12 chart_movie_title_div">
								<a class="chart_movie_title" href=""> <strong class="title">${rank1.korTitle }</strong>
								</a>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<div class="score chart_score">
									<span class="percent">예매율<span>${rank1.reservationRate }%</span></span>
									<div class="egg-gage small">
										<span class="egg great"></span> <span class="percent">${rank1.goldenEgg }%</span>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<span class="txt-info"> <span> <fmt:formatDate
											value="${rank1.releaseDate }" pattern="yyyy-MM-dd" /> <span>개봉</span>
								</span>
								</span>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12 gpa_thumbnail_bottom_div">
								<div class="likes" id="">
									<c:set var="wish" value="wishEmpty" />
									<c:forEach var="wishList" items="${wishLists }">
										<c:if test="${wishList.movieNo eq rank1.no }">
											<c:set var="wish" value="wishExist" />
										</c:if>
									</c:forEach>
									<c:choose>
										<c:when test="${wish eq 'wishEmpty' }">
											<a 
												class="gpa_reservation_a chart_gpa_reservation_a ${(empty param.mno ? rank1movie : param.mno) eq rank1.no ? 'thumbnail_active' : '' }"
												href="#" onclick="goWish(event, ${rank1.no })"> <span
												class="glyphicon glyphicon-heart chart_glyphicon_heart"></span>
												<span style="border:1px solid gray; color:gray;"
												class="gpa_wishListCount ${(empty param.mno ? rank1.no : param.mno) eq rank1.no ? 'likes_active' : '' }">${rank1.wishList }</span>
											</a>
										</c:when>
										<c:otherwise>
											<a
												class="gpa_reservation_a chart_gpa_reservation_a ${(empty param.mno ? rank1.no : param.mno) eq rank1.no ? 'thumbnail_active' : '' }"
												href="process_removeWishList?mno=${rank1.no }"
												onclick="goWishRemove(event, ${rank1.no})"> <span
												class="glyphicon glyphicon-heart red chart_glyphicon_heart"></span>
												<span style="border:1px solid gray; color:gray;"
												class="gpa_wishListCount ${(empty param.mno ? rank1.no : param.mno) eq movie.no ? 'likes_active' : '' }">${rank1.wishList }</span>
											</a>
										</c:otherwise>
									</c:choose>
									
									<span class="gpa_reservation_span"> <a href="../reservation/reservation.jf?mno=${rank1.no }"><img
											class="chart_resv_img"
											src="/jf/photos/reservationImg2.PNG" alt="" /></a>
									</span>

								</div>
							</div>

						</div>
					</div>
				</div>
				<c:forEach var="m" begin="0" end="100" varStatus="status"
					items="${movies }">
					<div class="col-sm-3 list-content">
						<strong class="rank">NO.${status.index+2}</strong> <a
							href="/movies/detail-view/?midx=81745"> <span
							class="thumb-image"> <a
								href="/jf/movie/moviedetail.jf?mno=${m.no }"><img class="aa"
									src="/jf/photos/movieposters/${m.poster }" alt="${m.poster }"></a>
								<span class="ico-grade grade-${m.ageLimit }">청소년 관람불가</span>
						</span>
						</a>
						<div class="box-contents">
						<div class="row">
							<div class="col-sm-12 chart_movie_title_div">
								<a class="chart_movie_title" href=""> <strong class="title">${m.korTitle }</strong>
								</a>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<div class="score chart_score">
									<span class="percent">예매율<span>${m.reservationRate }%</span></span>
									<div class="egg-gage small">
										<span class="egg great"></span> <span class="percent">${m.goldenEgg }%</span>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<span class="txt-info"> <span> <fmt:formatDate
											value="${m.releaseDate }" pattern="yyyy-MM-dd" /> <span>개봉</span>
								</span>
								</span>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12 gpa_thumbnail_bottom_div">
								<div class="likes" id="">
									<c:set var="wish" value="wishEmpty" />
									<c:forEach var="wishList" items="${wishLists }">
										<c:if test="${wishList.movieNo eq m.no }">
											<c:set var="wish" value="wishExist" />
										</c:if>
									</c:forEach>
									<c:choose>
										<c:when test="${wish eq 'wishEmpty' }">
											<a 
												class="gpa_reservation_a chart_gpa_reservation_a"
												href="#" onclick="goWish(event, ${m.no })"> <span
												class="glyphicon glyphicon-heart chart_glyphicon_heart"></span>
												<span style="border:1px solid gray; color:gray;"
												class="gpa_wishListCount">${m.wishList }</span>
											</a>
										</c:when>
										<c:otherwise>
											<a
												class="gpa_reservation_a chart_gpa_reservation_a"
												href="process_removeWishList?mno=${m.no }"
												onclick="goWishRemoveInChart(event, ${m.no})"> <span
												class="glyphicon glyphicon-heart red chart_glyphicon_heart"></span>
												<span style="border:1px solid gray;  color:gray;"
												class="gpa_wishListCount">${m.wishList }</span>
											</a>
										</c:otherwise>
									</c:choose>
									
									<span class="gpa_reservation_span"> <a href="../reservation/reservation.jf?mno=${m.no }"><img
											class="chart_resv_img"
											src="/jf/photos/reservationImg2.PNG" alt="" /></a>
									</span>
								</div>
							</div>

						</div>
					</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<%@include file="../../common/footer.jsp"%>
	<script>
		var member = '${LOGINMEMBER}';
		var from = $('#forlikes-from').val();
	</script>
</body>
</html>