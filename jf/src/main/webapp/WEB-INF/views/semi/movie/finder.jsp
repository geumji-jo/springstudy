<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>영화 &lt; 무비파인더 | 영화 그 이상의 감동. CGV</title>
<link rel="shortcut icon" href="/jf/photos/cj_logo.ico" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Nunito" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/jf/resources/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/jf/resources/bootstrap/css/chart.css">
    <link rel="stylesheet" href="/jf/resources/bootstrap/css/finder.css">
    <link rel="stylesheet" href="/jf/resources/bootstrap/css/main.css">
    <link rel="stylesheet" href="/jf/resources/bootstrap/css/GPA.css">
</head>
   <body>
    <!-- header -->
<%@include file="../../common/navigation.jsp" %>
    <!-- header -->
       
       <!-- finder -->
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="sect-finder">
        <h3 class="h3-title"><img style="margin-top:15px;" src="http://img.cgv.co.kr/R2014/images/title/h3_finder.png" alt="좋아하는 영화, 찾고싶은 영화를 CGV에서 찾아드립니다!"></h3>
        <form method="POST" action="/jf/movie/result.jf" id="frmMovieSearch" novalidate="novalidate">
            <fieldset>
                <legend>무비파인더 - 좋아하는 영화, 찾고싶은 영화를 CGV에서 찾아드립니다!</legend>
                <!-- checkbox ID 값과 label for값을 똑같이 한다 -->
                <table cellpadding="0" cellspacing="" summary="무비파인터 영화이름, 장르, 제작국가, 관람등급, 제작년도 를 통해 검색할수 있습니다.">
                    <colgroup>
                        <col class="finder-col01">
                        <col>
                    </colgroup>
                    <tbody>
                    <tr>
                        <th class="searchtype" scope="row">영화검색</th>
                        <td>
                        	<label class="hidden" for="keyword_type">영화검색 목록</label>
                            <select title="영화검색 목록" id="keyword_type">
                                <option value="0" selected="">전체</option>
                                <option value="1">영화제목</option>
                                <option value="2">주연배우</option>
                                <option value="3">감독</option>
                            </select>
                            <input type="text" name="keyword" title="영화검색 키워드입력" id="keyword" minlength="2" maxlength="20" style="width:410px;" placeholder="키워드를 입력해 주세요" value="">
                        </td>
                    </tr>
                    <tr>
                        <th class="genretype" scope="row">장르</th>
                        <td>
                            <ul>
        	                    <li><input type="checkbox" class="all_genre" name="all-genre" value="all"><label for="all_genre">전체</label></li>

                            

                                
                                    <li><input type="checkbox" class="genre" name="genre" value="가족"><label for="genre226">가족</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="호러"><label for="genre217">호러</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="드라마"><label for="genre723">드라마</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="SF"><label for="genre721">SF</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="멜로"><label for="genre1228">멜로</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="코미디"><label for="genre732">코미디</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="애니메이션"><label for="genre727">애니메이션</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="느와르"><label for="genre228">느와르</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="단편"><label for="genre223">단편</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="다큐멘터리"><label for="genre722">다큐멘터리</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="로드무비"><label for="genre1883">로드무비</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="무협"><label for="genre724">무협</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="뮤지컬"><label for="genre218">뮤지컬</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="뮤직"><label for="genre1884">뮤직</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="미스터리"><label for="genre219">미스터리</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="범죄"><label for="genre222">범죄</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="옴니버스"><label for="genre1885">옴니버스</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="서부"><label for="genre1886">서부</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="스릴러"><label for="genre725">스릴러</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="스포츠"><label for="genre1887">스포츠</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="시대극"><label for="genre726">시대극</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="아동"><label for="genre225">아동</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="액션"><label for="genre224">액션</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="어드벤처"><label for="genre728">어드벤처</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="역사"><label for="genre1888">역사</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="전기"><label for="genre1889">전기</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="전쟁"><label for="genre731">전쟁</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="종교"><label for="genre1890">종교</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="재난"><label for="genre1891">재난</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="청춘영화"><label for="genre1892">청춘영화</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="퀴어"><label for="genre1893">퀴어</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="환타지"><label for="genre227">환타지</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="학원물"><label for="genre1894">학원물</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="에로"><label for="genre729">에로</label></li>
                                
                                    <li><input type="checkbox" class="genre" name="genre" value="없음"><label for="genre1895">없음</label></li>
                                
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th class="maketype" scope="row">제작국가</th>
                        <td>
                            <ul>
                                <li><input type="checkbox" name="all-country" class="all_country"><label for="all_national_code">전체</label></li>
                                
                                    <li><input type="checkbox" class="country" name="country" value="한국"><label for="national_code_164">한국</label></li>
                                
                                    <li><input type="checkbox" class="country" name="country" value="미국"><label for="national_code_102">미국</label></li>
                                
                                    <li><input type="checkbox" class="country" name="country" value="일본"><label for="national_code_141">일본</label></li>
                                
                                    <li><input type="checkbox" class="country" name="country" value="중국"><label for="national_code_143">중국</label></li>
                                
                                    <li><input type="checkbox" class="country" name="country" value="홍콩"><label for="national_code_167">홍콩</label></li>
                                
                                    <li><input type="checkbox" class="country" name="country" value="프랑스"><label for="national_code_161">프랑스</label></li>
                                
                                    <li><input type="checkbox" class="country" name="country" value="영국"><label for="national_code_128">영국</label></li>
                                
                                    <li><input type="checkbox" class="country" name="country" value="독일"><label for="national_code_93">독일</label></li>
                                
                                    <li><input type="checkbox" class="country" name="country" value="인도"><label for="national_code_139">인도</label></li>
                                
                                    <li><input type="checkbox" class="country" name="country" value="기타"><label for="national_code_1000">기타</label></li>
                                
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th class="gradetype" scope="row">관람등급</th>
                        <td>
                            <ul>
                                <li><input type="checkbox" class="all_grade" name="all-grade" value=""><label for="all_grade">전체</label></li>
                                
                                    <li><input type="checkbox" class="grade" name="grade" value="0"><label for="grade233">전체관람가</label></li>
                                
                                    <li><input type="checkbox" class="grade" name="grade" value="12"><label for="grade230">12세 관람가</label></li>
                                
                                    <li><input type="checkbox" class="grade" name="grade" value="15"><label for="grade231">15세 관람가</label></li>
                                
                                    <li><input type="checkbox" class="grade" name="grade" value="18"><label for="grade232">청소년 관람불가</label></li>
                                
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th class="yeartype" scope="row"><label for="amount1">제작년도</label></th>
                        <td>
                            <input type="textarea" id="year_start" style="width:118px;" name="startDate" value="" maxlength="4" placeholder="시작년도"/> - 
                            <input type="textarea" id="year_end" style="width:118px;" name="endDate" value="" maxlength="4" placeholder="끝년도">  년
                        </td>
                    </tr>
                    </tbody>
                </table>
                    <div class="wrap-submit">
                    <button type="submit" class="round inred" id="btn_submit"><span>검색</span></button>
                    <button type="reset" class="round red" id="btn_reset" onclick = "location.href = '/jf/movie/finder.jf' "><span>초기화</span></button>
                </div>
            </fieldset>
        </form>
    </div>
            </div>
        </div>
    </div>
     
     

	
    <div class="container">
   
       <c:choose>

	       	<c:when test="${count eq '0' }">
		       		<div class="row">
	           <div class="col-sm-12 result-title">
	               <img src="http://img.cgv.co.kr/R2014/images/title/h3_search_results.gif"/>
	           </div>
	           <p style="text-align: center">아래의 선택조건에 해당하는 영화가 <strong>총 ${count }건</strong> 검색되었습니다.</p>
	       </div>
	       <div class="row">
	           <div class="col-sm-12">
	                  <dl class="spec">
	                      <dt>장르</dt>
	                      <dl>${finder.genre }</dl><br/>
	                      <dt>제작국가</dt>
	                      <dl>${finder.country }</dl><br/>
	                      <dt>전체 이용가</dt>
	                      <dl>${finder.age }</dl><br/>
	                      <dt>제작년도</dt>
	                      <dl>${finder.startDate }년 ~ ${finder.endDate }년</dl>
	                  </dl>
	           </div>
	       </div>
       
	       		<h1 class="text-center" style="font-size:20px;">검색결과가 없습니다.</h1>
	       	</c:when>
	       	
	       	
	       	<c:when test="${count eq null }">
            <div class="row" style="margin-top:40px;">
                <div class="col-sm-3">
				<h1 class="h1-title">무비차트</h1>
			</div>
		</div>
		<input type="hidden" id="hiddenvalue" value="">
		<div class="row movie-chart">
			<div class="col-sm-12 chart_main_top_row" style="text-align: right">
				<select name="sort" id="familysite"
					onchange="document.getElementById('hiddenvalue').value = this.options[this.selectedIndex].value">
					<!-- hidden 만들어서 값 -->
					<option value="1" ${param.sort eq '1' ? 'selected' : '' }>예매율순</option>
					<option value="2" ${param.sort eq '2' ? 'selected' : '' }>평점순</option>
					<option value="3" ${param.sort eq '3' ? 'selected' : '' }>관객순</option>
				</select>
				<button class="chart_main_top_row_button" type="button" title="새창"
					onclick="search()">GO</button>
			</div>
			<!-- sort 정렬 스크립트 -->
			<script>
                	function search() {
                		var sort = document.getElementById('hiddenvalue').value;
                		console.log("sort", sort);
                		location.href="finder.jf?sort=" + sort;
                	}
                </script>
			<!-- -------------- -->
			<div class="row chart-list">
				<div class="col-sm-3 list-content">
					<strong class="rank rank-first">NO.1</strong> <a
						href="/movies/detail-view/?midx=81749"> <span
						class="thumb-image"> <a
							href="/jf/movie/moviedetail.jf?mno=${rank1.no }"><img
								class="aa" src="/jf/photos/movieposters/${rank1.poster }"
								alt="어벤져스: 엔드게임 포스터"></a> <span
							class="ico-grade grade-${rank1.ageLimit }">${rank1.ageLimit }세
								이상</span>
					</span> <strong class="no1">1위</strong>
					</a>
					<div class="box-contents">
						<div class="row">
							<div class="col-sm-12 chart_movie_title_div">
								<a class="chart_movie_title" href=""> <strong class="title">${rank1.korTitle }</strong>
								</a>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<div class="score chart_score">
									<span class="percent">예매율<span>${rank1.reservationRate }%</span></span>
									<div class="egg-gage small">
										<span class="egg great"></span> <span class="percent">${rank1.goldenEgg }%</span>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<span class="txt-info"> <span> <fmt:formatDate
											value="${rank1.releaseDate }" pattern="yyyy-MM-dd" /> <span>개봉</span>
								</span>
								</span>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12 gpa_thumbnail_bottom_div">
								<div class="likes" id="">
									<c:set var="wish" value="wishEmpty" />
									<c:forEach var="wishList" items="${wishLists }">
										<c:if test="${wishList.movieNo eq rank1.no }">
											<c:set var="wish" value="wishExist" />
										</c:if>
									</c:forEach>
									<c:choose>
										<c:when test="${wish eq 'wishEmpty' }">
											<a 
												class="gpa_reservation_a chart_gpa_reservation_a ${(empty param.mno ? rank1movie : param.mno) eq rank1.no ? 'thumbnail_active' : '' }"
												href="#" onclick="goWish(event, ${rank1.no })"> <span
												class="glyphicon glyphicon-heart chart_glyphicon_heart"></span>
												<span style="border:1px solid gray; color:gray;"
												class="gpa_wishListCount ${(empty param.mno ? rank1.no : param.mno) eq rank1.no ? 'likes_active' : '' }">${rank1.wishList }</span>
											</a>
										</c:when>
										<c:otherwise>
											<a
												class="gpa_reservation_a chart_gpa_reservation_a ${(empty param.mno ? rank1.no : param.mno) eq rank1.no ? 'thumbnail_active' : '' }"
												href="process_removeWishList?mno=${rank1.no }"
												onclick="goWishRemove(event, ${rank1.no})"> <span
												class="glyphicon glyphicon-heart red chart_glyphicon_heart"></span>
												<span style="border:1px solid gray; color:gray;"
												class="gpa_wishListCount ${(empty param.mno ? rank1.no : param.mno) eq movie.no ? 'likes_active' : '' }">${rank1.wishList }</span>
											</a>
										</c:otherwise>
									</c:choose>
									
									<span class="gpa_reservation_span"> <a href="../reservation/reservation.jf?mno=${rank1.no }"><img
											class="chart_resv_img"
											src="/jf/photos/reservationImg2.PNG" alt="" /></a>
									</span>
									<script>
											function heartClick(){
												if (confirm("위시리스트에 등록 되었습니다. 위시리스트 페이지로 이동하시겠습니까?") == true){    //확인
													location.href = "/jf/member/process_addWishList.jf?mno=${movie.no}";
												} else{   //취소
													location.href = "/jf/member/gpa.jsp?mno=${param.mno}&rno=${param.rno}";
												    return;
												}
											}
									</script>
								</div>
							</div>

						</div>
					</div>
				</div>
				<c:forEach var="m" begin="0" end="100" varStatus="status"
					items="${movies }">
					<div class="col-sm-3 list-content">
						<strong class="rank">NO.${status.index+2}</strong> <a
							href="/movies/detail-view/?midx=81745"> <span
							class="thumb-image"> <a
								href="/jf/movie/moviedetail.jf?mno=${m.no }"><img class="aa"
									src="/jf/photos/movieposters/${m.poster }" alt="${m.poster }"></a>
								<span class="ico-grade grade-${m.ageLimit }">청소년 관람불가</span>
						</span>
						</a>
						<div class="box-contents">
						<div class="row">
							<div class="col-sm-12 chart_movie_title_div">
								<a class="chart_movie_title" href="/jf/movie/moviedetail.jf?mno=${m.no }"> <strong class="title">${m.korTitle }</strong>
								</a>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<div class="score chart_score">
									<span class="percent">예매율<span>${m.reservationRate }%</span></span>
									<div class="egg-gage small">
										<span class="egg great"></span> <span class="percent">${m.goldenEgg }%</span>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<span class="txt-info"> <span> <fmt:formatDate
											value="${m.releaseDate }" pattern="yyyy-MM-dd" /> <span>개봉</span>
								</span>
								</span>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12 gpa_thumbnail_bottom_div">
								<div class="likes" id="">
									<c:set var="wish" value="wishEmpty" />
									<c:forEach var="wishList" items="${wishLists }">
										<c:if test="${wishList.movieNo eq m.no }">
											<c:set var="wish" value="wishExist" />
										</c:if>
									</c:forEach>
									<c:choose>
										<c:when test="${wish eq 'wishEmpty' }">
											<a 
												class="gpa_reservation_a chart_gpa_reservation_a"
												href="#" onclick="goWish(event, ${m.no })"> <span
												class="glyphicon glyphicon-heart chart_glyphicon_heart"></span>
												<span style="border:1px solid gray; color:gray;"
												class="gpa_wishListCount">${m.wishList }</span>
											</a>
										</c:when>
										<c:otherwise>
											<a
												class="gpa_reservation_a chart_gpa_reservation_a"
												href="process_removeWishList?mno=${m.no }"
												onclick="goWishRemove(event, ${m.no})"> <span
												class="glyphicon glyphicon-heart red chart_glyphicon_heart"></span>
												<span style="border:1px solid gray;  color:gray;"
												class="gpa_wishListCount">${m.wishList }</span>
											</a>
										</c:otherwise>
									</c:choose>
									
									<span class="gpa_reservation_span"> <a href="../reservation/reservation.jf?mno=${m.no }"><img
											class="chart_resv_img"
											src="/jf/photos/reservationImg2.PNG" alt="" /></a>
									</span>
									<script>
											function heartClick(){
												if (confirm("위시리스트에 등록 되었습니다. 위시리스트 페이지로 이동하시겠습니까?") == true){    //확인
													location.href = "/jf/member/process_addWishList.jf?mno=${movie.no}";
												} else{   //취소
													location.href = "/jf/member/gpa.jsp?mno=${param.mno}&rno=${param.rno}";
												    return;
												}
											}
									</script>
								</div>
							</div>

						</div>
					</div>
					</div>
				</c:forEach>
			</div>
			</div>
	       	</c:when>
	       	
	       	<c:otherwise>
	       	<div class="row">
            	<div class="col-sm-12 result-title">
               		<img src="http://img.cgv.co.kr/R2014/images/title/h3_search_results.gif"/>
          	    </div>
         	    <p style="text-align: center">아래의 선택조건에 해당하는 영화가 <strong>총 ${count }건</strong> 검색되었습니다.</p>
      		 </div>
	        <div class="row">
	           <div class="col-sm-12">
	                  <dl class="spec">
	                      <dt>장르</dt>
	                      <dl>${finder.genre }</dl><br/>
	                      <dt>제작국가</dt>
	                      <dl>${finder.country }</dl><br/>
	                      <dt>전체 이용가</dt>
	                      <dl>${finder.age }</dl><br/>
	                      <dt>제작년도</dt>
	                      <dl>${finder.startDate }년 ~ ${finder.endDate }년</dl>
	                  </dl>
	           </div>
	        </div>
	       	<div class="row result-chart">
	           <div class="col-sm-12">
	
	           <c:forEach var="finders" items="${finderMovies }" begin="0" end="100" varStatus="status">
					<div class="col-sm-3 list-content">
						<strong class="rank">NO.${status.index+1}</strong> <a
							href="/movies/detail-view/?midx=81745"> <span
							class="thumb-image"> <a
								href="/jf/movie/moviedetail.jf?mno=${finders.no }"><img class="aa"
									src="/jf/photos/movieposters/${finders.poster }" style="width: 227.5px; height: 300.75px;"alt="${finders.poster }"></a>
								<span class="ico-grade grade-${finders.ageLimit }">청소년 관람불가</span>
						</span>
						</a>
						<div class="box-contents">
						<div class="row">
							<div class="col-sm-12 chart_movie_title_div">
								<a class="chart_movie_title" href="/jf/movie/moviedetail.jf?mno=${finders.no }"> <strong class="title">${finders.korTitle }</strong>
								</a>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<div class="score chart_score">
									<span class="percent">예매율<span>${finders.reservationRate }%</span></span>
									<div class="egg-gage small">
										<span class="egg great"></span> <span class="percent">${finders.goldenEgg }%</span>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<span class="txt-info"> <span> <fmt:formatDate
											value="${finders.releaseDate }" pattern="yyyy-MM-dd" /> <span>개봉</span>
								</span>
								</span>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12 gpa_thumbnail_bottom_div">
								<div class="likes" id="">
									<c:set var="wish" value="wishEmpty" />
									<c:forEach var="wishList" items="${wishLists }">
										<c:if test="${wishList.movieNo eq finders.no }">
											<c:set var="wish" value="wishExist" />
										</c:if>
									</c:forEach>
									<c:choose>
										<c:when test="${wish eq 'wishEmpty' }">
											<a 
												class="gpa_reservation_a chart_gpa_reservation_a"
												href="#" onclick="goWish(event, ${finers.no })"> <span
												class="glyphicon glyphicon-heart chart_glyphicon_heart"></span>
												<span style="border:1px solid gray; color:gray;"
												class="gpa_wishListCount">${finders.wishList }</span>
											</a>
										</c:when>
										<c:otherwise>
											<a
												class="gpa_reservation_a chart_gpa_reservation_a"
												href="process_removeWishList?mno=${finders.no }"
												onclick="goWishRemove(event, ${finders.no})"> <span
												class="glyphicon glyphicon-heart red chart_glyphicon_heart"></span>
												<span style="border:1px solid gray;  color:gray;"
												class="gpa_wishListCount">${finders.wishList }</span>
											</a>
										</c:otherwise>
									</c:choose>
									<c:if test="${finders.screenYn eq 'Y' }">
										<span class="gpa_reservation_span"> <a href="../reservation/reservation.jf?mno=${finders.no }"><img
												class="chart_resv_img"
												src="/jf/photos/reservationImg2.PNG" alt="" /></a>
										</span>
									</c:if>
									<script>
											function heartClick(){
												if (confirm("위시리스트에 등록 되었습니다. 위시리스트 페이지로 이동하시겠습니까?") == true){    //확인
													location.href = "/jf/member/process_addWishList.jf?mno=${movie.no}";
												} else{   //취소
													location.href = "/jf/member/gpa.jsp?mno=${param.mno}&rno=${param.rno}";
												    return;
												}
											}
									</script>
								</div>
							</div>

						</div>
					</div>
					</div>
	           </c:forEach>
	           
	                
	           </div>
	       </div>
	       	</c:otherwise>
       </c:choose>
       
    </div>

    
	
	<script>
	    function goWish(event, movieNo) {
	    	event.preventDefault();
	    	if(${empty LOGINMEMBER}){
	    		var result = confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?");
	    		if(result){
	    			location.href = '/jf/member/login.jf?result';
	    			return;
	    		}
	    	} else{
		    	var result = confirm("위시리스트에 등록하고 위시리스트로 이동하시겠습니까?");
		    	if (result) {
		    		location.href = '/jf/member/process_addNewWishList.jf?mno=' + movieNo;
		    	}
	    	}
	    }
	    function goWishRemove(event,movieNo){
	    	event.preventDefault();
	    	location.href = '/jf/member/process_removeWishListinChart.jf?mno=' + movieNo;
			alert('위시리스트에서 삭제되었습니다.');
	    }
	</script>


              


		<!--  footer -->
<%@include file="../../common/footer.jsp" %>

	<script>
	      $( document ).ready( function() {
	        $( '.all_genre' ).click( function() {
	          $( '.genre' ).prop( 'checked', this.checked );
	        } );
	      } );
	      
	      $( document ).ready( function() {
		        $( '.all_grade' ).click( function() {
		          $( '.grade' ).prop( 'checked', this.checked );
		        } );
		      } );
	      
	      $( document ).ready( function() {
		        $( '.all_country' ).click( function() {
		          $( '.country' ).prop( 'checked', this.checked );
		        } );
		      } );
    </script>
    </body>
</html>