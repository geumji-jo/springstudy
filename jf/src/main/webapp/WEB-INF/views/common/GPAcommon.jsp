<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Trigger the modal with a button -->

<!-- Modal -->
<div class="col-sm-10">
	<div class="row">
		<div class="col-sm-2 GPA3 GPA3_1 text-center">
			실관람객 평점<span class="glyphicon glyphicon-play"></span>
		</div>
		<div class="col-sm-7 GPA3 GPA3_2 text-center">
			관람일 포함 7일 이내 관람평을 남기시면 <span class="cjPoint">CJ ONE 20P</span>가
			적립됩니다.
		</div>
		<div class="col-sm-3 GPA3 text-center GPA3_buttonDiv">
			<c:choose>
				<c:when test="${not empty LOGINMEMBER }">
					<c:if test="${isWatched eq 'Y' }">
						<c:if test="${isWrote eq 'N' }">
							<button class="btn btn-danger btn-sm GPA3_button GPA3_button_1"
							data-toggle="modal" data-target="#myModal">평점작성</button>
						</c:if>
						<c:if test="${isWrote eq 'Y' }">
							<button class="btn btn-danger btn-sm GPA3_button GPA3_button_1"
							onclick="alert('평점은 한번만 작성할 수 있습니다.')">평점작성</button>
						</c:if>
					</c:if>
					<c:if test="${isWatched eq 'N' }">
						<button class="btn btn-danger btn-sm GPA3_button GPA3_button_1"
						onclick="goMyWatchedMovie()">평점작성</button>
					</c:if>
				</c:when>
				<c:otherwise>
					<button class="btn btn-danger btn-sm GPA3_button GPA3_button_1"
					onclick="goWrite(${empty param.mno ? rank1movie : param.mno},${empty param.thumbno ? 1 : param.thumbno })">평점작성</button>
				</c:otherwise>
			</c:choose>
			<div class="modal modal-center fade" id="myModal" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<form action="/jf/movie/addreview.jf" method="post">
						<input id="hiddenFrom" type="hidden" name="from" value="" />
						 <input	type="hidden" name="mno" value="${param.mno }" />
						  <input type="hidden" name="rno" value="${param.rno }" />
						  <input type="hidden" name="rno" value="${param.thumbno }" />
							
						<div class="modal-content">
							<div class="modal-header modal_header_div">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">평점 작성</h4>
							</div>
							<div class="modal-body">
								<div class="container-fluid">
									<div class="row modal_movieTitle">
										<div class="col-sm-6 col-sm-offset-3 text-center ">
											${currentMovie.korTitle}</div>
									</div>
									<div class="row modal_center_row">
										<div class="col-sm-4 goodOrBad_div like_good text-right">
											<p class="goodOrBad">
												<span onclick="toggleLike(1)"
													class=" GOB GOB1 goodOrBad_selected ">좋았어요~^^ </span> <input
													class="hiddenText" type="text" name="like">
											</p>
										</div>
										<div class="col-sm-4 center_col">
											<div class="row">
												<div class="col-sm-12 text-center">
													<img src="/jf/photos/profile2.PNG" alt="" />
												</div>
												<div class="col-sm-12 text-center">
													<span class="userInfo"> <span class="realviewer">실관람객
													</span> ${LOGINMEMBER.id }
													</span>
												</div>
											</div>
										</div>
										<div class="col-sm-4 goodOrBad_div like_bad text-left">
											<p class="goodOrBad">
												<span onclick="toggleLike(0)" class="GOB GOB2">흠~좀
													별로였어요;; </span>
											</p>
										</div>
									</div>
									<div class="mobdal_bottom_border">
										<div class="row text-center modal_charmingPoint_div">
											<div class="col-sm-4 col-sm-offset-4">매력포인트</div>
										</div>
										<div class="row modal_footer_row1">
											<div class="col-sm-2 col-sm-offset-1 text-center">
												<label class="checkbox-inline">
													<input type="checkbox" name="production" value="1" />감독연출
												</label>
											</div>
											<div class="col-sm-2 text-center">
											<label class="checkbox-inline">
												<input type="checkbox" name="story" value="1" />스토리
												</label>
											</div>
											<div class="col-sm-2 text-center">
											<label class="checkbox-inline">
												<input type="checkbox" name="beauty" value="1" />영상미
												</label>
											</div>
											<div class="col-sm-2 text-center">
											<label class="checkbox-inline">
												<input type="checkbox" name="actor" value="1" />배우연기
												</label>
											</div>
											<div class="col-sm-2 text-center">
											<label class="checkbox-inline"><input type="checkbox" name="ost" value="1" />O.S.T</label>
											</div>
										</div>
									</div>

									<div class="row modal_fotter_row">
										<div class="col-sm-12">
											<textarea placeholder="5글자 이상 입력해야 작성이 가능합니다." onkeyup="checkTextLength()" name="review_contents"
												id="modal_textcontents" cols="30" rows="3"></textarea>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button disabled="disabled" id="doneBtn" type="submit"
									class="btn btn-danger">작성완료!</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">취소</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- Modal End -->
			<button
				onclick="goMyGpa(event,${not empty LOGINMEMBER ? 1 : 2},'myMovieGpa');"
				class="btn btn-primary btn-sm GPA3_button GPA3_button_2">
				내 평점<span class="glyphicon glyphicon-play"></span>
			</button>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12 GPA4_1">
			<a href=""><strong>GOLDEN EGG지수 ?</strong></a>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-4 GPA4_2 text-center">
			<img src="/jf/photos/GREAT.PNG" alt="" class="GPA4_2_img"> <span
				class="GPA4_2_1">${currentMovie.goldenEgg}%</span>
		</div>
		<div class="col-sm-4 GPA4_3 text-center gpa_main_center_font">
			<div class="h2">${reviewsCountByMovie }
				<span class="h4">명의</span>
			</div>
			<span class="gpa_main_center_font"> <span class="cjPoint">CGV
					실관람객이</span> 평가해 주셨습니다.
			</span>
		</div>

		<div class="col-sm-4 GPA4_4">
			<div id="chart_div"></div>
		</div>
	</div>
	<div class="row GPA_main_3">
		<div class="col-sm-3">
			<div class="gpa_orders">
				<a id="orderByRecent" class="gpa_orders_span red"
					onclick="showReviews(event,1,${empty param.mno ? rank1movie : param.mno})"
					href="#"><span>최신순</span> <span class="space" id="space1"></span>
				</a>
			</div>
			<div class="theater_border_right_hr"></div>
			<div class="gpa_orders">
				<a class="gpa_orders_span" id="orderByGPA" href=""> <span
					onclick="showReviews(event,2,${empty param.mno ? rank1movie : param.mno})">평점순</span>
					<span class="space" id="space2"></span>
				</a>
			</div>
		</div>
	</div>
	<div id="GPA_main_4" class="row GPA_main_4"></div>
