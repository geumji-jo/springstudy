<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<script src="${contextPath}/resources/summernote-0.8.18-dist/summernote-lite.min.js"></script>
<script src="${contextPath}/resources/summernote-0.8.18-dist/lang/summernote-ko-KR.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/summernote-0.8.18-dist/summernote-lite.min.css">
<script>
	function fnlist() {
		location.href="${contextPath}/board/list.do"
	}
	
	$(function() {
		$('#content').summernote({
			width: 640,
			height: 480,
			lang: 'ko-KR',
			toolbar: [
			  ['style', ['bold', 'italic', 'underline', 'clear']],
			  ['font', ['strikethrough', 'superscript', 'subscript']],
			  ['para', ['ul', 'ol', 'paragraph']],
			  ['table', ['table']],
			  ['insert', ['link', 'picture', 'video']],
			  ['view', ['fullscreen', 'codeview', 'help']],
			]
		
		})
	})
</script>

</head>
<body>
	
	<div>
	<a href="${contextPath}/board/list.do">뒤로가기</a>
		<form method="post" action="${contextPath}/board/add.do">
			<div>
				<h1>작성화면</h1>
				<div>
					<label for="title">제목</label>
					<input type="text" id="title" name="title" >
				</div>
				<div>
					<label for="writer">작성자</label>
					<input type="text" id="writer" name="writer" >
				</div>
				<div>
					<label for="content">내용</label>
					<textarea id="content" name="content"></textarea>
				</div>
				<div>
					<button>작성완료</button>
					<input type="button" value="목록보기" onclick="fnlist()">
				</div>
			</div>
		</form>
	</div>
	
	
</body>
</html>