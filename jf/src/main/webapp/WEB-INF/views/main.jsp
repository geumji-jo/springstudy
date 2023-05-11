<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>영화 &lt; 영화 그 이상의 감동. CGV</title>
    <link rel="shortcut icon" href="/jf/photos/cj_logo.ico" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Nunito" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/jf/resources/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/jf/resources/bootstrap/css/main.css">
</head>
<body>
    <!-- header.html -->
<%@include file="common/navigation.jsp" %>
    <!-- header.html -->
    <div class="container-fluid bg-bricks main bg-bricks">
    <!-- main.jsp -->    	
    <div class="container main_contents">
        <div class="row main-contents">
                <!-- 1번 메인 -->
            <div id="carousel-example-generic" class="carousel slide col-sm-12" style="padding:inherit" data-ride="carousel">
                  <!-- Indicators -->
                  <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                  </ol>

                  <!-- Wrapper for slides -->
                  <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <a href="/jf/movie/chart.jf"><img class="img-responsive center-block" src="http://img.cgv.co.kr/Front/Main/2019/0605/15597168732570.jpg" alt="cgv"></a>
                    </div>
                    <div class="item">
                      <a href="/jf/semi/eventlist.jf"><img class="img-responsive center-block" src="/jf/photos/main_slide_toc.jpg" alt="이벤트"></a>
                    </div>
                    <div class="item">
                        <a href="/jf/movie/chart.jf"><img class="img-responsive center-block" src="/jf/photos/main_slide_suspiria.jpg" alt="영화 서스피리아"></a>
                    </div>
                    <div class="item">
                      <a href="/jf/semi/eventlist.jf"><img class="img-responsive center-block" src="/jf/photos/main_slide_event.png" alt="이벤트"></a>
                    </div>
                </div>

                  <!-- Controls -->
                  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true" ></span>
                    <span class="sr-only">Previous</span>
                  </a>
                  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                  </a>
            </div>
        </div>
        <div class="main-contents">
            <!-- 2번 메인 -->
            <div class="row second-title">
                <img src="/jf/photos/main_movie_selection.gif">
            </div>
            <div class="row">
                <div class="col-sm-8">
                <!--  트레일러 넣어둠 -->
                <iframe src="https://www.youtube.com/embed/JF4ZFYiaiLk" width="733" height="388" title="영화광고-업사이드" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="Movie_Selection_L" id="Movie_Selection_L"></iframe>
                </div>
                <div class="col-sm-4" style="padding-left: 70px">
                <img src="/jf/photos/movieposters/${recentMovie.poster }" onclick="location.href='/jf/movie/moviedetail.jf?mno=${recentMovie.no}'" width="240" height="388" title="영화광고-업사이드" name="Movie_Selection_R" id="Movie_Selection_R">
                </div>
            </div>
        </div>
        <div class="main-contents">
            <!-- 3번 메인 -->
            <div class="row second-title">
                <img src="/jf/photos/main_event.gif">
            </div>
            <div class="row">
            	<c:forEach var="event" items="${events }" begin="0" end="3" >
                <div class="event-list col-sm-3">
                    <a href="/jf/semi/eventDetail.jf?eno=${event.no }"><img src="/jf/photos/eventPhotos/${event.imgName }" style="width:240px; height:200px;"></a>
                </div>
            	</c:forEach>
            </div>
        </div>
    </div>
    <hr/>
    </div>
    <!-- Footer -->
		<%@include file="common/footer.jsp" %>
	<!-- ./Footer -->
</body>
</html>