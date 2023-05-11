<%@page import="kr.co.hta.util.DateUtils"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.hta.movies.dao.MovieDao"%>
<%@page import="kr.co.hta.vo.Movie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>영화 &lt; 평점 | ${m.korTitle } | 영화 그 이상의 감동. CGV</title>
<link rel="shortcut icon" href="/jf/photos/cj_logo.ico" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/main.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/header.css" />
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Nunito"
	rel="stylesheet">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/GPA.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript"
	src="/jf/resources/bootstrap/js/gpaHeader.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.js"></script>
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
		<div class="row GPA_main">
		<!-- 캐러셀 시작-->
	        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
	          <div class="carousel-inner" role="listbox">
		          <c:forEach begin="0" end="${caroselLength }" var="eachMovie" items="${movieLists}" varStatus="status">
				   			<div id="item${status.count }" class="item ">
				          		<c:forEach var="movie" items="${eachMovie }">
										<div class="col-sm-3 imgs">
											<div class="thumbnail ${(empty param.mno ? rank1movie : param.mno) eq movie.no ? 'thumbnail_active' : '' }">
												<a href="gpa.jf?mno=${movie.no }&rno=1&thumbno=${status.count}">
													<img class="GPA_main_posterimgs" src="/jf/photos/movieposters/${movie.poster }" style="">
												</a>
												<%@include file="../../common/ajax_gpaitem.jsp" %>
											</div>
										</div>
				          		</c:forEach>
				            </div>
		          </c:forEach>
	          </div>
	          <!-- Controls -->
	          <a style="width:20px;" class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
	            <span style="font-size:50px; margin:0px;" class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	            <span class="sr-only">Previous</span>
	          </a>
	          <a style="width:20px;" class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
	            <span style="font-size:50px; margin-top:3px; margin-right:18px;" class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	            <span class="sr-only">Next</span>
	          </a>
	        </div>
		<!-- 캐러셀 끝-->
		</div>

		<div class="row GPA_main_2">
			<input id="forlikes-from" type="hidden" name="from" value="gpa" />
			<%@include file="../../common/GPAcommon.jsp"%>
			<div class="col-sm-2">
				<img
					src="http://adimg.cgv.co.kr/images/201904/Gangster/0515_160x300_1.jpg"
					alt=""> <img
					src="http://adimg.cgv.co.kr/images/201808/citi/0516_160x300.jpg"
					alt="">
			</div>
		</div>
		<!-- 페이지네이션 시작 -->
		<%-- <%@include file="../../common/pagination.jsp"%> --%>
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
		<!-- 페이지네이션 끝 -->
	</div>
	<%@ include file="../../common/footer.jsp"%>
	<script>
	$('.carousel').carousel({
		  interval: false
	})
	
	var thumbno = Number('${thumbno}');
	function checkThumbnailPage(){
		$('.item').each(function(){
			$(this).removeClass('active');
			for(var i=1; i<=thumbno; i++){
				if(thumbno==i){
					$('#item'+i).addClass('active');
					break;
				}
			}
		})
	}
	checkThumbnailPage();
	var carouselLength = '${caroselLength}';
	
 	$('.carousel-control.right').click(function(){
		if(thumbno == carouselLength){
			thumbno = 1;
			return;
		} else{
			thumbno += 1;
			return;
		}
	});
 	
	$('.carousel-control.left').click(function(){
		if(thumbno == 1){
			thumbno = carouselLength;
			return;
		} else{
			thumbno -= 1;
			return;
		}	
	});
	
	
	
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
            width: 430,
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
        chart.draw(data, options);
    }
    var member = '${LOGINMEMBER}';
    var from = $('#forlikes-from').val();
    var paramMovieNo = '${param.mno}';
    
    function goWish(event, movieNo) {
    	
    	event.preventDefault();
    	if(member==""){
    		
    		var result = confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?");
    		if(result){
    			location.href = '/jf/member/login.jf?from='+from+'&thumbno='+thumbno+'&mno='+movieNo;
    			return;
    		}
    	} else{
    		var result = confirm("위시리스트에 등록하시겠습니까?");
	    	if (result) {
	    		var xhr = new XMLHttpRequest();
	    		xhr.onreadystatechange = function(){
	    			if(xhr.readyState == 4 && xhr.status == 200){
	    				var result2 = confirm("위시리스트에 등록되었습니다. 위시리스트로 이동하시겠습니까?");
	    				if(result2){
	    					location.href="/jf/member/wishlist.jf";
	    				} else{
	    					location.replace("/jf/movie/gpa.jf?thumbno="+thumbno+"&mno="+paramMovieNo);
	    				}
	      			}
	    		}
    		xhr.open("GET", "/jf/member/ajax_process_addNewWishList.jf?mno="+movieNo);
		    xhr.send();
    		}
    	}
    }
    
    function goWishRemove(event,movieNo){
    	event.preventDefault();
    	var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
    			alert('위시리스트에서 삭제되었습니다.');
    			location.replace("/jf/movie/gpa.jf?thumbno="+thumbno+"&mno="+paramMovieNo);
			}
		}
		xhr.open("GET", "/jf/member/ajax_process_removeWishListinGPA.jf?mno=" + movieNo);
	    xhr.send();
    }
    
	</script>

</body>
</html>
