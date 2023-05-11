<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Nunito" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/jf/resources/bootstrap/css/header.css">
    <link rel="stylesheet" href="/jf/resources/bootstrap/css/footer.css">
    <link rel="stylesheet" href="/jf/resources/bootstrap/css/client.css">
    <link rel="stylesheet" href="/jf/resources/bootstrap/css/customercenter-noticelist.css">


</head>

<body>
<%@include file="../../common/navigation.jsp"%>
    <div class="container">
        <div class="row c_left" >
        <%@include file="../../common/customerCenterLeft.jsp" %>
            <div class="col-sm-10">
                <div class="row client_mainrow_right">
                    <div class="col-sm-4 client_red client_icon text-center">
                        <div class="row">
                            <div class="col-sm-12 ">
                                <img src="/jf/photos/client_question.png" />
                            </div>
                            <div class="col-sm-12 fastsearch">
                                	자주찾는 질문 빠른검색
                            </div>
                        </div>
                        <div class="search_box">
                            <input id="searchtext" type="text" title="검색어 입력" placeholder="검색어를 입력해 주세요.">
                            <button type="button" class="btn btn-default" title="검색하기" id="btn_search">검색</button>
                        </div>
                        <span><a class="search_items" href="">현금영수증</a></span>
                        <span><a class="search_items" href="">관람권</a></span>
                        <span><a class="search_items" href="">홈페이지</a></span>
                        <span><a class="search_items" href="">예매</a></span>
                        <span><a class="search_items" href="">환불</a></span>
                    </div>
                    <div class="col-sm-4 cilent_right_center">
                        <div class="row">
                            <div class="col-sm-12 text-center email_div">
                                <img src="/jf/photos/email.PNG" alt="">
                            </div>
                            <div class="col-sm-12 client_email_question text-center">
                                <span>이메일 문의</span>
                            </div>
                            <div class="col-sm-12 client_email_question_2 text-center">
                                <span>24시간 365일 언제든지 문의해 주세요.</span>
                            </div>
                            <div class="col-sm-12 text-center client_email_question_3">
                                <button onclick="location.href='http://localhost/jf/member/questiondetail.jf?pno=1'" class="btn-question">문의하기</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 client_right_right">
                        <div class="row">
                            <div class="col-sm-12 text-center email_div">
                                <img src="/jf/photos/counsel.PNG" alt="">
                            </div>
                            <div class="col-sm-12 client_email_question text-center">
                                <span>내 상담 내역 확인</span>
                            </div>
                            <div class="col-sm-12 client_email_question_2 text-center">
                                <span>문의하신 내용을 확인하실 수 있습니다.</span>
                            </div>
                            <div class="col-sm-12 text-center client_email_question_3">
                                <a href="/jf/member/questionlist.jf"><button class="btn-question2">문의내역 조회</button></a>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row main_left_row_2_1">
                    <div class="col-sm-4 ">
                       <div class="row_2_1_service_div">
                        <span>자주찾는 서비스</span>
                       </div>
                        <div class="row service_main_row">
                           <a href="">
                            <div class="col-sm-6 row_2_1_1">
                                <div class="row row_first">
                                    <div class="col-sm-10 row_2_2_2">
                                       <div class="row">
                                           <div class="col-sm-12 row_2_2_div1">
                                        <span class="r2_2_span">신용카드</span>
                                           </div>
                                           <div class="col-sm-12 row_2_2_div2">
                                        <span class="r2_2_span">영수증 출력</span>
                                           </div>
                                       </div>
                                    </div>
                                    <div class="col-sm-2 left_2_1_col">
                                        <span class="glyphicon glyphicon-chevron-right"></span>
                                    </div>
                                </div>
                            </div>
                            </a>
                            <a href="/jf/member/searchid.jf">
                            <div class="col-sm-6 row_2_1_1">
                                <div class="row row_first">
                                    <div class="col-sm-10 row_2_2_2">
                                       <div class="row">
                                           <div class="col-sm-12 row_2_2_div1">
                                        <span class="r2_2_span">아이디/</span>
                                           </div>
                                           <div class="col-sm-12 row_2_2_div2">
                                        <span class="r2_2_span">비밀번호 찾기</span>
                                           </div>
                                       </div>
                                    </div>
                                    <div class="col-sm-2 left_2_1_col">
                                        <span class="glyphicon glyphicon-chevron-right"></span>
                                    </div>
                                </div>
                            </div>
                            </a>
                            <a href="/jf/member/mycgvpage.jf">
                            <div class="col-sm-6 row_2_1_1">
                                <div class="row row_first">
                                    <div class="col-sm-10 row_2_2_2">
                                       <div class="row">
                                           <div class="col-sm-12 row_2_2_div1">
                                        <span class="r2_2_span">예매/</span>
                                           </div>
                                           <div class="col-sm-12 row_2_2_div2">
                                        <span class="r2_2_span">취소내역 확인</span>
                                           </div>
                                       </div>
                                    </div>
                                    <div class="col-sm-2 left_2_1_col">
                                        <span class="glyphicon glyphicon-chevron-right"></span>
                                    </div>
                                </div>
                            </div>
                            </a>
                            <a href="">
                            <div class="col-sm-6 row_2_1_1">
                                <div class="row row_first">
                                    <div class="col-sm-10 row_2_2_2">
                                       <div class="row">
                                           <div class="col-sm-12 row_2_2_div1">
                                        <span class="r2_2_span">비회원</span>
                                           </div>
                                           <div class="col-sm-12 row_2_2_div2">
                                        <span class="r2_2_span">예매 / 취소</span>
                                           </div>
                                       </div>
                                    </div>
                                    <div class="col-sm-2 left_2_1_col">
                                        <span class="glyphicon glyphicon-chevron-right"></span>
                                    </div>
                                </div>
                            </div>
                            </a>
                            <a href="">
                            <div class="col-sm-6 row_2_1_1">
                                <div class="row row_first">
                                    <div class="col-sm-10 row_2_2_2">
                                       <div class="row">
                                           <div class="col-sm-12 row_2_2_div1">
                                        <span class="r2_2_span">멤버십포인트</span>
                                           </div>
                                           <div class="col-sm-12 row_2_2_div2">
                                        <span class="r2_2_span">사용안내</span>
                                           </div>
                                       </div>
                                    </div>
                                    <div class="col-sm-2 left_2_1_col">
                                        <span class="glyphicon glyphicon-chevron-right"></span>
                                    </div>
                                </div>
                            </div>
                            </a>
                            <a href="">
                            <div class="col-sm-6 row_2_1_1">
                                <div class="row row_first">
                                    <div class="col-sm-10 row_2_2_2">
                                       <div class="row">
                                           <div class="col-sm-12 row_2_2_div1">
                                        	<span class="r2_2_span">관람권</span>
                                           </div>
                                           <div class="col-sm-12 row_2_2_div2">
                                        	<span class="r2_2_span">할인쿠폰 등록</span>
                                           </div>
                                       </div>
                                    </div>
                                    <div class="col-sm-2 left_2_1_col">
                                        <span class="glyphicon glyphicon-chevron-right"></span>
                                    </div>
                                </div>
                            </div>
                            </a>
                            
                        </div>
                        
                    </div>
                    <div class="col-sm-8">
                        <div class="row">
                            <div class="col-sm-12 notice_div">
                                <span>공지 / 뉴스</span>
                                <a href="customercenter-noticelist.jf?pno=1"><span class="glyphicon glyphicon-plus-sign"></span></a>
                            </div>
                        </div>
                        <div class="row notive_1_1_row">
                        	<c:forEach var="notice" items="${notices }">
	                            <div class="col-sm-9">
	                               <a style="color:black;" href="customercenter-noticeform.jf?nno=${notice.no}">${notice.title }</a>
	                            </div>
	                            <div class="col-sm-3">
	                                <fmt:formatDate value="${notice.createDate }"/>
	                            </div>
                        	</c:forEach>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 client_img1">
                            	<img src="/jf/photos/sisa.PNG" alt="">
                            </div>
                            <div class="col-sm-6 client_img2">
                            	<img src="/jf/photos/discount.PNG" alt="">
                            </div>
                    </div>
                </div>
                <div class="row">
                    <hr class="">
                </div>
	
            </div>
                <div class="row">
                    <div class="col-sm-12">
                    CGV 고객센터 : 1544-1122 (09:00~22:00)
                    
                      
                    </div>
                <div class="row">
                    <hr>
                </div>
        </div>
    </div>
</div>
<%@ include file="../../common/footer.jsp"%>
</body></html>