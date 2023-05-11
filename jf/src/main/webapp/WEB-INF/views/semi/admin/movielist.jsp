<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/jf/resources/bootstrap/css/bootstrap.min.css">
    <script src="/jf/resources/bootstrap/js/jquery.min.js"></script>
    <script src="/jf/resources/bootstrap/css/bootstrap.min.css"></script>
</head>

<body style="background-color: #fdfcf0; ">
    <div>
        <%@include file="../../common/admin.jsp"%>
        </div>
        <div class="container text-center">
            <div style="margin-top: 40px; margin-bottom: 40px;">
                <FONT face="Impact" style="font-size: 50px;">
                    MovieList
                </FONT>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-sm-12 text-right">
                <form action="movielist.jf" class="form-inline">
                    <select name="opt" style="height:28px;">
                        <option value="korTitle" ${param.opt eq 'movie_kortitle' ? 'selected' : '' }> 영화제목</option>
                        <option value="director" ${param.opt eq 'movie_director' ? 'selected' : '' }>감독이름</option>
                        <option value="actors" ${param.opt eq 'movie_actors' ? 'selected' : '' }>배우이름</option>
                    </select>
                    <input type="hidden" name="pno" value="1" />
                    <input id="searchtext" type="text" class="c_input" title="검색어 입력" placeholder="검색어 입력" name="keyword" style="width:185px; padding-top:3px;" value="">
                    <button type="submit" class="btn" id="btn_header_search">검색하기</button>
                </form>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-sm-12">
                <c:forEach var="movie" items="${movies}">
                    <div class="col-sm-3 img-box text-center " style="height: 400px;">
                        <img src="/jf/photos/movieposters/${movie.poster }" class="img-thumbnail" style="width:200px; height:280px;" />
                        <div class="caption">

                            <h4 style="letter-spacing:-1.7px;">${movie.korTitle }</h4>
                            <p class="text">
                                <small>
                                    <fmt:formatDate value="${movie.releaseDate }" /></small>
                            </p>
                        </div>
                        <div>
                            <a href="movieupdateform.jf?mno=${movie.no }&pno=${param.pno }" class="btn btn-success">수정</a>
                            <a href="closemovie.jf?mno=${movie.no }&pno=${param.pno }" class="btn btn-danger">종료</a>
                        </div>
                        <br>
                    </div>
                </c:forEach>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-sm-12 text-center">
                <ul class="pagination">
		            <c:if test="${not pagination.first }">
		               <li><a href="#" onclick="goPage(event, ${pagination.page - 1})">prev</a></li>
		            </c:if>
		         
		            <c:forEach var="num" begin="${pagination.begin }" end="${pagination.end }">
		               <c:choose>
		                  <c:when test="${num eq pagination.page }">
		                     <li class="active"><a href="#" onclick="goPage(event, ${num})">${num }</a></li>
		                  </c:when>
		                  <c:otherwise>
		                     <li><a href="#" onclick="goPage(event, ${num})">${num }</a></li>
		                  </c:otherwise>
		               </c:choose>
		            </c:forEach>
		         
		            <c:if test="${not pagination.last }">
		               <li><a href="#" onclick="goPage(event, ${pagination.page + 1})">next</a></li>
		            </c:if>
		            
		         </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 text-right">
                <a href="movieform.jf" class="btn btn-primary">등록</a>
            </div>
            <hr>
            <hr>
        </div>
    </div>
    <script>
      function sendform1(pno) {
         /* document.getElementById("page-no").value = pno; */
         location.href ='http://localhost/jf/admin/movielist.jf?pno='+pno;
         /* document.getElementById("list-form").submit(); */
      }
      
      function goPage(event, pno) {
         event.preventDefault();   
         sendform1(pno);
      }  
    </script>
</body>

</html>