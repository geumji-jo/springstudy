<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%-- 		<c:forEach var="review" items="${reviews }">
 --%>			
 			<div class="col-sm-6 GPA_main_4_detail ">
				<div class="row" style="position : relative;">
					<div class="col-sm-3">
						<img src="/jf/photos/profile.PNG" alt="">
					</div>
					<div class="col-sm-8 ">
						<div class="row">
							<div class="col-sm-1 GPA_main_4_1">
								<img class="gpa_small_egg" src="/jf/photos/GREAT.PNG" alt="">
							</div>
							<div class="col-sm-5">
								<span class="GPA_main_4_2_id">${review.memberId }</span>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12 ">
								<div class="GPA_main_4_3_form">
									<span class="GPA_main_4_3_contents"> ${review.rcomment } </span>
								</div>

								<div class="row">
									<div class="col-sm-3 GPA_main_4_3_date">
										<fmt:formatDate value="${review.createDate }" />
									</div>
									<div class="col-sm-4 GPA_main_4_3_likes">
										<a title="좋아요"
											href="/jf/movie/updateReview.jf?reviewNo=${review.no }&mno=${param.mno}&rno=${param.rno}&memberId=${LOGINMEMBER.id}"><span
											class="glyphicon likes glyphicon-thumbs-up"></span>${review.likes }</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-1 GPA_main_4_3_glyphicon">
						<span onclick="reviewOption()" class="glyphicon glyphicon-option-vertical"></span>
					</div>
					
						<div class="deleteOrReport">
							<div><span></span>신고하기</div>
								
							<div><span></span>삭제하기</div>
						</div>
				</div>
			</div>
<%-- 		</c:forEach>
 --%>		
