<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 캐러셀 시작-->
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
          <!-- Indicators -->
          <ol class="carousel-indicators">
          </ol>
          <!-- Wrapper for slides -->
          <div class="carousel-inner" role="listbox">
            <div class="item active ">
              	<c:forEach var="movie" items="${movies }">
				<div class="col-sm-3 imgs">
					<div class="thumbnail ${(empty param.mno ? rank1movie : param.mno) eq movie.no ? \'thumbnail_active\' : \'\' }">
						<a href="#"onclick="changeThumnail(event,${movie.no})"><img
							class="GPA_main_posterimgs"
							src="/jf/photos/movieposters/${movie.poster }" style=""></a>
						<div class="caption">
							<h4 class=""
								id="${(empty param.mno ? rank1movie : param.mno) eq movie.no ? \'thumbnail_active\' : \'\' }">${movie.korTitle}</h4>
							<p class=""
								id="${(empty param.mno ? rank1movie : param.mno) eq movie.no ? \'thumbnail_active\' : \'\' }">예매율:${movie.reservationRate }%</p>
							<p class=""
								id="${(empty param.mno ? rank1movie : param.mno) eq movie.no ? \'thumbnail_active\' : \'\' }">
								<fmt:formatDate value="${movie.releaseDate }" />
								개봉
							</p>
							<div class="row">
								<div class="col-sm-12 gpa_thumbnail_bottom_div">
									<div class="likes" id="${(empty param.mno ? rank1movie : param.mno) eq movie.no ? \'thumbnail_active\' : \'\' }">
										<c:set var="wish" value="wishEmpty" />
										<c:forEach var="wishList" items="${wishLists }">
											<c:if test="${wishList.movieNo eq movie.no }">
												<c:set var="wish" value="wishExist" />
											</c:if>
										</c:forEach>
										<c:choose>
											<c:when test="${wish eq 'wishEmpty' }">
												<a
													class="gpa_reservation_a ${(empty param.mno ? rank1movie : param.mno) eq movie.no ? \'thumbnail_active\' : \'\' }"
													href="#" onclick="goWish(event, ${movie.no })"> <span
													class="glyphicon glyphicon-heart gpa_glyphicon_heart"></span>
													<span
													class="gpa_wishListCount ${(empty param.mno ? rank1movie : param.mno) eq movie.no ? 'likes_active' : '' }">${movie.wishList }</span>
												</a>
											</c:when>
											<c:otherwise>
												<a
													class="gpa_reservation_a ${(empty param.mno ? rank1movie : param.mno) eq movie.no ? \'thumbnail_active\' : \'\' }"
													href="process_removeWishList?mno=${movie.no }"
													onclick="goWishRemove(event, ${movie.no})"> <span
													class="glyphicon glyphicon-heart red gpa_glyphicon_heart"></span>
													<span
													class="gpa_wishListCount ${(empty param.mno ? rank1movie : param.mno) eq movie.no ? 'likes_active' : '' }">${movie.wishList }</span>
												</a>
											</c:otherwise>
										</c:choose>
										<span class="gpa_reservation_span"> <a
											href="/jf/reservation/reservation.jf?mno=${movie.no }"><img
												class="gpa_reservationImg"
												src="/jf/photos/reservationImg2.PNG" alt="" /></a>
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
            </div>
            <div class="item ">
              	<c:forEach var="movie" items="${movies2 }">
				<div class="col-sm-3 imgs">
					<div class="thumbnail ${(empty param.mno ? rank1movie : param.mno) eq movie.no ? \'thumbnail_active\' : \'\' }">
						<a href="gpa.jf?mno=${movie.no }&rno=1"><img
							class="GPA_main_posterimgs"
							src="/jf/photos/movieposters/${movie.poster }" style=""></a>
						<div class="caption">
							<h4 class=""
								id="${(empty param.mno ? rank1movie : param.mno) eq movie.no ? \'thumbnail_active\' : \'\' }">${movie.korTitle}</h4>
							<p class=""
								id="${(empty param.mno ? rank1movie : param.mno) eq movie.no ? \'thumbnail_active\' : \'\' }">예매율:${movie.reservationRate }%</p>
							<p class=""
								id="${(empty param.mno ? rank1movie : param.mno) eq movie.no ? \'thumbnail_active\' : \'\' }">
								<fmt:formatDate value="${movie.releaseDate }" />
								개봉
							</p>
							<div class="row">
								<div class="col-sm-12 gpa_thumbnail_bottom_div">
									<div class="likes" id="${(empty param.mno ? rank1movie : param.mno) eq movie.no ? \'thumbnail_active\' : \'\' }">
										<c:set var="wish" value="wishEmpty" />
										<c:forEach var="wishList" items="${wishLists }">
											<c:if test="${wishList.movieNo eq movie.no }">
												<c:set var="wish" value="wishExist" />
											</c:if>
										</c:forEach>
										<c:choose>
											<c:when test="${wish eq 'wishEmpty' }">
												<a
													class="gpa_reservation_a ${(empty param.mno ? rank1movie : param.mno) eq movie.no ? \'thumbnail_active\' : \'\' }"
													href="#" onclick="goWish(event, ${movie.no })"> <span
													class="glyphicon glyphicon-heart gpa_glyphicon_heart"></span>
													<span
													class="gpa_wishListCount ${(empty param.mno ? rank1movie : param.mno) eq movie.no ? 'likes_active' : '' }">${movie.wishList }</span>
												</a>
											</c:when>
											<c:otherwise>
												<a
													class="gpa_reservation_a ${(empty param.mno ? rank1movie : param.mno) eq movie.no ? \'thumbnail_active\' : \'\' }"
													href="process_removeWishList?mno=${movie.no }"
													onclick="goWishRemove(event, ${movie.no})"> <span
													class="glyphicon glyphicon-heart red gpa_glyphicon_heart"></span>
													<span
													class="gpa_wishListCount ${(empty param.mno ? rank1movie : param.mno) eq movie.no ? 'likes_active' : '' }">${movie.wishList }</span>
												</a>
											</c:otherwise>
										</c:choose>
										<span class="gpa_reservation_span"> <a
											href="/jf/reservation/reservation.jf?mno=${movie.no }"><img
												class="gpa_reservationImg"
												src="/jf/photos/reservationImg2.PNG" alt="" /></a>
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
            </div>
            <div class="item ">
              	<c:forEach var="movie" items="${movies3 }">
				<div class="col-sm-3 imgs">
					<div
						class="thumbnail ${(empty param.mno ? rank1movie : param.mno) eq movie.no ? \'thumbnail_active\' : \'\' }">
						<a href="gpa.jf?mno=${movie.no }&rno=1"><img
							class="GPA_main_posterimgs"
							src="/jf/photos/movieposters/${movie.poster }" style=""></a>
						<div class="caption">
							<h4 class=""
								id="${(empty param.mno ? rank1movie : param.mno) eq movie.no ? \'thumbnail_active\' : \'\' }">${movie.korTitle}</h4>
							<p class=""
								id="${(empty param.mno ? rank1movie : param.mno) eq movie.no ? \'thumbnail_active\' : \'\' }">예매율:${movie.reservationRate }%</p>
							<p class=""
								id="${(empty param.mno ? rank1movie : param.mno) eq movie.no ? \'thumbnail_active\' : \'\' }">
								<fmt:formatDate value="${movie.releaseDate }" />
								개봉
							</p>
							<div class="row">
								<div class="col-sm-12 gpa_thumbnail_bottom_div">
									<div class="likes"
										id="${(empty param.mno ? rank1movie : param.mno) eq movie.no ? \'thumbnail_active\' : \'\' }">
										<c:set var="wish" value="wishEmpty" />
										<c:forEach var="wishList" items="${wishLists }">
											<c:if test="${wishList.movieNo eq movie.no }">
												<c:set var="wish" value="wishExist" />
											</c:if>
										</c:forEach>
										<c:choose>
											<c:when test="${wish eq 'wishEmpty' }">
												<a
													class="gpa_reservation_a ${(empty param.mno ? rank1movie : param.mno) eq movie.no ? \'thumbnail_active\' : \'\' }"
													href="#" onclick="goWish(event, ${movie.no })"> <span
													class="glyphicon glyphicon-heart gpa_glyphicon_heart"></span>
													<span
													class="gpa_wishListCount ${(empty param.mno ? rank1movie : param.mno) eq movie.no ? 'likes_active' : '' }">${movie.wishList }</span>
												</a>
											</c:when>
											<c:otherwise>
												<a
													class="gpa_reservation_a ${(empty param.mno ? rank1movie : param.mno) eq movie.no ? \'thumbnail_active\' : \'\' }"
													href="process_removeWishList?mno=${movie.no }"
													onclick="goWishRemove(event, ${movie.no})"> <span
													class="glyphicon glyphicon-heart red gpa_glyphicon_heart"></span>
													<span
													class="gpa_wishListCount ${(empty param.mno ? rank1movie : param.mno) eq movie.no ? 'likes_active' : '' }">${movie.wishList }</span>
												</a>
											</c:otherwise>
										</c:choose>
										<span class="gpa_reservation_span"> <a
											href="/jf/reservation/reservation.jf?mno=${movie.no }"><img
												class="gpa_reservationImg"
												src="/jf/photos/reservationImg2.PNG" alt="" /></a>
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
            </div>

          </div>
          <!-- Controls -->
          <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
<!-- 캐러셀 끝-->