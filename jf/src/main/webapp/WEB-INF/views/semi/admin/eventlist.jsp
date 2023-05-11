<%@page import="kr.co.hta.vo.Event"%>
<%@page import="kr.co.hta.movies.dao.EventDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="bootstrap-3.3.2-dist/js/jquery.min.js"></script>
  <script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #fdfcf0;">
	<%@include file="../../common/admin.jsp"%>
	<div class="container">
        <div class="text-center">
            <div style="margin-top: 40px; margin-bottom: 40px;">
			    <FONT face="Impact" style="font-size: 50px;">
					EVENT
				</FONT>
   			</div>
        </div>
        <div>
	     	<c:choose>
		        <c:when test="${not empty events}">
		      		<div class="row" style="border-bottom: 1px solid; ">
			       		<c:forEach var="event" items="${events }">
				            <div class="col-sm-3 text-center" >
				            	<div>
			                        <br/>
				                    <a href="">
				                        <span >
				                            <img style="height: 300px; width: 200px;" src="/jf/photos/eventPhotos/${event.imgName }"/>
				                        </span>
				                    </a>
				            	</div>
			                        <br/>
				            	<div>
			                        <span>[${event.category }]</span>
			                        <br/>
				                    <a href="" style="color:black;">
				                        <span>${event.title }</span>
				                    </a>
				                    <div>
				                       <p> <fmt:parseDate value="${event.startDate }" var="startDate" pattern="yyyy-mm-dd"/></p>
				                       <p> <fmt:parseDate value="${event.endDate }" var="endDate" pattern="yyyy-mm-dd"/></p>
				                       <p> <fmt:formatDate value="${startDate }"/> ~ <fmt:formatDate value="${startDate }"/></p>
				                    </div>
			                        <br/>
			                        <br/>
				           		</div>
				            </div>
				        </c:forEach>
			        </div>
	    	    </c:when>
	       		<c:otherwise>
			        <tr>
			  			<td colspan="5" class="text-center">조회된 글이 없습니다.</td>
			        </tr>
			    </c:otherwise>
	        </c:choose>
        </div>
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
                            <a href="screening.jf?mno=${movie.no }" class="btn btn-success">상영등록</a>
                        </div>
                        <br>
                    </div>
                </c:forEach>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="text-center" >
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
    </div>
    <%@include file="../../common/footer.jsp" %> 
      <script>
      function sendform1(pno) {
         /* document.getElementById("page-no").value = pno; */
         location.href ='http://localhost/jf/admin/eventlist.jf?pno='+pno;
         /* document.getElementById("list-form").submit(); */
      }
      
      function goPage(event, pno) {
         event.preventDefault();   
         sendform1(pno);
      }  
    </script>      
</body>
</html>