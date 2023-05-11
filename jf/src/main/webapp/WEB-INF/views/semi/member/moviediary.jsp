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
<link rel="stylesheet" href="/jf/resources/bootstrap/css/moviediary.css">
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
					<div>
						<a href="/jf/member/moviediary.jf">
							<div class="col-sm-9 wish_1 red">
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
								<span class="wish_2_1_1">무비다이어리</span> <span class="wish_2_1_2">CGV와
									함께한 추억들<c:out value="${wishListsCount }" default="0" />건
								</span>
							</div>
						</div>

					</div>

				</div>
			</div>
			<div class="col-sm-9 ">
				<div class="row">
					<div class="col-sm-12 ">
						<div class="row">
							<div class="col-sm-10 col-sm-offset-1 diary_review">
								<div>
									<form method="post" action="insertmoviediary.jf" enctype="multipart/form-data">
										<ul>
											<li class="menu main_select "><a class=""><img
												class="icon" src="/jf/photos/diary1.PNG" />│ 어떤영화를
												보셨나요?&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
												▽</a>
												<ul id="moviedetail" class="list-group hide">
													<c:forEach var="detailById" items="${detailById }">
														<li class="list-group-item" id="item-${detailById.detailNo }">
															<div class="row">
																<div class="col-sm-3 text-center">
																	<img class="poster" src="/jf/photos/movieposters/${detailById.poster }" class="image-thumbnail" />
																</div>
																<div class="col-sm-7">
																<p>
																	<div style="font-size:17px;"><strong>${detailById.korTitle }</strong></div>
																	<div style="font-size:12px;">${detailById.engTitle }</div>
																</p>
																<p>
																	<div><strong><fmt:formatDate value="${detailById.screeningDate }"/>, ${detailById.screeningTime }</strong></div>
																	<div>${detailById.theaterName }, ${detailById.roomName }</div>
																</p>
																	<input type="hidden" name="detailNo" value="${detailById.detailNo }"/>
																</div>
																<div class="col-sm-2">
																	<button id="selectButton" type="button" class="btn btn-sm diary_select_button" onclick="selectMovie(${detailById.detailNo})">선택</button>
																</div>
															</div>
														</li>
													</c:forEach>
												</ul>
											</li>
	
											<li class="menu main_select"><img class="icon" src="/jf/photos/diary2.PNG" />│ 
												<input class="whatMovie" type="text" id="txtMovieWith" placeholder="누구와 함께 보셨나요?" name="txtMovieWith" maxlength="60">
											</li>
	
											<li class="menu main_select">
												<img class="icon" src="/jf/photos/diary3.PNG" />│ 
												<textarea class="isGoodMovie" name="isGoodMovie" rows="" cols="">영화 어떻게 보셨나요?</textarea>
											</li>
	
											<li class="menu main_select_gray">
												<div class="row">
													<div class="col-sm-1">
														<ul>
															<li class="menu trailer">
																<a>
																	<img class="icon-bottom" src="/jf/photos/diary4.PNG" />
																</a>
																<ul class="hide main_select_bottom" id="movietrailer" name="movietrailer" ></ul>
															</li>
														</ul>
													</div>
													<div class="col-sm-1">
														<ul>
															<li class="menu trailer ">
																<a><img class="icon-bottom" src="/jf/photos/diary5.PNG" /></a>
																<ul class="hide main_select_bottom_1" id="moviesteelcut" name="moviesteelcut">
																	<li></li>
																</ul>
															</li>
														</ul>
													</div>
													<div class="col-sm-1">
														<ul>
															<li class="menu trailer ">
																<a><img class="icon-bottom" src="/jf/photos/diary6.PNG" /></a>
																<ul class="hide main_select_bottom_2">
																	<div class="filebox">
																		
																		<div class="row">
																			<div class="col-sm-12 diary_col_1">
																				함께 기록하고 싶은 사진이 있으신가요?
																			</div>
																			<div class="col-sm-12 diary_col_2">
																				<!-- <input class="upload-name" value="파일선택" disabled="disabled">
																				<label for="ex_file">업로드</label> -->
																				<div class="box">
																				  <span class="filetype">
																				           <!-- <span class="file-text"></span>-->
																				  <input type="text" disabled="disabled" class="file-text" />
																				  <span class="file-btn">파일 선택</span>
																				  <span class="file-select"> <input  id="ex_file" class="input-file" type="file" name="imgName" size="3"/></span>
																				  </span>
																				</div>
																				<span class="diary_infos">JPG, PNG, GIF, JPEG 파일만 등록 가능합니다.</span>
																			</div>
																				
																		</div>
																	 </div>
																</ul>
															</li>
														</ul>
													</div>
													<div class="col-sm-3 col-sm-offset-6">
														<button onclick="location.href='/jf/member/moviediary.jf';" type="reset" class="btn btn-sm btn-default diary_cancel_button">취소</button>
														
														<button type="submit" class="btn btn-sm btn-danger">게시</button>
													</div>
												</div>
											</li>
										</ul>
									</form>
								</div>
								<hr>
								
								
								<div class="diary">
									<c:forEach var="diary" items="${diarys }">
										<c:forEach var="detailById" items="${detailById }">
											<c:if test="${diary.detailNo == detailById.detailNo }">
												<div class="panel panel-default">
													<div class="panel-heading">
														${detailById.korTitle } <small>(${detailById.engTitle })</small>
														<small><fmt:formatDate value="${diary.diaryCreateDate }" /></small>
														<small style="margin-top: 13px; margin-left: 90px; font-size: 9px; color: gray;">
														<fmt:formatDate value="${detailById.screeningDate }" pattern="yyyy년 MM월 dd일 EEEE H:m" /> 작성</small>
													</div>
													<div class="panel-body">
														<table class="table">
															<tbody>
																<tr>
																	<th>관람일</th>
																	<td><fmt:formatDate	value="${detailById.screeningDate }" pattern="yyyy년 MM월 dd일 EEEE" /> ${detailById.screeningTime }</td>
																</tr>
																<tr>
																	<th>함께 본 친구</th>
																	<td>${diary.friend }</td>
																</tr>
																<tr>
																	<th>상영관</th>
																	<td>${detailById.theaterName }<span
																		class="label label-success">${detailById.roomName }</span></td>
																</tr>
																<tr>
																	<th>트레일러</th>
																	<td><iframe width="300px;" height="160px;"
																			src="${ detailById.trailer}" frameborder="0"
																			allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
																			allowfullscreen></iframe></td>
																</tr>
																<tr>
																	<th>스틸컷</th>
																	<td><img class="wish_profile" src="/jf/photos/${diary.steelCut }" alt=""></td>
																</tr>
																<tr>
																	<th>사진</th>
																	<td><img class="wish_profile" src="/jf/photos/${diary.photo }" alt=""></td>
																</tr>
																<tr>
																	<th>내용</th>
																	<td>${diary.diaryContents }</td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</c:if>
										</c:forEach>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<div class="sponser" style="position:fixed; margin-left:650px;">
				<img
					src="http://adimg.cgv.co.kr/images/201905/MeninBlack/0529_160x300.jpg"
					alt="" /> 
				</div>
				<div class="sponser" style="position:fixed; margin-left:650px; margin-top: 306px;">	
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

	<script type="text/javascript">
	var $fileBox = $('.filetype');

	$fileBox.each(function() {
	  var $fileUpload = $(this).find('.input-file'),
	    $fileText = $(this).find('.file-text')
	  $fileUpload.on('change', function() {
	    var fileName = $(this).val();
	    $fileText.attr('disabled', 'disabled').val(fileName);
	  })
	})

	var number = 0;
	   function selectMovie(detailNo) {
	    number = detailNo;  
	      
	      var movie = document.getElementById("item-" + detailNo);
	      
	      document.getElementById("moviedetail").innerHTML = '<li class="list-group-item">' + movie.innerHTML + '</li>';
	      $('#selectButton').addClass('hide');
	      var xhr = new XMLHttpRequest();
	      xhr.onreadystatechange = function() {
	         if (xhr.readyState == 4 && xhr.status == 200){
	            
	            // JSON.parse(jsonText)
	            // json표기법으로 작성된 텍스트를 자바스크립트 객체나 배열로 변환한다.
	            var detailById = JSON.parse(xhr.responseText);
	            console.log(detailById);
	            var htmlContent = '<li><iframe width="300" height="150" src="'+detailById.trailer+'" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></li>';
	            htmlContent+= '<input style="position:relative; left:350px; bottom:50px;" type="radio" name="trailer" value="'+ detailById.trailer +'">';
	            
	            document.getElementById("movietrailer").innerHTML = htmlContent;
	            
	            var htmlContent = '<li><img width="100" height="150" class="icon-bottom" src="/jf/photos/'+ detailById.steelcut +'" /></li>';
	            htmlContent+= '<input style="position:relative; left:350px; bottom:50px;" type="radio" name="trailer" value="'+ detailById.steelcut +'">';
	            
	            document.getElementById("moviesteelcut").innerHTML = htmlContent;
	            // 응답데이터 처리
	            
	            // 화면갱신
	         }
	      }
	      xhr.open("GET", "/jf/member/moviediarydetail.jf?detailById=" + detailNo);
	      xhr.send();
	   }
		
	    // html dom 이 다 로딩된 후 실행된다.
	    $(document).ready(function(){
	        // memu 클래스 바로 하위에 있는 a 태그를 클릭했을때
	        $(".menu > a").click(function(){
	            // 현재 클릭한 태그가 a 이기 때문에
	            // a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
	            $(this).next("ul").toggleClass("hide");
	        });
	/*         $(".whatMovie").click(function(){
	        	 $(this).removeAttr("placeholder");
	        	 
	        }); */
	        
	        $(".whatMovie").focusout(function(){
				if(!$(this).val()){
					$(this).attr("placeholder", "누구와 함께 보셨나요?");
				}
	        }).focusin(function(){
	        	var tempText = $(this).attr("placeholder");
	        	if(tempText=="누구와 함께 보셨나요?"){
	        		$(this).removeAttr("placeholder")
	        	}
	        });
	        
	        $(".isGoodMovie").focusin(function(){
	        	var tempText = $(this).val();
	        	if(tempText == "영화 어떻게 보셨나요?"){
	        		$(this).val("");
	        	}
	        }).focusout(function() {
	        	var tempText = $(this).val();
				if(tempText==""){
					$(this).val("영화 어떻게 보셨나요?");
				}
			})
	    });
	    
	</script>
</body>
</html>


