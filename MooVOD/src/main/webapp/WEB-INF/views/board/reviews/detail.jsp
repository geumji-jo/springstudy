<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <!-- Favicon-->
  <link rel="icon" type="image/x-icon" href="${contextPath}/resources/home/assets/favicon.ico" />
  <!-- Bootstrap icons-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
  <!-- Core theme CSS (includes Bootstrap)-->
  <link href="${contextPath}/resources/home/css/styles.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>SemiProject - PLAYON</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<script src="${contextPath}/resources/home/js/scripts.js"></script>
<script>
$(function(){
    $('#edit_screen').hide();  // 최초 편집화면은 숨김
  })
function fnEdit(){
  $('#edit_screen').show();
  $('#detail_screen').hide();
}
function fnRemove(){
  if(confirm('삭제할까요?')){
    $('#frm_remove').submit();
  }
}
function fnList(){
  location.href = '${contextPath}/board/reviews/list.do';
}
function fnBack(){
  $('#edit_screen').hide();
  $('#detail_screen').show();
}

</script>
<style>


</style>
</head>
<body>
<section class="py-5">
    <div id="detail_screen"  class="px-4 px-lg-5 mt-5 text-center text-black">
    <h1>${r.reviewNo}번 게시글 상세보기</h1>
    <div>카테고리 : ${r.reviewCategory}</div>
    <div>별점 : ${r.reviewStar}</div>
    <div>제목 : ${r.reviewTitle}</div>
    <div>작성자 : ${r.id}</div>
    <div>작성일 : ${r.reviewCreatedAt}</div>
    <div>수정일 : ${r.reviewModifiedAt}</div>
    <div>${r.reviewContent}</div>
    <form id="frm_remove" action="${contextPath}/board/reviews/remove.do" method="post">
      <input type="hidden" name=reviewNo value="${r.reviewNo}">
    </form>
    <div>
      <input type="button" value="편집" onclick="fnEdit()">
      <input type="button" value="삭제" onclick="fnRemove()">
      <input type="button" value="목록" onclick="fnList()">
    </div>
  </div>
  
  
  <div id="edit_screen" class="px-4 px-lg-5 mt-5 text-center text-black">
    <div style="cursor: pointer;" onclick="fnBack()"><i class="fa-solid fa-arrow-left"></i> 뒤로 가기</div>
    <h1>편집화면</h1>
    <form method="post" action="${contextPath}/board/reviews/modify.do">
      <div>
        <label for="reviewTitle">제목</label>
        <input type="text" id="reviewTitle" name="reviewTitle" value="${r.reviewTitle}">
      </div>
     <div>
        <label for="searchColumn"></label>
          <select name="searchColumn" id="searchColumn">
            <option value="REVIEW_TITLE">제목</option>
            <option value="REVIEW_CATEGORY">카테고리</option>
            <option value="REVIEW_STAR">별점</option>
         </select>
      </div>
      <div>
        <div><label for="reviewContent">내용</label></div>
        <textarea id="content" name="reviewContent">${r.reviewContent}</textarea>  <!-- summernote 편집기로 바뀌는 textarea -->
      </div>
      <div>
        <label for="reviewStar">별점</label>
         <select id="reviewStar" name="reviewStar">
        <option value="${r.reviewStar}" selected>${r.reviewStar}</option>
        <option value="0">0</option>
        <option value="0.5">0.5</option>
        <option value="1">1</option>
        <option value="1.5">1.5</option>
        <option value="2">2</option>
        <option value="2.5">2.5</option>
        <option value="3">3</option>
        <option value="3.5">3.5</option>
        <option value="4">4</option>
        <option value="4.5">4.5</option>
        <option value="5">5</option>
      </select> 
      </div>
      <div>
        <input type="hidden" name="reviewNo" value="${r.reviewNo}">
        <button>수정완료</button>
        <input type="button" value="목록" onclick="fnList()">
      </div>
    </form>
  </div>
  
  
  
</section>


</body>
</html>
<%-- 정적 include : 항상 같은 모습의 페이지를 포함한다.(include 지시어) --%>