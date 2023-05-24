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
<script src="${contextPath}/resources/summernote-0.8.18-dist/summernote-lite.min.js"></script>
<script src="${contextPath}/resources/summernote-0.8.18-dist/lang/summernote-ko-KR.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/summernote-0.8.18-dist/summernote-lite.min.css">
<script>

  function fnList() {
    location.href = '${contextPath}/board/reviews/list.do';
  }
  
  
    $(document).ready(function() {
        $("#reviewContent").keyup(function(event) {
            if (event.which === 13) {
                $("#submit").click();
            }
        });
     
        $("#submit").click(function() {
        })
    });
  
  
  
  
</script>
<style>

.text-center {
  margin-left:auto; 
    margin-right:auto;
    margin-top: auto;
}

html, body {
     min-height: 100%;
}

</style>
</head>
<body>

  <div class="text-center">
    <h1>작성화면</h1>
    <form method="post" action="${contextPath}/board/reviews/add.do">
  
      <div>
        <label for="vodNo"></label>
           <select name="vodNo" id="vodNo">
            <option value="vodNo" selected></option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            </select>
      </div>
      <div>
        <label for="reviewTitle"></label>
        <input type="text" id="reviewTitle" name="reviewTitle" placeholder="제목">
      </div>
       <div>
        <label for="reviewStar"></label>
         <select id="reviewStar" name="reviewStar">
        <option value="" selected>별점</option>
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
        <label for="id"></label>
        <input type="text" id="id" name="id" placeholder="작성자">
      </div>
      <div>
        <div><label for="reviewContent">내용</label></div>
        <textarea id="reviewContent" name="reviewContent"></textarea>  <!-- summernote 편집기로 바뀌는 textarea -->
      </div>
      <div>
        <button id="submit">작성완료</button>
        <input type="button" value="목록" onclick="fnList()">
      </div>
    </form>
  </div>
  
</body>
</html>
<%-- 정적 include : 항상 같은 모습의 페이지를 포함한다.(include 지시어) --%>