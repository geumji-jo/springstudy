<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <link rel="stylesheet" href="/resources/css/ticketingList.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
    <div class="container" style="width: 1250px;">
        <div class="row mb-3">
            <h2>빠른예매</h2>
            <div  class="left-container">
              <div class="box">
                    <div class="text-title">
                        <h3>관람인원선택</h3>
                        <button class="reset-button" type="button"><img src="/resources/images/btn/resetbutton.png" class="btn-reset-icon"/>초기화</button>
                    </div>
                </div>
            </div>
            <div class="all-check-people">
                <div class="check-people">
                    <p class="txt">성인</p>
                    <div class="count">
                        <button type="button" class="down" title="성인 좌석 선택 감소">-</button>
                        <div class="number">
                            <button type="button" class="now" title="성인 현재 좌석 선택 수">0</button>
                        </div>
                        <button type="button" class="up" title="성인 좌석 선택 증가">+</button>
                    </div>
                </div>
                <div class="check-people">
                    <p class="txt">청소년</p>
                    <div class="count">
                        <button type="button" class="down" title="청소년 좌석 선택 감소">-</button>
                        <div class="number">
                            <button type="button" class="now" title="청소년 현재 좌석 선택 수">0</button>
                        </div>
                        <button type="button" class="up" title="청소년 좌석 선택 증가">+</button>
                    </div>
                </div>
                <div class="check-people">
                    <p class="txt">우대</p>
                    <div class="count">
                        <button type="button" class="down" title="우대 좌석 선택 감소">-</button>
                        <div class="number">
                            <button type="button" class="now" title="우대 현재 좌석 선택 수">0</button>
                        </div>
                        <button type="button" class="up" title="우대 좌석 선택 증가">+</button>
                    </div>
                </div>
            </div>
            <div class="seat-view">
                <div class="seat">
                    <img src="/resources/images/btn/img-theater-screen.png" alt="screen-seat" class="screen-seat">
                    <div class="seat-wrapper">
                        <div class="toggle-seat" id="seat-layout">
                            <form action="">
                                <section>
                                    <div id="show-seat">
                                      
                                    </div>
                                </section>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        <div class="right-container">
            <div class="movie-container">
                <div class="title-area">
                    <span class="movie-grade"><img src="/resources/images/age/12세이상관람자.png" alt="12age" class="img-age"/></span>
                    <div class="ptag">
                        <p class="tit">청춘적니</p>
                        <p class="cate">2D(자막)</p>
                    </div>
                </div>
                <div class="movie-detail-area">
                    <p class="place">고양스타필드</p>
                    <p class="special">MX관</p>
                    <p class="date"><span>2022.01.22</span>
                        <em>(토)</em>
                    </p>
                    <div class="other-time">
                        <button type="button" class="now-time">
                            "16:50~19:28"
                            <i class="arr"></i>
                        </button>
                        <ul>
                            <!--버튼클릭시 li의 visibility :visible 으로 설정 -->
                            <li>
                                <button type="button" class="btn">"17:10~20:30"</button>
                            </li>
                            <li>
                                <button type="button" class="btn">"17:10~20:30"</button>
                            </li>
                            <li>
                                <button type="button" class="btn">"17:10~20:30"</button>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="img-card">
                    <img src="/resources/images/btn/SXTvhvgm4fbptvsfROZJoGb0DHYqiB1V_150.jpg" alt="" class="img-movie">
                </div>
                <div>
                    <div class="kind-seat">
                                <div class="seat-condition-choise" title="선택한 좌석"><em class="seat-em">선택</em></div>
                                <div class="seat-condition-finish" title="예매완료"><em class="seat-em">예매완료</em></div>
                                <div class="seat-condition-common" title="일반"><em class="seat-em">일반</em></div>
                                <div class="seat-condition-disabled" title="장애인석"><em class="seat-em">장애인석</em></div>
                        <!--선택하면 selected class들어감 -->
                    </div>
                    <div class="choise-seat">
                        <p class="tit-seat">선택좌석</p>
                        <!-- 좌석선택시 class가 choice로 바뀌고 title과 내용이 변경-->
                        <div class="wrap">
                            <div class="seat-position" title="구매가능좌석">-</div>
                            <div class="seat-position" title="구매가능좌석">-</div>
                            <div class="seat-position" title="구매가능좌석">-</div>
                            <div class="seat-position" title="구매가능좌석">-</div>
                            <div class="seat-position" title="구매가능좌석">-</div>
                            <div class="seat-position" title="구매가능좌석">-</div>
                        </div>
                    </div>
                </div>
                <div class="pay-area">
                    <p class="count">
                        <!--좌석선택시 span과 em의 내용이 바뀐다.-->
                        <!--<span></span> <em></em> -->
                        
                    </p>
                    <div class="pay">
                        <p class="tit-pay">최종결제금액</p>
                    </div>   
                    <div class="money">
                        <!--변경시 em태그의 숫자가 변경된다. -->
                        <em>0</em>
                        <span>원</span>
                    </div>
                </div>
                <div class="btn-group">
                    <a href="/ticketing/screenList" class="button" id="pagePrevious" title="이전">이전</a>
                    <a href="/ticketing/ticketingPay" class="button" id="pageNext" title="다음">다음</a>
                </div>
            </div>
        </div>
    </div>
    <form action="/ticketing" method="post" id="form-seat-ticket">
   	<!-- 티켓번호, 관람자 구분번호(이름에 맞게 name정하기), 인원수, 예매한 좌석번호, 상영요일, 상영시작시간, 관람료  -->
    	<input type="hidden" value="" name="adult"/>
    	<input type="hidden" value="" name="old-people"/>
    	<input type="hidden" value="" name="baby-people"/>
    	<input type="hidden" value="" name="adult-count"/>
    	<input type="hidden" value="" name="old-people-count"/>
    	<input type="hidden" value="" name="baby-people-count"/>
    	<input type="hidden" value="" name="ticketNo"/><!-- 전꺼 가져오기 model,요일, 시간 -->
    	<input type="hidden" value="" name="seat-No0"/>
    	<input type="hidden" value="" name="seat-No1"/>
    	<input type="hidden" value="" name="seat-No2"/>
    	<input type="hidden" value="" name="seat-No3"/>
    	<input type="hidden" value="" name="screen-day"/>
    	<input type="hidden" value="" name="screen-start-time"/>
    	<input type="hidden" value="" name="screen-end-time"/>
    	<input type="hidden" value="" name="ticketingpay"/>
    </form>
	<div id="document-modal">
        <div class="document-modal">
            <div class="document-modal-header">
                <h5 class="tit">알림</h5>
            </div>
            <div class="document-modal-body">
                <p class="dot-list">
                    <p>우대 요금으로 예매하신 고객님께서는 </p>
                    <p>상영관 입장 시 증빙서류를 제시해 주시기 바랍니다.</p>
                    <p>(미지참 시 입장제한)</p>
                    <p>- 장애인: 1~6급(복지카드)</p>
                    <p>- 국가유공자: (국가유공자증)</p>
                    <p>- 경로:만 65세 이상(신분증)</p>
                    <p>위 기재된 사항 외 우대 적용대상 고객님께서는 현장 매표소</p>
                    <p>에서 우대 발권이 가능합니다. 우대 요금 선택시 추가할인이</p>
                    <p>제한 될 수 있습니다. </p>
                    <p>* 일부 지점의 경우 경로 우대요금 미운영</p>
                <button type="button" class="btn-document-modal">확인</button>
            </div>
        </div>
     </div>
