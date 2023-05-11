<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="/jf/resources/css/bootstrap.css">
</head>
<body>
<%@include file="../common/navigation.jsp" %>

<div class="pop-contents fav-cgv">
        <!-- Contents Addon -->
            <div class="sect-cgv-control">
                <h2 class="hidden">자주가는 지역 및 영화관 선택</h2>
                <p>영화관을 선택하여 등록해주세요. <strong>최대 5개까지</strong> 등록하실 수 있습니다.</p>
                <p>
                    <select id="select_region" name="" title="자주가는 지역선택">                        
                    <option value="" selected="selected">지역선택</option><option value="12">강원</option><option value="02">경기</option><option value="204">경상</option><option value="206">광주</option><option value="11">대구</option><option value="03">대전</option><option value="05">부산</option><option value="01">서울</option><option value="207">울산</option><option value="202">인천</option><option value="04">전라</option><option value="06">제주</option><option value="205">충청</option></select>
                    <select id="select_theater" name="" title="자주가는 CGV선택">                        
                    <option value="" selected="selected">극장선택</option></select> 
                    <button id="btn_add_favorite_theater" type="button" class="round inblack on"><span>자주가는 CGV 추가</span></button>
                </p>
            </div>
            <div class="sect-favorite-control">
                <h2><strong>최은정님</strong>이 자주 가는 CGV</h2>
                <div class="theater-choice">
                    <ul>
                        <li>
                            <div class="box-polaroid">
                                <div class="box-inner">
                                    <div class="theater">CGV창원더시티</div>
                                    <button type="button">CGV창원더시티 삭제</button>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="box-polaroid">
                                <div class="box-inner">
                                    <div class="theater">CGV창원</div>
                                    <button type="button">CGV창원 삭제</button>
                                </div>
                            </div>
                        </li>
                        <li class="">
                            <div class="box-polaroid">
                                <div class="box-inner">
                                    <div class="theater">CGV천호</div>
                                    <button type="button">CGV천호 삭제</button>
                                </div>
                            </div>
                        </li>
                        <li class="first-child">
                            <div class="box-polaroid">
                                <div class="box-inner">
                                    <div class="theater">CGV피카디리1958</div>
                                    <button type="button">CGV피카디리1958 삭제</button>
                                </div>
                            </div>
                        </li>
                        <li class="">
                            <div class="box-polaroid">
                                <div class="box-inner">
                                    <div class="theater">CGV용산아이파크몰</div>
                                    <button type="button">CGV용산아이파크몰 삭제</button>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

            <!-- 동의 -->
			<div class="tbl-breakdown-re marginT20" id="fav_agree">
				<table style="width:100%;" summary="개인정보 취급 방침 안내 표">
					<caption>개인정보 취급 방침 안내</caption>
					<colgroup>
						<col style="width:18%;">
						<col style="width:44%;">
						<col style="width:20%;">
						<col style="width:18%;">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">항목</th>
							<th scope="col">이용목적</th>
							<th scope="col">보유기간</th>
							<th scope="col">동의여부</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">자주가는CGV (최대 5개)</th>
							<td>
								<ul class="dep1_lst">
									<li class="dep1_lst_li">·상품 결제시(영화 예매시) 편의 제공
										<ul class="dep2_lst">
											<li class="dep2_lst_li">- 선호극장의 상영작 및 상영시간 우선 제공</li>
										</ul>
									</li>
								</ul>
							</td>
							<td>별도 동의 철회시까지 또는 약관 철회 후 1주일까지</td>
							<td>
								<!-- 동의함 또는 동의안함 체크시 inp_inbox에 on 클래스 toggle 처리 필요 -->
								<span class="inp_inbox">
									<input name="agree_chk1" id="agreeChk1-1" type="radio" value="Y" checked="checked"><label for="agreeChk1-1">동의함</label>
								</span>
								<span class="inp_inbox on">
									<input name="agree_chk1" id="agreeChk1-2" type="radio" value="N"><label for="agreeChk1-2">동의안함</label>
								</span>
							</td>
						</tr>
					</tbody>
				</table>
				<p id="ctl00_PlaceHolderContent_p_agree" class="marginT10">※ 동의를 거부하시는 경우에도 본 서비스 외 다른 CGV 서비스를 이용하실 수 있습니다.</p>
			</div>
            <!-- //동의 -->

			<div class="set-btn fix-width">
                <button type="button" id="btnCancel" class="round gray"><span>취소</span></button>
                <button type="submit" id="btnSave" class="round inred"><span>등록하기</span></button> 
            </div>

        <!-- //Contents Addon -->
        </div>

<%@include file="../common/footer.jsp" %>
</body>
</html>