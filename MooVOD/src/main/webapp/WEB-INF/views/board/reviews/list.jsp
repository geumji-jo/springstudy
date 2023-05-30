<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${contextPath}/resources/home/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${contextPath}/resources/home/css/styles.css" rel="stylesheet" />
        <link href="${contextPath}/resources/bootstrap-4.6.2/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Darumadrop+One&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>MOOVOD</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<script src="${contextPath}/resources/home/js/scripts.js"></script>
<script src="${contextPath}/resources/bootstrap-4.6.2/js/bootstrap.min.js"></script>
<script>




$(function(){
    // recordPerPage의 변경
    $('#recordPerPage').on('change', function(){
      location.href = '${contextPath}/board/reviews/change/record.do?recordPerPage=' + $(this).val();  // session에 recorePerPage 올리기
    }) 
    // 세션에 저장된 recordPerPage값으로 <select> 태그의 값을 세팅
    let recordPerPage = '${sessionScope.recordPerPage}' == '' ? '10' : '${sessionScope.recordPerPage}';
    $('#recordPerPage').val(recordPerPage);
    // 제목을 클릭하면 정렬 방식을 바꿈
    $('.title').on('click', function(){
      location.href = '${contextPath}/board/reviews/list.do?orderColumn=' + $(this).data('orderColumn') + '&order=' + $(this).data('order') + "&page=${page}";
    })
  })
  function fnNewWrite() {
    location.href='${contextPath}/board/reviews/write.do';
  }
  
  $(function(){
    let addResult = '${addResult}';  // let addResult = '1';  삽입 성공
                                     // let addResult = '0';  삽입 실패
                                     // let addResult = '';   삽입과 상관 없음
    if(addResult != ''){
      if(addResult == '1'){
        alert('게시글이 등록되었습니다.');
      } else {
        alert('게시글 등록이 실패했습니다.');
      }
    }
    let removeResult = '${removeResult}';
    if(removeResult != ''){
      if(removeResult == '1'){
        alert('게시글이 삭제되었습니다.');
      } else {
        alert('게시글 삭제가 실패했습니다.');
      }
    }
  })
  
  
  $(function(){
    // 자동 완성 목록 초기화
    $('#searchColumn').on('change', function(){
      $('#auto_complete').empty();
      $('#query').val('');
    })
    // 자동 완성 목록 가져오기
    $('#query').on('keyup', function(){
      $('#auto_complete').empty();
      $.ajax({
        // 요청
        type: 'get',
        url: '${contextPath}/board/reviews/autoComplete.do',
        data: $('#frm1').serialize(),
        // 응답
        dataType: 'json',
        success: function(resData){  // resData = {"employees": [{"firstName": "xxx", "phoneNumber": "xxx", "deptDTO": {"departmentName": "xxx"}}, {}, {}, ...]}
          $.each(resData.employees, function(i, review){
            switch($('#searchColumn').val()) {
            case "REVIEW_TITLE":
              $('#auto_complete').append('<option value="' + review.reviewTitle + '" />');
              break;
            case "REVIEW_CATEGORY":
              $('#auto_complete').append('<option value="' + review.reviewCategory + '" />');
              break;
            case "REVIEW_STAR":
              $('#auto_complete').append('<option value="' + review.reviewStar + '" />');
              break;
            }
          })
        }
      })
    })
  })


  
  
</script>
<style type="text/css">


.title {
    cursor: pointer;
  }
  .title:hover {
    color: gray;
  }
  .title:active {
    color: silver;
  }
  .pagination {
    width: 350px;
    margin: 0 auto;
    text-align: center;
  }
  .pagination span, .pagination a {
    display: inline-block;
    margin: 0 15px;
  }
  .hidden {
    visibility: hidden;
  }
  .strong {
    font-weight: 900;
  }
  .link {
    color: gray;
  }




.text-center {
margin-top: 50px;
}

#recordPerPage {
margin-bottom:10px;
}

</style>
</head>
<body>

<section class="py-5">



  <div class="body px-4 px-lg-5 mt-5">
    <div class="text-center text-black">
    <h1>리뷰게시판</h1>
    </div>
       <div class="pd-r-68" >
    <form id="frm1" action="${contextPath}/board/reviews/list.do">
       <select name="searchColumn" id="searchColumn">
        <option value="REVIEW_TITLE" >제목</option>
        <option value="REVIEW_CATEGORY" >카테고리</option>
        <option value="REVIEW_STAR" >별점</option>
     </select>
      <input list="auto_complete" type="text" name="query" id="query">
      <datalist id="auto_complete"></datalist>
      <button>조회</button>
    </form>
    </div>
    <div>페이지보기
      <select id="recordPerPage">
        <option value="10">10개</option>
        <option value="20">20개</option>
        <option value="30">30개</option>
      </select> 
    </div>
    
    
    
    
    <div>
      <table class="table">
        <thead class="text-center text-black">
           <tr>
              <th scope="col" data-column="REVIEW_NO" data-order="${order}">번호</th>
              <th scope="col" data-column="VOD_NO" data-order="${order}">카테고리</th>
              <th scope="col" data-column="REVIEW_TITLE" data-order="${order}">제목</th>
              <th scope="col" data-column="REVIEW_STAR" data-order="${order}">별점</th>
              <th scope="col" data-column="ID" data-order="${order}">작성자</th>
              <th scope="col" class="title" data-column="REVIEW_CREATED_AT" data-order="${order}">날짜</th>
              <th scope="col" class="title" data-column="REVIEW_HITS" data-order="${order}">조회수</th>
             </tr>
        </thead>
        
        <tbody class="text-center text-black">
          <c:if test="${empty reviewsList}">
          <tr>
            <td colspan="7">게시글이 없습니다.</td>
          </tr>
          </c:if>
          <c:if test="${not empty reviewsList}">
          <c:forEach items="${reviewsList}" var="r" varStatus="vs">
            <tr>
              <td>${beginNo - vs.index}</td>
              <td>${r.reviewCategory}</td>
              <td><a href="${contextPath}/board/reviews/detail.do?reviewNo=${r.reviewNo}" >${r.reviewTitle}</a></td>
              <td>${r.reviewStar}</td>
              <td>${r.id}</td>
              <td>${r.reviewCreatedAt}</td>
              <td>${r.reviewHits}</td>
            </tr>
          </c:forEach>
        </c:if>
      </tbody>
      <tfoot>
        <tr>
          <td colspan="7">
            ${pagination}
          </td>
        </tr>
      </tfoot>
      </table>
    </div>
    

    <div class="text-right">
      <input type="button" value="새글 작성하기" onclick="fnNewWrite()">
    </div>
  </div>
</section>


</body>
</html>
<%-- 정적 include : 항상 같은 모습의 페이지를 포함한다.(include 지시어) --%>