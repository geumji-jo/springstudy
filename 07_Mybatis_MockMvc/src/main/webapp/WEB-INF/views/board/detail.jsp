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
	function fnEdit() {
		$('#detail_screen').hide();
		$('#edit_screen').show();
		
	}
	function fnBack() {
		$('#detail_screen').show();
		$('#edit_screen').hide();
		
	}
	function fnRemove() {// post방식 처리
		if(confirm("삭제할까요?")) {
			$('#frm_remove').submit();			//form에 있는 submit을 action으로 보내는 메소드
		}

	}

	function fnList() {
		location.href='${contextPath}/board/list.do';
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
		$('#edit_screen').hide();
		let modifyResult = '${modifyResult}';
		if(modifyResult != ""){
			if(modifyResult =='1'){
				alert('게시글이 수정되었습니다');
			}else {
				alert('게시글이 수정이 실패했습니다.');
			}
		}
	})
</script>
</head>
<body>

	<div id="detail_screen">
		<h1>${b.boardNo}게시글 상세보기</h1>
		<div>제목 : ${b.title}</div>
		<div>작성자 : ${b.writer}</div>
		<div>작성일 : ${b.createdAt}</div>
		<div>수정일 : ${b.modifiedAt}</div>
		<div>${b.content}</div>
		<form id="frm_remove" action="${contextPath}/board/remove.do" method="post">
			<input type="hidden" name="boardNo" value="${b.boardNo}">
		</form>
		<div>
			<input type="button" value="편집" onclick="fnEdit()">
			<input type="button" value="삭제" onclick="fnRemove()">
			<input type="button" value="목록" onclick="fnList()">
		</div>
		
	</div>
	
	<div id="edit_screen">
			<div style="cursor: pointer;" onclick="fnBack()"><i class="fa-solid fa-arrow-left"></i> 뒤로 가기</div>
			<h1>편집화면</h1>
			<form method="post" action="${contextPath}/board/modify.do">
				<div>
					<div>
						<label for="title">제목</label>
						<input type="text" id="title" name="title" value="${b.title}">
					</div>
					<div>
						<label for="content">내용</label>
						<textarea id="content" name="content" >${b.content}</textarea>
					</div>
					<div>
						<input type="hidden" name="boardNo" value="${b.boardNo}" >
						<button>수정완료</button>
						<input type="button" value="목록" onclick="fnList()">
					</div>
				</div>
			</form>
		</div>
	
	

</body>
</html>