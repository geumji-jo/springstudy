<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:choose>
	<c:when test="${not empty screenings }">
		<c:forEach var="screen" items="${screenings }">
			<div class="movie_showing_time_div">
				<div class="row">
					<div class="col-sm-1">
						<img class="theater_screening_image1"
							src="/jf/photos/theater_age_${screen.ageLimit }.PNG" alt="">
					</div>
					<div class="col-sm-11 thater_movie_bottom_infotable">
						<span class="theater_bottom_movieName"><a
							href="/jf/movie/moviedetail.jf?mno=${screen.movieNo }">${screen.movieName }</a></span>
						<img class="theater_screening_image2"
							src="/jf/photos/theater_movie_showing.PNG" alt=""> <span
							class="theater_bottom_movieInfo"> ${screen.genre }/
							${screen.runningTime }분/ ${screen.releaseDate } 개봉 </span>
						<!--                                2d 1관 1층, 밑에 시간표 1줄 시작-->
						<c:forEach var="room" items="${screen.rooms}">
							<div class="row thater_movie_bottom_infotable_2">
								<div class="col-sm-12 thater_movie_bottom_infotable_2_1">
									<span class="glyphicon glyphicon-play"></span> ${room.roomNo }관
									<div class="theater_border_right_hr"></div>
									총 ${room.totalSeat }석


									<div class="theater_border_right_hr"></div>
								</div>
								<div class="col-sm-10 theater_movie_timetable_div">
									<!-- 상영시간 반복 시작  -->
									<c:forEach var="roomDetail" items="${room.roomDetail}">
										<a href="">
											<div class="theater_movie_timetable">
												<div class="theater_movie_timetable_1">${roomDetail.times}</div>
												<div class="theater_movie_timetable_2">${roomDetail.leftSeat }석</div>
											</div>
										</a>
									</c:forEach>
									<!-- 상영시간 반복 끝 -->
								</div>
							</div>
						</c:forEach>
						<!--                                    2d 1관 1층, 밑에 시간표 1줄 끝-->

					</div>
				</div>
				<hr class="theater_bottom_timetable_hr_4">
			</div>
		</c:forEach>
	</c:when>
</c:choose>