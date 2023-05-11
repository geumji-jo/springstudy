<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<script type="text/javascript">

function fndetail(){
	location.href = '${contextPath}/upload/detail.do';
}




</script>
</head>
<body>
		<div>
				<h1>UPLOAD 게시글 수정하기</h1>
				<form method="post" enctype="multipart/form-data" action="${contextPath}/upload/modify.do">
					<div>
						<label for="uploadTitle">제목</label>
						<input type="text" id="uploadTitle" name="uploadTitle" value="${upload.uploadTitle}">
					</div>
					<div>
						<label for="uploadContent">내용</label><br>
						<textarea id="uploadContent" name="uploadContent" rows="5" cols="30" >${upload.uploadContent}</textarea>
					</div>
					<div>
						<label for="files">첨부</label>
						<input type="file" id="files" name="files" multiple="multiple" onchange="fnFileCheck(this)">
						<div id="fileList">첨부 파일의 목록이 이 곳에 표시됩니다</div>
					</div>
					<hr>
					<div>
						<button>수정완료</button>
						<input type="button" value="목록" onclick="fndetail()">
					</div>
				</form>
			</div>
</body>
</html>