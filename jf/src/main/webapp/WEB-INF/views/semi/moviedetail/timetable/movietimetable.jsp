<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>영화별 상영시간표 &lt; 상영시간표 | 영화 그 이상의 감동. CGV</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/jf/resources/bootstrap/css/bootstrap.min.css">
  <script src="/jf/resources/bootstrap/js/jquery.min.js"></script>
  <script src="/jf/resources/bootstrap/js/bootstrap.min.js"></script>
  <style>
      div {
          margin-top: 5px;
          margin-bottom: 5px;
      }
      .movie-menu {
          padding-left: 0px;
      }
      .movie-menu li.on {
          background-color: #000;
      }
      .movie-menu li a {
          color: #fff;
          font-weight: bold;
          margin-left: 30px;
      }
      ul {
          list-style: none;
      }
      .movie-menu li:hover {
          color: #fff;
          background-color: #000;
      }
      .movie-menu li a:hover {
          color: #fff;
          background-color: #000;
      }
      .theater-list button {
          margin-right: 10px;
          color: #000;
      }
      .theater-list {
          border-top: 2px solid black;
          border-bottom: 2px solid black;
          padding-top: 5px;
          padding-bottom: 5px;
      }
      .theater_border_right_hr{
          width:8px;
          height:15px;
          margin-right:8px;
          display: inline-block;
          border-right:0.1px solid #a6a6a6;
      }
      img {
          width: 190px;
          height: auto;
          margin-bottom: 5px;
      }
      p {
          margin-bottom: 0px;
          margin-top: 1px;
      }
      .movie-menu li {
          padding-top: 8px;
          padding-bottom: 8px;
          padding-left: 15px;
          border-radius: 5px;
      }
      ul {
          list-style: none;
      }
      .sect-favorite div {
          border: 1px solid #aaa;
          height: 50px;
          font-size: 12px;
          text-align: center;
      }
      .sect-favorite div p {
          color: #fff;
          margin-top: 18px;
      }
      .col-sm-1 {
          text-align: center;
      }
      body{
          background-color: rgb(252,253,238);
      }
      .age-limit-12 {
          width: 30px;
          height: 30px;
          margin-right: 2px;
          margin-bottom: 2px;
      }
      .age-limit-15 {
          width: 28px;
          height: 30px;
          margin-right: 2px;
          margin-bottom: 2px;
      }
      .age-limit-18 {
          width: 28px;
          height: 27px;
          margin-right: 2px;
          margin-bottom: 2px;
      }
      .screening-y {
          width: 55px;
          height: 29px;
          margin-bottom: 3px;
      }
      .col-movie-detail {
          text-align: center;
          margin-top: 25px;
      }
      .movie-detail {
          font-size: 14px;
          margin-left: -5px;
          color: #999999;
      }
      .select-left {
          width: 58px;
          height: 26px;
          margin-left: -10px;
      }
      .select-right {
          width: 58px;
          height: 25px;
          margin-left: -20px;
      }
      .movie-sun {
          width: 21px;
          height: 21px;
      }
      .movie-moon {
          width: 15px;
          height: 20px;
      }
      .day {
          font-size: 30px;
          padding: 0px;
      }
      .month-week {
          padding: 0px;
          font-size: 12px;
          margin-top: 9px;
      }
      .select-date a {
          color: #717171;
      }
      .selected {
          border: 1px solid black;
          border-radius: 10%;
          background-color: #fff;
      }
      .selected a {
          color: #000;
      }
      .tab-menu {
          background: url(http://img.cgv.co.kr/R2014/images/common/bg/bg_showtimes_favorite.gif) no-repeat 0;
          height: 500px;
          background-size: cover;
      }
      .movie-section {
          padding-left: 100px;
          padding-right: 100px;
      }
      .thumb {
          background-color: #000;
          border-radius: 10px;
      }
      .select-tam a, span {
          color: #fff;
          font-size: 18px;
          padding-right: 5px;
          padding-left: 5px;
      }
      .select-tam {
          display: inline-block;
          background-color: #e71a0f;
          padding: 7px;
      }
      /*
      .ribbon-right {
          background: url(http://img.cgv.co.kr/R2014/images/common/bg/ribon_right.png) right no-repeat;
          padding-right: 20px;
      }*/
      .gly span {
          color: #000;
          font-size: 10px;
      }
      .ribbon-left {
          background: url(http://img.cgv.co.kr/R2014/images/sprite/sprite_corner.png) 0 -20px no-repeat;
          padding-right: 19px;
          padding-bottom: 19px;
      }
      .box-movie-type {
          width: 299px;
          height: 247px;
          padding: 10px 0 30px 34px;
          background: url(http://img.cgv.co.kr/R2014/images/common/bg/bg_box_movie.png) no-repeat 0 0;
      }
      .type-text {
          font-size: 18px;
          padding-top: 2px;
          padding-bottom: 2px;
          padding-left: 10px;
          margin-left: 3px;
          background-color: #262626;
          border: 1px solid black;
          border-radius: 5px;
      }
      .type-text a {
          color: #fff;
      }
      .icon span {
          color: #666;
      }
      .icon a.on span {
          color: #e71a0f;
      }
      .icon a {
          margin-left: 15px;
      }
      .ico-grade {
            display: block;
            position: absolute;
            
            width: 21px;
            height: 21px;
            background: url("http://img.cgv.co.kr/R2014/images/sprite/sprite_icon.png") no-repeat;
            font: 0/0 a;
            zoom: 1;
      }
      .ico {
            display: inline-block;
            padding: 0 20px;
            background: url(http://img.cgv.co.kr/R2014/images/sprite/sprite_icon.png) left 4px no-repeat;
            color: #666666;
      }
      .ico-grade.grade-all{ background-position:-30px 0;}/* 전체 */
      .ico-grade.grade-12{ background-position:-51px 0;}/* 12세 */
      .ico-grade.grade-15{ background-position:-72px 0;}/* 15세 */
      .ico-grade.grade-19{ background-position:-93px 0;}/* 청불 */
      
      .ico.ticket{ background-position:-300px -100px;}
      .ico.grade { background-position:-296px -117px;}
      .ico.person{ padding-left:30px; background-position:-300px -137px;}
      
      .ico.ticket.on { background-position:-300px -157px;}
      .ico.grade.on { background-position:-296px -177px;}
      .ico.person.on { padding-left:30px; background-position:-300px -197px;}
  </style>
</head>
<body>
<div class="container">
    <div class="tab-menu">
        <div class="row">
            <div class="col-sm-12 text-center">
                <img src="/jf/photos/moviett_ribon_left.png" style="width: 19px; margin-right: -3.9px;"/>
                <div class="select-tam">
                    <a class="">극장별 상영시간표</a>
                    <span>|</span>
                    <a class="">영화별 상영시간표</a>
                </div>
                <img src="/jf/photos/moviett_ribon_right.png" style="width: 19px; margin-left: -3.9px;"/>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 text-center icon">
                <a class="ico ticket on"><span>예매율순</span></a>
                <img src="/jf/photos/moviett_bg_writeinfo.gif" style="width: 1px;"/>
                <a class="ico grade"><span>평점순</span></a>
                <img src="/jf/photos/moviett_bg_writeinfo.gif" style="width: 1px;"/>
                <a class="ico person"><span>관람객순</span></a>
            </div>
        </div>
        <div class="row movie-section">
            <div class="col-sm-3 col-movie-detail">
                <img src="/jf/photos/avenjus.jpg" alt="어벤져스: 엔드게임 최고!"/>
                <p class="movie-detail">액션, SF / 181분</p>
                <p class="movie-detail">2019.04.24 개봉</p>
            </div>
            <div class="col-sm-5" style="height: 340px;">
                <div style="width: 95%; float: left; margin-right: 10px;">
                    <ul class="movie-menu">
                        <li class="on"><a href="#">
                            <span class="ico-grade grade-12"></span>어벤져스: 엔드게임
                        </a></li>
                        <li><a href="#">
                            <span class="ico-grade grade-all"></span>알라딘
                        </a></li>
                        <li><a>
                            <span class="ico-grade grade-19"></span>악인전
                        </a></li>
                        <li><a>
                            <span class="ico-grade grade-15"></span>걸캅스
                        </a></li>
                        <li><a>
                            <span class="ico-grade grade-12"></span>배심원들
                        </a></li>
                        <li><a>
                            <span class="ico-grade grade-12"></span>고질라 킹 오브 몬스터
                        </a></li>
                        <li><a>
                            <span class="ico-grade grade-12"></span>어린 의뢰인
                        </a></li>
                        <li><a>
                            <span class="ico-grade grade-all"></span>명탐정 피카츄
                        </a></li>
                        <li><a>
                            <span class="ico-grade grade-15"></span>더 보이
                        </a></li>
                    </ul>
                </div>
                <div class="scroll-bar" style="width: 2%; height: 340px; float: left;">
                    <div class="thumb" style="0px; height: 40px;"></div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="box-movie-type">
                    <div class="row">
                        <div class="col-sm-5 type-text">
                            <a>2D</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <h1>어벤져스: 엔드게임</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12 theater-list">
            <button class="btn btn-link">서울</button>
            <button class="btn btn-link">경기</button>        
            <button class="btn btn-link">인천</button>        
            <button class="btn btn-link">대전/충청</button>        
            <button class="btn btn-link">대구</button>        
            <button class="btn btn-link">부산/울산</button>        
            <button class="btn btn-link">경상</button>        
            <button class="btn btn-link">광주/전라/제주</button>        
        </div>
    </div>
    <div class="row" style="border-bottom: 1px solid #aaa;">
        <div class="col-sm-12">
            <div class="row">
                <div class="col-sm-1">
                    <button class="btn btn-link">
                        <img src="/jf/photos/moviett_left2.png" class="select-left"/>
                    </button>
                </div>
                <div class="col-sm-1 select-date selected">
                    <a href="#">
                        <div class="row">
                            <div class="col-sm-6 month-week">
                                <p>05월</p>
                                <p>수</p>
                            </div>
                            <div class="col-sm-6 day">
                                22
                            </div>
                        </div> 
                    </a>
                </div>
                <div class="col-sm-1 select-date">
                    <a href="">
                        <div class="row">
                            <div class="col-sm-6 month-week">
                                <p>05월</p>
                                <p>목</p>
                            </div>
                            <div class="col-sm-6 day">
                                23
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-sm-1 select-date">
                    <a href="">
                        <div class="row">
                            <div class="col-sm-6 month-week">
                                <p>05월</p>
                                <p>금</p>
                            </div>
                            <div class="col-sm-6 day">
                                24
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-sm-1 select-date">
                    <a href="">
                        <div class="row">
                            <div class="col-sm-6 month-week">
                                <p>05월</p>
                                <p>토</p>
                            </div>
                            <div class="col-sm-6 day">
                                25
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-sm-1 select-date">
                    <a href="">
                        <div class="row">
                            <div class="col-sm-6 month-week">
                                <p>05월</p>
                                <p>일</p>
                            </div>
                            <div class="col-sm-6 day">
                                26
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-sm-1 select-date">
                    <a href="">
                        <div class="row">
                            <div class="col-sm-6 month-week">
                                <p>05월</p>
                                <p>수</p>
                            </div>
                            <div class="col-sm-6 day">
                                29
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-sm-1 select-date">
                    <a href="">
                        <div class="row">
                            <div class="col-sm-6 month-week">
                                <p>05월</p>
                                <p>목</p>
                            </div>
                            <div class="col-sm-6 day">
                                30
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-sm-1 select-date">
                    <a href="">
                        <div class="row">
                            <div class="col-sm-6 month-week">
                                <p>05월</p>
                                <p>금</p>
                            </div>
                            <div class="col-sm-6 day">
                                31
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-sm-1 select-date">
                    <a href="">
                        <div class="row">
                            <div class="col-sm-6 month-week">
                                <p>06월</p>
                                <p>토</p>
                            </div>
                            <div class="col-sm-6 day">
                                01
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-sm-1 select-date">
                    <a href="">
                        <div class="row">
                            <div class="col-sm-6 month-week">
                                <p>06월</p>
                                <p>일</p>
                            </div>
                            <div class="col-sm-6 day">
                                02
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-sm-1">
                    <button class="btn btn-link">
                        <img src="/jf/photos/moviett_right2.png" class="select-right"/>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="row" style="border-bottom: 1px solid #aaa;">
        <div class="col-sm-12">
            <p>
                <img src="/jf/photos/moviett_sun.png" class="movie-sun"/><strong>조조</strong>
                <img src="/jf/photos/moviett_moon.png" class="movie-moon"/><strong>심야</strong>
                <span style="color: #794623">* 시간을 클릭하시면 빠른 예매를 하실 수 있습니다.</span>
            </p>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="row" style="border-bottom: 1px solid #aaa;">
                <div class="col-sm-2">
                    <h4>CGV</h4>
                    <h4>강변</h4>
                </div>
                <div class="col-sm-10">
                    <div class="row gly"><span class="glyphicon glyphicon-triangle-right"></span>1관 | 총 120석</div>
                    <div class="row">
                        <div class="col-sm-1" style="border: 1px solid #aaa;">
                            <p><strong>23:05</strong></p>
                            <p style="font-size: 13px;">104석</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="border-bottom: 1px solid #aaa;">
                <div class="col-sm-2">
                    <h4>CGV</h4>
                    <h4>상봉</h4>
                </div>
                <div class="col-sm-10">
                    <div class="row gly"><span class="glyphicon glyphicon-triangle-right"></span>1관 | 총 120석</div>
                    <div class="row">
                        <div class="col-sm-1" style="border: 1px solid #aaa;">
                            <p><strong>23:05</strong></p>
                            <p style="font-size: 13px;">104석</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="border-bottom: 1px solid #aaa;">
                <div class="col-sm-2">
                    <h4>CGV</h4>
                    <h4>송파</h4>
                </div>
                <div class="col-sm-10">
                    <div class="row gly"><span class="glyphicon glyphicon-triangle-right"></span>1관 | 총 120석</div>
                    <div class="row">
                        <div class="col-sm-1" style="border: 1px solid #aaa;">
                            <p><strong>21:20</strong></p>
                            <p style="font-size: 13px;">99석</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="border-bottom: 1px solid #aaa;">
                <div class="col-sm-2">
                    <h4>CGV</h4>
                    <h4>신촌아트레온</h4>
                </div>
                <div class="col-sm-10">
                    <div class="row gly"><span class="glyphicon glyphicon-triangle-right"></span>1관 | 총 120석</div>
                    <div class="row">
                        <div class="col-sm-1" style="border: 1px solid #aaa;">
                            <p><strong>21:10</strong></p>
                            <p style="font-size: 13px;">마감</p>
                        </div>
                        <div class="col-sm-1" style="border: 1px solid #aaa;">
                            <p><strong>24:40</strong></p>
                            <p style="font-size: 13px;">108석</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="border-bottom: 1px solid #aaa;">
                <div class="col-sm-2">
                    <h4>CGV</h4>
                    <h4>영등포</h4>
                </div>
                <div class="col-sm-10">
                    <div class="row gly"><span class="glyphicon glyphicon-triangle-right"></span>1관 | 총 120석</div>
                    <div class="row">
                        <div class="col-sm-1" style="border: 1px solid #aaa;">
                            <p><strong>23:10</strong></p>
                            <p style="font-size: 13px;">139석</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <p>* 입장 지연에 따른 관람불편을 최소화하고자 영화는 약 10분 후에 시작됩니다. 관람 에티켓을 위한 사전 입장 부탁드립니다.</p>
        </div>
    </div>
</div>
</body>
</html>