</div>
<script>
function goMyWatchedMovie(){
	var result = confirm("실관람객에 한하여 관람평 작성이 가능합니다.\n실관람객 페이지로 이동하시겠습니까?");
	if(result){
		location.href="/jf/member/watchedMovie.jf";
	}
}
document.getElementById("hiddenFrom").value = $('#forlikes-from').val();
var from = $('#forlikes-from').val();
var LOGINMEMBER = '${LOGINMEMBER}';
var movieNo = '${param.mno}';
function reviewOption(no){
	$('#deleteOrReport-div'+no).toggleClass('displayNoneClass');
}
function reportAlert(){
	if(LOGINMEMBER == ""){
		var result = confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?");
		if(result){
			location.href = '/jf/member/login.jf?from='+from+'&mno='+movieNo;
			return;
		}
	} else{
		var result = confirm("신고하시겠습니까?");
		if(result){
			alert("신고되었습니다");
		}
	}
	
}
var thumbno = Number('${thumbno}');
function deleteMyReview(myReviewNo){
	if(LOGINMEMBER == ""){
		var result = confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?");
		if(result){
			location.href = '/jf/member/login.jf?from='+from+'&mno='+movieNo+'&thumbno='+thumbno;
			return;
		}
	} else{
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var results = JSON.parse(xhr.responseText);
				if(results.isMyReview == 'Y'){
					var result = confirm("삭제하시겠습니까?");
					if(result){
						alert("삭제되었습니다.");
						location.href = ("/jf/member/process_removeReview.jf?rno="+myReviewNo+"&from="+from+"&thumbno="+thumbno);
					}
				} else{
					alert("자신이 쓴 글만 삭제할 수 있습니다.");	
				}
			}
	}
		xhr.open("GET","/jf/member/isMyReview.jf?rno="+myReviewNo);
	    xhr.send();
	}
}
function checkTextLength(){
	if($('#modal_textcontents').val().length < 5){
		$('#doneBtn').prop("disabled",true);
	} else{
		$('#doneBtn').prop("disabled",false);
	}
	
}
function showReviews(event,ono,mno,rno){
	var from = $('#forlikes-from').val();
	if (event) {
		event.preventDefault();
	}
	
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var reviews = JSON.parse(xhr.responseText);
			var htmlContent ="";
			
			for (var i=0; i<reviews.length; i++) {
				var review = reviews[i];
				htmlContent += '<div class="col-sm-6 GPA_main_4_detail ">';
				htmlContent += '<div class="row">';
				htmlContent += '<div class="col-sm-3">';
				htmlContent += '<img src="/jf/photos/profile.PNG" alt="">';
				htmlContent += '</div>';
				htmlContent += '<div class="col-sm-8 ">';
				htmlContent += '<div class="row">';
				htmlContent += '<div class="col-sm-1 GPA_main_4_1">';
				htmlContent += '<img class="gpa_small_egg" src="/jf/photos/GREAT.PNG" alt="">';
				htmlContent += '</div>';
				htmlContent += '<div class="col-sm-5">';
				htmlContent += '<span class="GPA_main_4_2_id">'+review.memberId+'</span>';
				htmlContent += '</div>';
				htmlContent += '</div>';
				htmlContent += '<div class="row"><div class="col-sm-12 "><div class="GPA_main_4_3_form"><span class="GPA_main_4_3_contents">'+review.rcomment+'</span></div>';
				htmlContent += '<div class="row"><div class="col-sm-3 GPA_main_4_3_date">'+review.createDate+'</div>';
				htmlContent += '<div class="col-sm-4 GPA_main_4_3_likes"><a title="좋아요"href="/jf/movie/updateReview.jf?reviewNo='+review.no+'&mno=${param.mno}&rno=${param.rno}&memberId=${LOGINMEMBER.id}&from='+from+'"><span class="glyphicon likes glyphicon-thumbs-up"></span>'+review.likes +'</a></div></div>';
				htmlContent += '</div></div></div>';
				htmlContent += '<div class="col-sm-1 GPA_main_4_3_glyphicon"><span onclick="reviewOption('+[i]+')" class="glyphicon glyphicon-option-vertical"></span>';
				htmlContent += '</div><div id="deleteOrReport-div'+[i]+'" class="displayNoneClass deleteOrReport"><div onclick="reportAlert()"><span class="glyphicon glyphicon-exclamation-sign"></span>해당 글 신고</div><div onclick="deleteMyReview('+review.no+')" ><span class="glyphicon glyphicon-remove-circle"></span>글 삭제하기</div></div>';
				htmlContent += '</div></div>';
			}
			document.getElementById("GPA_main_4").innerHTML = htmlContent;
			if(ono==1){
				$('#orderByRecent').addClass('red');
				$('#orderByGPA').removeClass('red');
				$('#space1').addClass('glyphicon glyphicon-chevron-down');
				$('#space2').removeClass('glyphicon glyphicon-chevron-down');
			} else if(ono ==2){
				$('#orderByGPA').addClass('red');
				$('#orderByRecent').removeClass('red');
				$('#space2').addClass('glyphicon glyphicon-chevron-down');
				$('#space1').removeClass('glyphicon glyphicon-chevron-down');
			}
			
			if(ono==0){
				$(".gpa_pagination_number").removeClass('active');
				var element = document.getElementById(rno);
				element.classList.add('active');
			} else{
				$(".gpa_pagination_number").removeClass('active');
				var element = document.getElementById(1);
				element.classList.add('active');
			}
		}
	}
	xhr.open("GET", "/jf/movie/ajaxReviews.jf?mno=" + mno +"&rno=" +rno+"&ono="+ono);
    xhr.send();
}

var movieNum = '${empty param.mno ? rank1movie : param.mno}';
showReviews(null, 1 , movieNum,1);

	function goWrite(movieNo,thumbno){
		if(LOGINMEMBER == ""){
    		var result = confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?");
    		if(result){
    			location.href = '/jf/member/login.jf?from='+from+'&mno='+movieNo+'&thumbno='+thumbno;
    			return;
    		}
		} else{
			location.href = 'movie/addreview.jf?mno='+movieNo;
		}
	}
</script>
