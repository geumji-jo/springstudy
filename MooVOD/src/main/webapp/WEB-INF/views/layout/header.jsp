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
    <meta charset="UTF-8">
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="${contextPath}/resources/home/assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${contextPath}/resources/home/css/styles.css" rel="stylesheet" />
    <link href="${contextPath}/resources/menubar/menubar.css" rel="stylesheet" />
    <link href="${contextPath}/resources/bootstrap-4.6.2/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Darumadrop+One&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/resources/summernote-0.8.18-dist/summernote-lite.min.css">

    <title>${param.title eq null ? 'Welcome' : param.title}</title>
    <script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
    <script src="${contextPath}/resources/home/js/scripts.js"></script>
    <script src="${contextPath}/resources/bootstrap-4.6.2/js/bootstrap.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="${contextPath}/resources/menubar/menubar.min.js"></script>
    <script src="${contextPath}/resources/summernote-0.8.18-dist/summernote-lite.min.js"></script>
    <script src="${contextPath}/resources/summernote-0.8.18-dist/lang/summernote-ko-KR.min.js"></script>
<style>
nav {
text-align: center;
}


@import url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&display=swap');
* {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}

.title2 {
  background-color:  #fff;
  display: flex;
  justify-content: center;
  align-items: top;
  min-height: 5vh;
  padding-bottom: 50px;

}
.waviy {
  position: relative;
  -webkit-box-reflect: below -20px linear-gradient(transparent, rgba(0,0,0,.2));
  line-height:-10px;

}
.waviy span {
  font-family: 'Darumadrop One', cursive;
  font-size: 120px;
  position: relative;
  display: inline-block;
  color: #151719;
  text-transform: uppercase;
  animation: waviy 1s infinite;
  animation-delay: calc(.1s * var(--i));
  
  
}
@keyframes waviy {
  0%,40%,100% {
    transform: translateY(0)
  }
  20% {
    transform: translateY(-20px)
  }
}

nav {

padding-left: 30px;
}

.mr-30 {
  margin-right: 30rem !important;
}

.mr-80 {
  margin-right: 80rem !important;
}

.ml-7 {
  margin-left: 7rem  !important;
  
}

.ml-3 {
  margin-left: 3rem  !important;
  
}

.wd-500 {
width: 500px;

}
.df {

display: flex;


}
</style>
</head>
<body>
  <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-white">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="${contextPath}/">MOOVOD</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="${contextPath}/user/login.form">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="${contextPath}/user/agree.form">회원가입</a></li>
                        <li class="nav-item"><a class="nav-link" href="${contextPath}/main">고객센터</a></li>
                    </ul>
               
                </div>
            </div>
        </nav>
        
        
        <!-- Header-->
        <header class="py-4">
            <div class="container px-4 px-lg-6 ">
                <div class="text-center text-black">
       <div class="title2">
         <div class="waviy  display-4 w-bolder">
           <span style="--i:1">M</span>
           <span style="--i:2">O</span>
           <span style="--i:3">O</span>
           <span style="--i:4">V</span>
           <span style="--i:5">O</span>
           <span style="--i:6">D</span>
          </div>
      </div>
                </div>
            </div>
        </header>
    <hr>
    <!-- navbar-->

<nav class="menu sticky-top ">
  <div class="nav nav-tabs justify-content-center " id="nav-tab" role="tablist">
    <div class="nav-link text-black" id="nav-STORE-tab"><a href="${contextPath}/item/list.do">STORE</a></div>
    <div class="nav-link text-black" id="nav-STORE-tab"><a href="${contextPath}/vod/vodList.form">VOD</a></div>
    <div class="nav-link text-black" id="nav-STORE-tab"><a href="${contextPath}/board/reviews/list.do">REVIEW</a></div>
  </div>
</nav>
