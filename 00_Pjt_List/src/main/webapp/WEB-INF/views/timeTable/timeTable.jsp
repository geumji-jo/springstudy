<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title></title>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<link rel="stylesheet" href="/resources/css/timeTable.css" />     
</head>
<body>
<%-- <%@include file="../common/nav.jsp"%> --%>
<div class="container">
	<div class="mt-5">
		<div class="inner-wrap">
			<div>
				<span>Home</span> >
				<a href="#" title="예매 페이지로 이동">예매</a> >
				<a href="/timeTable/timeTable" title="상영시간표 페이지로 이동">상영시간표</a>
			</div>
		</div>
		<div>
			<div class="movieChoiseArea">
					<div class="tab-left-area1">
							<a href="#masterMovie" title="영화별 선택" class="btn"><img src="../../resources/images/ico-tab-movie-on.png" /> 영화별</a>
					</div>
					<div class="tab-left-area2">
							<a href="#masterBrch" title="극장별 선택" class="btn"><img src="../../resources/images/ico-tab-theater.png" /> 극장별</a>
					</div>
					<div class="tab-left-area3">
							<a href="#masterSpclBrch" title="특별관 선택" class="btn"><img src="../../resources/images/ico-tab-special.png" /> 특별관</a>
					</div>							
					<div class="timeMainTitle">
							<nav>
								<div class="nav nav-tabs nav-justified mt-5" id="nav-tab" role="tablist">
									<button class="nav-link active" id="nav-boxoffice-tab" data-bs-toggle="tab" data-bs-target="#nav-boxoffice" type="button"
										role="tab" aria-controls="nav-boxoffice" aria-selected="true">박스오피스</button>
									<button class="nav-link" id="nav-upcoming-tab" data-bs-toggle="tab" data-bs-target="#nav-upcoming" type="button" role="tab"
										aria-controls="nav-upcoming" aria-selected="false">상영예정작</button>
									<button class="nav-link" id="nav-trending-tab" data-bs-toggle="tab" data-bs-target="#nav-trending" type="button" role="tab"
										aria-controls="nav-trending" aria-selected="false">인기 영화</button>
								</div>
							</nav>
					</div>			
					<div class="timeMainMovie">
						<div class="col-3">ddd</div>
						<div class="col-3">ddd</div>
						<div class="col-3">ddd</div>
						<div class="col-3">ddd</div>
						<div class="col-3">ddd</div>
						<div class="col-3">ddd</div>
					</div>
					<div class="timePoster"><img src="../../resources/images/examPoster.jpg" /></div>
			</div>
			<div class="location">
				<h3>
					<span class="font-green">상영시간표</span>
				</h3>
			</div>
			<div class="timeSchedule">
				<h1>시간표</h1>
			</div>
			<div class="movieOption">
				<ul>
					<li>전체</li>
					<li>전체</li>
					<li>전체</li>
					<li class="grade">
					<div>
						<a data-bs-toggle="modal" data-bs-target="#gradeModal" href="#" id="grade-btn" >관람등급 </a>
					</div>
					</li>	
				</ul>
			</div>
			<div class="movieTimeList">
				<h1></h1>
			</div>	
		</div>
	</div>
</div>
	<!-- 관람평 모달 -->
	<div class="modal fade" id="gradeModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="review-btn">관람등급 안내</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="gradeTable">
						<thead>
							<tr>
								<th>등급명</th>
								<th>설명</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>전체 관람가</td>
								<td>모든 연령의 고객이 관람 가능</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">

</script>
</body>
</html>