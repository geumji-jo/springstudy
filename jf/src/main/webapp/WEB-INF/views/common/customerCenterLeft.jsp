<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <div class="col-sm-2" style="font-weight: bold;">
                <div class="row" >
                    <div class="col-sm-11 client_mainrow_left ${toggleNo eq 1 ? 'client_selected' : ''}">
                    	<a style="font-size:15px;" href="/jf/semi/admin/customercenter.jf?toggleNo=1">고객센터 메인</a>
                    </div>
                    <div class="col-sm-11 client_mainrow_left">
                       	자주찾는 질문
                    </div>
                    <div class="col-sm-11 client_mainrow_left ${toggleNo eq 3 ? 'client_selected' : ''}" >
						<a style="font-size:15px;" href="/jf/semi/admin/customercenter-noticelist.jf?pno=1&toggleNo=3">공지/뉴스</a>
                    </div>
                    <div class="col-sm-11 client_mainrow_left  ${toggleNo eq 4 ? 'client_selected' : ''}">
                       	<a style="font-size:15px;" href="/jf/member/questionlist.jf?pno=1">1:1문의내역</a>
                    </div>
                    <div class="col-sm-11 client_mainrow_left">
						분실물 문의
                    </div>
                    <div class="col-sm-11 client_mainrow_left">
						단체/대관 문의
                    </div>
                    <div class="col-sm-11 client_mainrow_left">
						대학로 옥탑 예약
                    </div>
                    <div class="col-sm-12 client_img_div">
                        <img class="client_left_img" src="http://adimg.cgv.co.kr/images/201808/citi/0516_160x300.jpg" alt="">
                    </div>
                </div>
            </div>
		<script>
/* 			$('.client_mainrow_left').each(function(){
				$(this).removeClass('client_mainrow_left');
				
			}) */
		</script>