</div>
    <script type="text/javascript">
        $(function(){
        	
            $("#show-seat").append(function(){     	
	            let noSeat = ["A1","B1","C1","D1","F1","G1","A2","A3","S4","S5","S6","S7"]; //빈 좌석
	            let disabled =["A10","B10","B11"]; //장애인석
	            let seatcolumn = 'G';	//열의좌석 꺼내왔을 때 변수에 저장
	            let seatrow = 28;		//행의좌석 꺼내왔을 때 변수에 저장
	            let max = new Map();
          		max.set("A",0);
          		max.set("B",1);
          		max.set("C",2);
          		max.set("D",3);
          		max.set("E",4);
          		max.set("F",5);
          		max.set("G",6);
          		max.set("H",7);
          		max.set("I",8);
          		max.set("J",9);
          		max.set("K",10);
          		max.set("L",11);
          		max.set("M",12);
          		max.set("N",13);
          		max.set("O",14);
          		max.set("P",15);
          		max.set("Q",16);
          		max.set("R",17);
          		max.set("S",18);
          		max.set("T",19);
          		max.set("U",20);
          		max.set("V",21);
          		max.set("W",22);
          		max.set("X",23);
          		max.set("Y",24);
          		max.set("Z",25);
          	 
		   let count = 0;
		   let totalList = [];
		   const englishs =['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
   		   	            	
		   let resultNoSeatColumn = [];		//빈좌석 행에 대한 배열 초기화
           let noseatRow = [];		//빈좌석 열에 대한 배열 초기화
			   for(let i = 0; i < noSeat.length; i++) {
	            	resultNoSeatColumn.push(noSeat[i].slice(0,1)); //빈좌석 행을 나눔
	            	noseatRow.push(parseInt(noSeat[i].slice(1))); //빈좌석 행을 나눈것을 형변환
	            	 
	            }
				let resultDisabledColumn = [];	//장애인석 행에 대한 배열 초기화 나중에 예약완료석으로 변경예정
		        let disabledRow = [];		//장애인석 열에 대한 배열 초기화 나중에 예약완료석으로 변경예정
			 	for(let i = 0; i < disabled.length;i++){
			 		resultDisabledColumn.push(disabled[i].slice(0,1)); //장애인석 행을 나눔
			 		disabledRow.push(parseInt(disabled[i].slice(1)));//숫자로 변환하는 메소드
	           	}
		        
		     let disabledColumn = [];
			for(let i = 0; i<resultDisabledColumn.length;i++){
				disabledColumn.push(max.get(resultDisabledColumn[i]));
			}		
			 let noseatColumn = [];
			for(let i = 0; i<resultNoSeatColumn.length;i++){
				noseatColumn.push(max.get(resultNoSeatColumn[i]));
			}	
			let resultColumn = max.get(seatcolumn); 
	        //이제 화면에 뿌릴예정
	        let lefts = 106;
            let tops = 52;
            let input = "";
            let div = "";
            let $el = $(this);
	       	for(let i = 0; i<=resultColumn; i++) {
	       		div = document.createElement('div');
	       		$el.append(div);
	       		for(let j = 0; j<=seatrow; j++) {
	       			if(noseatColumn[i]==resultColumn[i]&&seatrow[j]==noseatRow[j]){
	       			 lefts += 20;
	       			 continue;
	       			}
	       			 input = document.createElement('input');
		   	       	 mapping(input,i,j);
		   	      	 input.type = "button";
		   	      	 input.setAttribute('class','seat-condition-common');
	              	 
	                 $(input).css('position','absolute');
	                 $(input).css('width','22px');
	                 $(input).css('heigh','18px');
	                 $(input).css('top',tops+'px');
	                 $(input).css('left',lefts+'px');
	                 $(input).css('margin','2px');
	                 //input.setAttribute('onclick','ticketing()');
	                  lefts += 20;
	                  $el.append(input);
	       			}
	       	 	 tops += 20;
              	 lefts = 106; 
	       		}
	       	lefts = 106;
            tops = 52;
            for(let i = 0; i<disabledColumn.length; i++){
            	div = document.createElement('div');
	       		$el.append(div);
            	for(let j = 0; j<disabledRow.length; j++) {
            		let addTop = tops +(disabledColumn[i]*20);
					 let addLefts = lefts +(disabledRow[j]*20);
					 input = document.createElement('input');
	       			 mapping(input,disabledColumn[i],disabledRow[j]);
	       			input.type = "button";
	       			input.setAttribute('class','seat-condition-disabled');
	                 $(input).css('position','absolute');
	                 $(input).css('width','22px');
	                 $(input).css('heigh','18px');
	                 $(input).css('top',addTop+'px');
	                 $(input).css('left',addLefts+'px');
	                 $(input).css('margin','2px');
	                 //input.setAttribute('onclick','ticketing()');
	                 $el.append(input);
	                 addTop = 0;
	                 addLefts = 0; 
            	}
            }
            lefts = 106;
            tops = 52;
            let empty = "";
            for(let i = 0; i<noseatColumn.length; i++){
					 empty =(resultNoSeatColumn[i]+noseatRow[i]);
					 let totalEmpty = $('input[value='+empty+']').remove();
	                 addTop = 0;
	                 addLefts = 0; 
            	}//글자 폰트 수정하기
        })
        })
       $('button.up').click(function(){ //증가버튼 클릭시 
    	   $('#shadow-modal').css('display','none');
    	   let who = $(this).attr("title");
    	   let now1 = $('button.now:eq(0)').text();
    	   let now2 = $('button.now:eq(1)').text();
    	   let now3 = $('button.now:eq(2)').text();
    	   let totalnow = parseInt(now1) + parseInt(now2) + parseInt(now3);
    	   if(totalnow == '4'){
       		alert("관람인원이 많습니다.코로나로 영화관은 4인까지 가능합니다.");
       		return;
       		}
    	   if(who === '성인 좌석 선택 증가'){
    		    let plusbtn = parseInt(now1)+1;
    		    $('button.up:eq(0)').prev().find('button').text(plusbtn);
	           	let textAdult = $('p.count span').text();
	           	if(textAdult.match("성인") == "성인") {
	           		$('em.adult_class').text(plusbtn);
	           	} else {
	           	 	$('p.count').append("<span class='adult_class'>성인</span><em class='adult_class'>"+plusbtn+"</em>");
	           	}
	           	let moneyAdult = Number($('.money em').text())+13000;
	           	$('.money em').text(moneyAdult);
	           	$('input[name=adult]').val('성인');
	           	$('input[name=adult-count]').val(plusbtn);
	           	let ticketPay = Number($('input[name=ticketingpay]').val()) +13000;
	           	$('input[name=ticketingpay]').val(ticketPay);
    	   } else if(who === '청소년 좌석 선택 증가'){
    		   let plusbtn1 = parseInt(now2)+1;
   		    	$('button.up:eq(1)').prev().find('button').text(plusbtn1);
	           	let textAdult = $('p.count span').text();
	           	if(textAdult.match("청소년") == "청소년") {
	           		$('em.baby_class').text(plusbtn1);
	           	} else {
	           	 	$('p.count').append("<span class='baby_class'>청소년</span><em class='baby_class'>"+plusbtn1+"</em>");
	           	}
	           	let moneyBaby = Number($('.money em').text())+10000;
	           	$('.money em').text(moneyBaby);
	           	$('input[name=baby-people]').val('청소년');
	           	$('input[name=baby-people-count]').val(plusbtn1);
	           	let ticketPay1 = Number($('input[name=ticketingpay]').val()) +10000;
	           	$('input[name=ticketingpay]').val(ticketPay1);
    	   } else if(who === '우대 좌석 선택 증가') {
    		   let plusbtn2 = parseInt(now3)+1;
  		    	$('button.up:eq(2)').prev().find('button').text(plusbtn2);
	           	let textAdult = $('p.count span').text();
	           	if(textAdult.match("우대") == "우대") {
	           		$('em.old_class').text(plusbtn2);
	           	} else {
	           	 	$('p.count').append("<span class='old_class'>우대</span><em class='old_class'>"+plusbtn2+"</em>");
	           	 	$('#document-modal').css('display','flex');
	           	}
	        	let moneyOld = Number($('.money em').text())+5000;
	           	$('.money em').text(moneyOld);
	           	$('input[name=old-people]').val('우대');
	           	$('input[name=old-people-count]').val(plusbtn2);
	        	let ticketPay2 = Number($('input[name=ticketingpay]').val()) +5000;
	           	$('input[name=ticketingpay]').val(ticketPay2);
    	   }
       })
       $('.btn-document-modal').click(function(){
    	   $('#document-modal').css('display','none');
       })
    	   $('button.down').click(function(){	//감소버튼 클릭시
    		   $('#shadow-modal').css('display','none');
        	   let who = $(this).attr("title");
        	   let now1 = $('button.now:eq(0)').text();
        	   let now2 = $('button.now:eq(1)').text();
        	   let now3 = $('button.now:eq(2)').text();
        	   let totalnow = parseInt(now1) + parseInt(now2) + parseInt(now3);
        	   if(totalnow == '0'){
        		    alert("관람인원을 선택하세요");
              		return;
        	   }
        	  	if(who === '성인 좌석 선택 감소'){
        		   if(now1 == '0') {
	           		    alert("관람인원을 선택하세요");
                 		return;
           	   		}
        		   let textAdult = $('p.count span').text();
        		   if(textAdult.match("성인") == "성인") {
        			  let minusbtn = parseInt(now1)-1;
        			  if(minusbtn==0){
        				  $('span.adult_class').remove();
	 					  $('em.adult_class').remove();
	 					  $('input[name=adult-count]').val(0);
	 					  let ticketPay = Number($('input[name=ticketingpay]').val())-13000;
    	    	          $('input[name=ticketingpay]').val(ticketPay);
        			  }	 						
        				  $('em.adult_class').text(minusbtn);
    		   	          $('button.down:eq(0)').next().find('button').text(minusbtn);
    				      let moneyAdult = Number($('.money em').text())-13000;
    	    	          $('.money em').text(moneyAdult);
    	    	          $('input[name=adult]').val('성인');
    	    	          $('input[name=adult-count]').val(minusbtn);
    	    	          let ticketPay = Number($('input[name=ticketingpay]').val())-13000;
    	    	          $('input[name=ticketingpay]').val(ticketPay);
        	} }
        		   else if(who === '청소년 좌석 선택 감소'){
        		   	if(now2 == '0'){
           		    	alert("관람인원을 선택하세요");
                 		return;
           	  		 }
        		    let textAdult = $('p.count span').text();
         		   if(textAdult.match("청소년") == "청소년") {
         			  let minusbtn = parseInt(now2)-1;
         			  if(minusbtn==0){
         				  $('span.baby_class').remove();
 	 					  $('em.baby_class').remove();
 	 					  $('input[name=baby-people-count]').val(0);
 	 					let ticketPay = Number($('input[name=ticketingpay]').val())-10000;
  	    	          $('input[name=ticketingpay]').val(ticketPay);
         			  }	 						
         				  $('em.baby_class').text(minusbtn);
     		   	          $('button.down:eq(1)').next().find('button').text(minusbtn);
     				      let moneyAdult = Number($('.money em').text())-10000;
     	    	          $('.money em').text(moneyAdult);
     	    	          $('input[name=baby-people]').val('청소년');
     	    	          $('input[name=baby-people-count]').val(minusbtn);
     	    	          let ticketPay = Number($('input[name=ticketingpay]').val())-10000;
     	    	          $('input[name=ticketingpay]').val(ticketPay);
         	} 
        	   } else if(who === '우대 좌석 선택 감소') { 
        		   if(now3 == '0'){
          		    	alert("관람인원을 선택하세요");
                		return;
          	  		 }
        		   let textAdult = $('p.count span').text();
         		   if(textAdult.match("우대") == "우대") {
         			  let minusbtn = parseInt(now3)-1;
         			  if(minusbtn==0){
         				  $('span.old_class').remove();
 	 					  $('em.old_class').remove();
 	 					  $('input[name=old-people-count]').val(0);
 	 					let ticketPay = Number($('input[name=ticketingpay]').val())-5000;
  	    	          $('input[name=ticketingpay]').val(ticketPay);
         			  }	 						
         				  $('em.old_class').text(minusbtn);
     		   	          $('button.down:eq(2)').next().find('button').text(minusbtn);
     				      let moneyAdult = Number($('.money em').text())-5000;
     	    	          $('.money em').text(moneyAdult);
     	    	          $('input[name=old-people]').val('청소년');
     	    	          $('input[name=old-people-count]').val(minusbtn);
     	    	          let ticketPay = Number($('input[name=ticketingpay]').val())-5000;
     	    	          $('input[name=ticketingpay]').val(ticketPay);
         	} 
        	   }
       })
       $('button.reset-button').click(function(){//초기화버튼
    	   let now1 = $('button.now:eq(0)').text();
    	   let now2 = $('button.now:eq(1)').text();
    	   let now3 = $('button.now:eq(2)').text();
    	   let totalnow = parseInt(now1) + parseInt(now2) + parseInt(now3);
    	   if(totalnow == '0'){
    		    alert("관람인원을 선택하세요");
          		return;
    	   }
    	   $('button.down:eq(0)').next().find('button').text(0);
    	   $('button.down:eq(1)').next().find('button').text(0);
    	   $('button.down:eq(2)').next().find('button').text(0);
    	   $('.money em').text(0);
    	   $('span.old_class').remove();
		   $('em.old_class').remove();
		   $('span.baby_class').remove();
		   $('em.baby_class').remove();
		   $('span.adult_class').remove();
		   $('em.adult_class').remove();
		   $('input[name=old-people-count]').val(0);
	       $('input[name=ticketingpay]').val(0);
	       $('input[name=baby-people-count]').val(0);
	       $('input[name=ticketingpay]').val(0);
	       $('input[name=adult-count]').val(0);
	       $('input[name=ticketingpay]').val(0);
    	   
       })
       let totalSeat = 0;
       $('div#show-seat').on("click","input[type=button].seat-condition-common",function(){
    	   let $seat = $(this);
    	   let now1 = $('button.now:eq(0)').text();
    	   let now2 = $('button.now:eq(1)').text();
    	   let now3 = $('button.now:eq(2)').text();
    	   let totalnow = parseInt(now1) + parseInt(now2) + parseInt(now3);
    	   let titleSeat = $('.seat-position').attr('title');
    	   if(totalSeat==totalnow){
    		   alert('관람인원이 많습니다.');
    		   return;
    	   }
    	   if(titleSeat.match('구매가능')=="구매가능"){
    			$('div.seat-position:eq(0)').attr("선택완료좌석");
    			$('div.seat-position:eq(0)').text($seat.val());
    			$('div.seat-position:eq(0)').attr('class','seat-all');
    			$seat.attr('class','seat-condition-choise');
    			$seat.css('color','gray');
    			$('input[name=seat-No'+totalSeat+']').val($seat.val());
    			totalSeat++;
    	   } 
       })
       $('div#show-seat').on("click","input[type=button].seat-condition-choise",function(){
    	   let $choiesSeat = $(this);
    	   $choiesSeat.attr('class','seat-condition-common');
		   $choiesSeat.css('color','white');
		   $('div.seat-all:last').attr("구매가능좌석");
		   $('div.seat-all:last').text('-');
		   $('div.seat-all:last').attr('class','seat-position');
		   $('input[name=seat-No'+totalSeat+']').val("");
		   totalSeat--;
		   console.log(totalSeat);
       })
         function countCoulumn(x, y){//화면에 뿌릴 전체 값 메소드
        	let countcolumns = [];
        	for(let i = 0; i < x.length; i++) {
        		countcolumns.push(y.findIndex((e) => e === x[i])); 
            }
        	return countcolumns;
         }

         function mapping(input,i,j) { //변환하는 메소드
        	 if (i === 0) {
        		 input.value = "A" + j;
             } else if (i === 1) {
            	 input.value = "B" + j;
             } else if (i === 2) {
            	 input.value = "C" + j;
             } else if (i === 3) {
            	 input.value = "D" + j;
             } else if (i === 4) {
            	 input.value = "E" + j;
             } else if (i === 5) {
            	 input.value = "F" + j;
             } else if (i === 6) {
            	 input.value = "G" + j;
             } else if (i === 7) {
            	 input.value = "H" + j;
             } else if (i === 8) {
            	 input.value = "I" + j;
             } else if (i === 9) {
            	 input.value = "J" + j;
             } else if (i === 10) {
            	 input.value = "K" + j;
             } else if (i === 11) {
            	 input.value = "L" + j;
             } else if (i === 12) {
            	 input.value = "M" + j;
             } else if (i === 13) {
            	 input.value = "N" + j;
             } else if (i === 14) {
            	 input.value = "O" + j;
             } else if (i === 15) {
            	 input.value = "P" + j;
             } else if (i === 16) {
            	 input.value = "Q" + j;
             } else if (i === 17) {
            	 input.value = "R" + j;
             } else if (i === 18) {
            	 input.value = "S" + j;
             } else if (i === 19) {
            	 input.value = "T" + j;
             } else if (i === 20) {
            	 input.value = "U" + j;
             } else if (i === 21) {
            	 input.value = "V" + j;
             } else if (i === 22) {
            	 input.value = "W" + j;
             } else if (i === 23) {
            	 input.value = "X" + j;
             } else if (i === 24) {
            	 input.value = "Y" + j;
             } else if (i === 25) {
            	 input.value = "Z" + j;
             } 
         }
    </script>
</body>
</html>