<%@page import="kr.co.hta.util.DateUtils"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.hta.movies.dao.MovieDao"%>
<%@page import="kr.co.hta.vo.Movie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>이벤트 | 영화 그 이상의 감동. CGV</title>
<link rel="shortcut icon" href="/jf/photos/cj_logo.ico" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/main.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/header.css" />
<link rel="stylesheet" href="/jf/resources/bootstrap/css/event.css" />
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Nunito"
	rel="stylesheet">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/GPA.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

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
		<div class="row GPA_header_col_1">
			<div class="col-sm-2">
				<span class="GPA_left_1">EVENT</span>
			</div>
		</div>
		<div class="row">
			<hr class="event_hr_1" />
		</div>
		<div class="row event_threeImg_row">
		<c:forEach var="recent" items="${eventRecent }">
			<div class="col-sm-4">
				<a href="eventDetail.jf?eno=${recent.no }"><img src="/jf/photos/eventPhotos/${recent.imgName }" alt="" style="width:290px; height:242px;" /></a>
			</div>
		</c:forEach>
			
			
			<ul class="tab-menu" style="margin-top:30px;">
				<li class="first"><a href="eventlist.jf" title="현재 선택">전체</a></li>
				<li><a href="eventlist.jf?cat=멤버십" title="">멤버십</a></li>
				<li><a href="eventlist.jf?cat=영화/예매" title="">영화/예매</a></li>
				<li><a href="eventlist.jf?cat=CGV아트하우스" title="">CGV아트하우스</a></li>
				<li><a href="eventlist.jf?cat=제휴/할인" title="">제휴/할인</a></li>
			    <li><a href="eventlist.jf?cat=스페셜이벤트" title="">스페셜이벤트</a></li>
			    <li class="eventlast"><a href="eventlist.jf?cat=CGV극장별" title="">CGV극장별</a></li>
			</ul>
		</div>
		
		<div class="sect-event">
            <div class="box-event">
                <div class="evt-item-lst" style="min-height: 976px;">
                <c:if test="${empty AllEvent }">
 					<div class="text-center" style="font-size:60px;">
	 					<h1 style="position:absolute; margin-top:100px;"> 진행중인 이벤트가 없습니다!</h1>	               
 					</div>
                </c:if>
                <c:if test="${not empty AllEvent[0] }">
	               	<div style="position: absolute; top: 45px; left: 557px;"><a id="tile_2" href="eventDetail.jf?eno=${AllEvent[0].no }" target=""><img src="/jf/photos/eventPhotos/${AllEvent[0].imgName }" alt="<하나레이베이> 라이브러리톡" style="height: 200px;"></a></div>
                </c:if>
                <c:if test="${not empty AllEvent[1] }">
	                <div style="position: absolute; top: 140px; left: 289px;"><a id="tile_1" href="eventDetail.jf?eno=${AllEvent[1].no }" target=""><img src="/jf/photos/eventPhotos/${AllEvent[1].imgName }" alt="<하나레이베이> 라이브러리톡" style="height: 200px;"></a></div>
                </c:if>
                <c:if test="${not empty AllEvent[2] }">
	                <div style="position: absolute; top: 180px; left: 17px;"><a id="tile_0" href="eventDetail.jf?eno=${AllEvent[2].no }" target=""><img src="/jf/photos/eventPhotos/${AllEvent[2].imgName }" alt="<기생충> 사운드 특화 상영관 안내" style="height: 200px;"></a></div>
                </c:if>
                <c:if test="${not empty AllEvent[3] }">
	                <div style="position: absolute; top: 265px; left: 557px;"><a id="tile_5" href="eventDetail.jf?eno=${AllEvent[3].no }" target=""><img src="/jf/photos/eventPhotos/${AllEvent[3].imgName }" alt="<서스페리아> 이동진 평론가 앵콜 시네마톡" style="height: 200px;"></a></div>
                </c:if>
                <c:if test="${not empty AllEvent[4] }">
	                <div style="position: absolute; top: 360px; left: 289px;"><a id="tile_4" href="eventDetail.jf?eno=${AllEvent[4].no }" target=""><img src="/jf/photos/eventPhotos/${AllEvent[4].imgName }" alt="아트하우스 Club 뱃지 2차 <세상을 바꾼 변호인>" style="height: 200px;"></a></div>
                </c:if>
                <c:if test="${not empty AllEvent[5] }">
	                <div style="position: absolute; top: 400px; left: 17px;"><a id="tile_3" href="eventDetail.jf?eno=${AllEvent[5].no }" target=""><img src="/jf/photos/eventPhotos/${AllEvent[5].imgName }" alt="<북클럽> 아트하우스CLUB 시사회" style="height: 200px;"></a></div>
                </c:if>
                <c:if test="${not empty AllEvent[6] }">
	                <div style="position: absolute; top: 485px; left: 557px;"><a id="tile_8" href="eventDetail.jf?eno=${AllEvent[6].no }" target=""><img src="/jf/photos/eventPhotos/${AllEvent[6].imgName }" alt="<북클럽> 아트하우스CLUB 시사회" style="height: 200px;"></a></div>
                </c:if>
                <c:if test="${not empty AllEvent[7] }">
	                <div style="position: absolute; top: 580px; left: 289px;"><a id="tile_8" href="eventDetail.jf?eno=${AllEvent[7].no }" target=""><img src="/jf/photos/eventPhotos/${AllEvent[7].imgName }" alt="<북클럽> 아트하우스CLUB 시사회" style="height: 200px;"></a></div>
                </c:if>
            </div>
        </div>
    </div>
	</div>
	
	
	
	<%@ include file="../../common/footer.jsp"%>
	
</body>
</html>
