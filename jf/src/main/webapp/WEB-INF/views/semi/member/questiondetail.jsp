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
    <link rel="stylesheet" href="/jf/resources//bootstrap/css/mycgv.css">
</head>

<body>
    <%@include file="../../common/navigation.jsp"%>
    <div class="container">
        <div class="row" style="margin-top: 20px;">
        <%@include file="../../common/customerCenterLeft.jsp" %>
            <div class="col-sm-10">
                <div class="row">
	                <div class="col-sm-12">
	                    <h4><strong>1대1 문의</strong></h4><br />
	                </div>
	                <div style="font-size:13px;" class="col-sm-12">
	                	<div class="row qna_row_1 qna_row_1_1">
	                		<div class="col-sm-12">
	                			<span style="font-weight:bold;">고객 정보</span>
	                		</div>
	                	</div>
		                <div class="row qna_row_1">
		                	<div class="col-sm-2">
		                		이름
		                	</div>
		                	<div class="col-sm-10">
		                		<span>${LOGINMEMBER.name }</span>
		                	</div>
		                </div>
		                <div class="row qna_row_1">
		                	<div class="col-sm-2">
		                		휴대전화
		                	</div>
		                	<div class="col-sm-4">
		                		<span>${LOGINMEMBER.phone }</span>
		                	</div>
		                	<div class="col-sm-1">
		                		이메일
		                	</div>
		                	<div class="col-sm-4">
		                		<span>${LOGINMEMBER.email }</span>
		                	</div>
		                </div>
		                <div class="row qna_mainrow1" style="background-color:#f6f1dc; margin-top:40px;">
		                	<div class="col-sm-2">
		                		<img src="/jf/photos/qnaIMG.PNG" alt="" />
		                	</div>
		                	<div class="col-sm-10">
		                		<div class="row qna_top_1_2">
		                			<span class="qna_top_1_2_span">고객님의 문의에 답변하는 직원은 <span>고객 여러분의 가족 중 한 사람</span>일 수 있습니다.</span>
		                		</div>
		                		<div class="row qna_top_1_2 qna_top_1_3">
		                			<strong>JF는</strong> 고객의 언어폭력(비하, 욕설, 반말, 성희롱 등)으로부터 고객상담직원을 보호하기 위해
		                		</div>
		                		<div class="row qna_top_1_2 qna_top_1_3">
		                			관련 법에 따라 수사기관에 필요한 조치를요구할 수 있으며, 형법에 의해 처벌 대상이 될 수 있습니다.
		                		</div>
		                	</div>
		                </div>
		                
                        <form action="insertQuestion.jf" method="post">
                            <div class="form-group">
                                                    <input type="hidden" name="choice" value="1" checked="checked">
                                    <div class="row qna_main_row_2 qna_main_row_2_1">
                                    	<div class="col-sm-1 " style="">
                                    		<span style="font-size:13px; font-weight:bold; position: relative; top:5px;"> 지역선택 <span style="color:red; font-size:1px;" class="glyphicon glyphicon-asterisk"></span></span>
                                    	</div>
                                        <div class="col-sm-2">
                                            <select style="background-color : rgb(252, 254, 238) !important;" class="form-control regionChoice" name="city" onchange="showTheaters(this.value)">
                                                <option value="" selected="selected">지역선택</option>
                                                <c:forEach var="city" items="${cities }">
                                                    <option value="${city }">${city }</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-sm-1" style="padding: 5px 0px;">
                                        	<span style="font-size:13px; font-weight:bold; position:relative; top:2px; letter-spacing: -1px;">영화관선택 <span style="color:red; font-size:1px;" class="glyphicon glyphicon-asterisk"></span></span>
                                        </div>
                                        <div class="col-sm-2">
                                            <select style="background-color : rgb(252, 254, 238) !important;" class="form-control regionChoice" name="theater" id="theater-box">
                                                <option value="" selected="selected">영화관선택</option>
                                            </select>
                                        </div>
                                    </div>
                            </div>
                            <div class="form-group">
	                            <div class="row qna_main_row_2">
	                            	<div class="col-sm-1">
	                            		<label style="position : relative; top:7px;">제목 <span style="color:red; font-size:1px;" class="glyphicon glyphicon-asterisk"></span></label>
	                            	</div>
	                            	<div class="col-sm-11">
	                            		<input style="background-color : rgb(252, 254, 238) !important; height:30px; border: 1px solid #cccccc;" type="text" class="form-control" name="questionTitle" />	
	                            	</div>
	                            </div>
                            </div>
                            <div class="form-group">
                            	<div class="row qna_main_row_2">
                            		<div class="col-sm-1">
                            			<label>내용 <span style="color:red; font-size:1px;" class="glyphicon glyphicon-asterisk"></span></label>		
                            		</div>
                            		<div class="col-sm-11">
                            			<textarea style="background-color : rgb(252, 254, 238) !important; border: 1px solid #cccccc;" class="form-control" rows="10" name="questionContent"></textarea>		
                            		</div>
                            	</div>
                            </div>
                            <div style="margin-top:20px;" class="text-right">
                            	<input type="reset" class="btn btn-sm btn-default" value="취소" onclick="history.back(-1);">
                                <input type="submit" class="btn btn-sm btn-danger" value="등록하기">
                            </div>
                        </form>
                         </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../../common/footer.jsp"%>

    <script type="text/javascript">
        function showTheaters(city) {
            // XMLHttpRequest 객체 생성
            var xhr = new XMLHttpRequest();

            // 성공적으로 응답이 왔을 때 실행될 코드 적어놓는 곳
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    // xhr이 받아온 값을 JSON표기법으로 꺼내서 theaters 변수에 담기
                    var theaters = JSON.parse(xhr.responseText);

                    // 빈 문자열 생성
                    var htmlContents = "";

                    // 받아온 배열의 길이만큼 반복하면서 html 코드 만들어서 htmlContents에 담기
                    for (var i = 0; i < theaters.length; i++) {
                        htmlContents += '<option value="' + theaters[i].no + '">';
                        htmlContents += theaters[i].name;
                        htmlContents += "</option>";
                    }
                    // 아이디에 해당하는 태그 찾아서 html소스 넣기
                    document.getElementById('theater-box').innerHTML = htmlContents;
                }
                
                
                
                
            }
            // xhr을 보낼 때 요청 방식, 요청 uri 적기
            xhr.open("GET", "showtheaters.jf?city=" + city);
            xhr.send();
        }
    </script>
</body>

</html>