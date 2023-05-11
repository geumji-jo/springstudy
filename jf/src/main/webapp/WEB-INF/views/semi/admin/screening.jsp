<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Bootstrap Example</title>
  <link rel="shortcut icon" href="/jf/photos/cj_logo.ico" />
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="/jf/resources/bootstrap/js/jquery.min.js"></script>
  <script src="/jf/resources/bootstrap/js/bootstrap.min.js"></script>
  
</head>
<body  style="background-color: #fdfcf0;">
	<%@include file="../../common/admin.jsp"%>
	<div class="container">
		<div class="page-header">
			<div style="margin-top: 40px;">
			    <FONT face="Impact" style="font-size: 50px;">
					Screening
				</FONT>
	   		</div>
		</div>
		
		<div class="well">
			<form method="post" action="screeninginsert.jf">
				<div class="form-group ">
					<label>영화관 선택</label>
					<select class="form-control" name="theater" onchange="getRooms(this.value)" id="theater-box">
						<option value="">극장 선택</option>
						<c:forEach var="theater" items="${theaters }">
		                    <option value="${theater.no}">${theater.name }</option>
						</c:forEach>
	                </select>
				</div>
				<div class="form-group">
					<label>상영관 선택</label>
					<select class="form-control" name="screeningroom" id="hiddenRooms">
						<option value="">상영관 선택</option>
					</select>
				</div>
				<div class="form-group">
					<label>영화선택</label>
					<input disabled="disabled" type="text" class="form-control" name="movie" value="${movie.korTitle}"/>
					<input type="hidden" class="form-control" name="movieNo" value="${movie.no}"/>
				</div>
				<div class="form-group">
					<label>상영일</label>
					<input type="date" class="form-control" name="screeningDate"/>
				</div>
				<div class="form-group">
					<label>상영시간(TIME)</label>
					<input type="text" class="form-control" name="time" value=":"/>
				</div>
				<div class="text-right">
					<input type="submit" class="btn btn-primary" value="등록"/>
				</div>
				
			</form>
		</div>
	</div>
	<%@include file="../../common/footer.jsp" %>
	<script type="text/javascript">
		
		function getRooms(value) {
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if(xhr.readyState == 4 && xhr.status == 200) {
					var rooms = JSON.parse(xhr.responseText);
					console.log(rooms);
					var htmlContents = "";
											
					for(var i=0; i<rooms.length; i++){
						var room = rooms[i];
						htmlContents += '<option value="' + room.no + '" selected="selected">' + room.name +'</option>';
					}
					document.getElementById('hiddenRooms').innerHTML = htmlContents;
				}
			}
				xhr.open("GET", "/jf/admin/screening1.jf?tno="+ value);
				xhr.send();
		}
		
	</script>
</body>
</html>