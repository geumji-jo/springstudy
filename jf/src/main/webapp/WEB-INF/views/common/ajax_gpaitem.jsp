<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

				<div class="caption">
							<h4 class=""
								id="${(empty param.mno ? rank1movie : param.mno) eq movie.no ? 'thumbnail_active' : '' }">${movie.korTitle}</h4>
							<p class=""
								id="${(empty param.mno ? rank1movie : param.mno) eq movie.no ? 'thumbnail_active' : '' }">예매율:${movie.reservationRate }%</p>
							<p class=""
								id="${(empty param.mno ? rank1movie : param.mno) eq movie.no ? 'thumbnail_active' : '' }">
								<fmt:formatDate value="${movie.releaseDate }" />
								개봉
							</p>
							<div class="row">
								<div class="col-sm-12 gpa_thumbnail_bottom_div">
									<div class="likes"
										id="${(empty param.mno ? rank1movie : param.mno) eq movie.no ? 'thumbnail_active' : '' }">
										<c:set var="wish" value="wishEmpty" />
										<c:forEach var="wishList" items="${wishLists }">
											<c:if test="${wishList.movieNo eq movie.no }">
												<c:set var="wish" value="wishExist" />
											</c:if>
										</c:forEach>
										<c:choose>
											<c:when test="${wish eq 'wishEmpty' }">
												<a
													class="gpa_reservation_a ${(empty param.mno ? rank1movie : param.mno) eq movie.no ? 'thumbnail_active' : '' }"
													href="#" onclick="goWish(event, ${movie.no })"> <span
													class="glyphicon glyphicon-heart gpa_glyphicon_heart"></span>
													<span
													class="gpa_wishListCount ${(empty param.mno ? rank1movie : param.mno) eq movie.no ? 'likes_active' : '' }">${movie.wishList }</span>
												</a>
											</c:when>
											<c:otherwise>
												<a
													class="gpa_reservation_a ${(empty param.mno ? rank1movie : param.mno) eq movie.no ? 'thumbnail_active' : '' }"
													href="process_removeWishList?mno=${movie.no }"
													onclick="goWishRemove(event, ${movie.no})"> <span id=""
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