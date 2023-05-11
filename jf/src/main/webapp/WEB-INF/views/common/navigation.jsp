<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/jf/resources/bootstrap/css/header.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/main.css">

    <div class="navbar navbar-inverse">
        <div class="container">
            <ul class="nav navbar-nav">
                <li><a href="/jf/movie/chart.jf">무비 차트</a></li>
                <li><a href="/jf/reservation/reservation.jf">빠른 예매</a></li>
                <li><a href="/jf/semi/eventlist.jf">이벤트</a></li>
            </ul>
                <ul class="nav navbar-nav navbar-right">
                <c:choose>
	                <c:when test="${empty LOGINMEMBER }">
	                	<li><a href="/jf/member/login.jf">로그인</a></li>
		                <li><a href="/jf/member/register.jf">회원가입</a></li>
	                </c:when>
	                <c:otherwise>
		                <li><a href="/jf/member/process_logout.jf">로그아웃</a></li>
		                <li><a href="/jf/member/mycgvpage.jf">My CGV</a></li>
	                </c:otherwise>
                </c:choose>
                <c:if test="${LOGINMEMBER.type == 'ADMIN' }">
                		<li><a href="/jf/admin/adminform.jf">관리자</a></li>
                </c:if>
                <li><a href="/jf/semi/admin/customercenter.jf">고객센터</a></li>
            </ul>
        </div>
    </div>
        <div class="container-fluid header top_header">
        <div class="container main_container" style="margin-top: 40px">
            <div class="row text-center">
                <div class="col-sm-3">
                    <a href="/jf/main.jf">
                        <img src="/jf/photos/header_logo.png" alt="" style="max-width:70%; margin-top: 1px;">
                    </a>
                </div>
                <div class="col-sm-6">
                    <div class="row">
                       <div class="col-sm-12 header_center1">
                            <div class="row">
                                <a href="/jf/main.jf"><img src="/jf/photos/header_cultureplex.png" alt="" style="max-width:45%;"></a>
                            </div>
                        </div>
                        <div class="col-sm-12 header_center2">
                            <div class="row">
                                <div class="col-sm-3 main_header dropdown">
                                     <a href="/jf/movie/chart.jf" class="dropdown-toggle" data-toggle="dropdown">영화<span class="caret"></span></a>
                                     	<div class="dropdown-menu">
                                     		<i></i>
                                     		<div class="smenu">
		                                        <ul>
		                                            <li><a href="/jf/movie/chart.jf">무비차트</a></li>
		                                            <li><a href="/jf/movie/finder.jf">무비파인더</a></li>
		                                            <li class="last"><a href="/jf/movie/gpa.jf">평점</a></li>
		                                        </ul>
                                     		</div>
                                     	</div>
                                </div>
                                <div class="col-sm-3 main_header dropdown">
                                    <a href="/jf/reservation/reservation.jf" class="dropdown-toggle" data-toggle="dropdown">예매<span class="caret"></span></a>
                                    	<div class="dropdown-menu">
                                    		<i></i>
                                    		<div class="smenu">
		                                        <ul>
		                                            <li><a href="/jf/reservation/reservation.jf">빠른 예매</a></li>
		                                            <li><a href="/jf/reservation/theatertimetable.jf">상영 시간표</a></li>
		                                        </ul>
                                    		</div>
                                    	</div>
                                </div>
                                <div class="col-sm-3 main_header">
                                    <a href="/jf/cgv/cgvtheaters.jf?tno=1&city=서울">극장</a>
                                </div>
                                <div class="col-sm-3 main_header">
                                    <a href="/jf/semi/eventlist.jf">이벤트</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
</div>