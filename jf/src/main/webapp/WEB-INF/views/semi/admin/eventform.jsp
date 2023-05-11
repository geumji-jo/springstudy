<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Bootstrap Example</title>
  <link rel="shortcut icon" href="/jf/photos/cj_logo.ico" />
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="bootstrap-3.3.2-dist/js/jquery.min.js"></script>
  <script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
  
</head>
<body  style="background-color: #fdfcf0;">
	<%@include file="../../common/admin.jsp"%>
	<div class="container">
		<div class="page-header">
			<div style="margin-top: 40px;">
			    <FONT face="Impact" style="font-size: 50px;">
					EVENT
				</FONT>
	   		</div>
		</div>
		
		<div class="well">
			<form method="post" action="insert.jf" enctype="multipart/form-data">
				<div class="form-group ">
					<label>카테고리</label>
					<select class="form-control" name="category">
	                    <option value="스페셜이벤트">스페셜이벤트</option>
	                    <option value="영화/예매">영화/예매</option>
	                </select>
				</div>
				<div class="form-group">
					<label>제목</label>
					<input type="text" class="form-control" name="title"/>
				</div>
				<div class="form-group">
					<label>시작일</label>
					<input type="date" class="form-control" name="startDate"/>
				</div>
				<div class="form-group">
					<label>종료일</label>
					<input type="date" class="form-control" name="endDate"/>
				</div>
				<div class="form-group">
					<label>업로드할 사진파일</label>
					<input type="file"  class="form-control" name="imgName"/>
				</div>
				<div class="form-group">
					<label>업로드할 컨텐츠파일</label>
					<input type="file"  class="form-control" name="contentImg"/>
				</div>
				<div class="text-right">
					<input type="submit" class="btn btn-primary" value="등록"/>
				</div>
				
			</form>
		</div>
	</div>
	<%@include file="../../common/footer.jsp" %>
</body>
</html>