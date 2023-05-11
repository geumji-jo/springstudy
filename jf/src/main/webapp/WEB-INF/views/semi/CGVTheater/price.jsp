<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>극장 &lt; 관람가격 안내 | 영화 그 이상의 감동. CGV</title>
<link rel="shortcut icon" href="/jf/photos/cj_logo.ico" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/main.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/header.css" />
<link rel="stylesheet" href="/jf/resources/bootstrap/css/event.css" />
<link rel="stylesheet" href="/jf/resources/bootstrap/css/footer.css" />
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Nunito"
	rel="stylesheet">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/GPA.css">
<link rel="stylesheet" href="/jf/resources/bootstrap/css/CGVtheater.css" />
<link rel="stylesheet" href="/jf/resources/bootstrap/css/mymoviegpa.css" />
<link rel="stylesheet" href="/jf/resources/bootstrap/css/price.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="/jf/resources/bootstrap/js/gpaHeader.js"></script>
</head>

<body>
	<!--  헤더 시작  -->
	<%@ include file="../../common/navigation.jsp"%>
	<!--      헤더 끝  -->
	<div class="container">
		<div class="row GPA_header_col_1">
			<div class="col-sm-4">
				<span class="GPA_left_1 price_left_1">관람가격 안내</span>
			</div>
			<div class="col-sm-12">
				<hr class="event_hr_2" />
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3 text-center">
				<span class="price_notice_div">Standard Zone 가격 안내</span>
			</div>
			<div class="col-sm-8 col-sm-offset-2 text-center price_description">
				<span class="price_1_1"><span class="red">Prime Zone:</span>
					Standard Zone 가격 + 1,000원 / <span class="yellow">Economy
						Zone:</span> Standard Zone 가격 - 1,000원<br /> (단, 모닝 시간대는 Zone별 관람가격이
					동일합니다.)</span>
			</div>
		</div>
		<div class="row">

			<!-- 1개 테이블 시작-->
			<div class="col-sm-6">
				<table class="table table-condensed table-bordered price_table">
					<caption class="price_caption">
						<div class="price_circle"></div>
						일반(2D)
					</caption>
					<col-group>
					<col width="30%">
					<col width="30%">
					<col width="20%">
					<col width="20%">
					</col-group>
					<tr class="price_table_tr">
						<th>요일</th>
						<th>시간대</th>
						<th>일반</th>
						<th>청소년</th>
					</tr>
					<tr class="text-center">
						<td rowspan="7"><span class="price_table_date">주중</span></td>
					</tr>
					<tr class="text-center" class="text-center">
						<td>모닝( 06:00~ )</td>
						<td>7,000</td>
						<td>6,000</td>
					</tr>
					<tr class="text-center">
						<td>브런치( 10:01~ )</td>
						<td>9,000</td>
						<td>7,000</td>
					</tr>
					<tr class="text-center">
						<td>데이라이트( 13:01~ )</td>
						<td>9,000</td>
						<td>7,000</td>
					</tr>
					<tr class="text-center">
						<td>프라임( 16:01~ )</td>
						<td>9,000</td>
						<td>7,000</td>
					</tr>
					<tr class="text-center">
						<td>문라이트( 22:01~ )</td>
						<td>9,000</td>
						<td>7,000</td>
					</tr>
					<tr class="text-center">
						<td>나이트( 24:01~ )</td>
						<td>8,000</td>
						<td>7,000</td>
					</tr>
				</table>
			</div>
			<!-- 1개 테이블 끝-->

			<!-- 1개 테이블 시작-->
			<div class="col-sm-6">
				<table
					class="table table-condensed table-condensed table-bordered price_table">
					<caption class="price_caption">
						<div class="price_circle"></div>
						일반(3D)
					</caption>
					<col-group>
					<col width="30%">
					<col width="30%">
					<col width="20%">
					<col width="20%">
					</col-group>
					<tr class="price_table_tr">
						<th>요일</th>
						<th>시간대</th>
						<th>일반</th>
						<th>청소년</th>
					</tr>
					<tr class="text-center">
						<td rowspan="7"><span class="price_table_date">월~목</span></td>
					</tr>
					<tr class="text-center" class="text-center">
						<td>모닝( 06:00~ )</td>
						<td>9,000</td>
						<td>8,000</td>
					</tr>
					<tr class="text-center">
						<td>브런치( 10:01~ )</td>
						<td>10,000</td>
						<td>9,000</td>
					</tr>
					<tr class="text-center">
						<td>데이라이트( 13:01~ )</td>
						<td>11,000</td>
						<td>9,000</td>
					</tr>
					<tr class="text-center">
						<td>프라임( 16:01~ )</td>
						<td>12,000</td>
						<td>9,000</td>
					</tr>
					<tr class="text-center">
						<td>문라이트( 22:01~ )</td>
						<td>11,000</td>
						<td>9,000</td>
					</tr>
					<tr class="text-center">
						<td>나이트( 24:01~ )</td>
						<td>10,000</td>
						<td>9,000</td>
					</tr>
				</table>
			</div>
			<!-- 1개 테이블 끝-->

			<!-- 1개 테이블 시작-->
			<div class="col-sm-6">
				<table class="table table-condensed table-bordered price_table">
					<caption class="price_caption">
						<div class="price_circle"></div>
						SCREENX (2D)
					</caption>
					<col-group>
					<col width="30%">
					<col width="30%">
					<col width="20%">
					<col width="20%">
					</col-group>
					<tr class="price_table_tr">
						<th>요일</th>
						<th>시간대</th>
						<th>일반</th>
						<th>청소년</th>
					</tr>
					<tr class="text-center">
						<td rowspan="7"><span class="price_table_date">월~목</span></td>
					</tr>
					<tr class="text-center" class="text-center">
						<td>모닝( 06:00~ )</td>
						<td>7,000</td>
						<td>6,000</td>
					</tr>
					<tr class="text-center">
						<td>브런치( 10:01~ )</td>
						<td>9,000</td>
						<td>7,000</td>
					</tr>
					<tr class="text-center">
						<td>데이라이트( 13:01~ )</td>
						<td>9,000</td>
						<td>7,000</td>
					</tr>
					<tr class="text-center">
						<td>프라임( 16:01~ )</td>
						<td>9,000</td>
						<td>7,000</td>
					</tr>
					<tr class="text-center">
						<td>문라이트( 22:01~ )</td>
						<td>13,000</td>
						<td>9,000</td>
					</tr>
					<tr class="text-center">
						<td>나이트( 24:01~ )</td>
						<td>12,000</td>
						<td>9,000</td>
					</tr>

				</table>
			</div>
			<!-- 1개 테이블 끝-->

			<!-- 1개 테이블 시작-->
			<div class="col-sm-6">
				<table class="table table-condensed table-bordered price_table">
					<caption class="price_caption">
						<div class="price_circle"></div>
						SCREENX(SCREENX 3D)
					</caption>
					<col-group>
					<col width="30%">
					<col width="30%">
					<col width="20%">
					<col width="20%">
					</col-group>
					<tr class="price_table_tr">
						<th>요일</th>
						<th>시간대</th>
						<th>일반</th>
						<th>청소년</th>
					</tr>
					<tr class="text-center">
						<td rowspan="7"><span class="price_table_date">월~목</span></td>
					</tr>
					<tr class="text-center" class="text-center">
						<td>모닝( 06:00~ )</td>
						<td>7,000</td>
						<td>6,000</td>
					</tr>
					<tr class="text-center">
						<td>브런치( 10:01~ )</td>
						<td>9,000</td>
						<td>7,000</td>
					</tr>
					<tr class="text-center">
						<td>데이라이트( 13:01~ )</td>
						<td>9,000</td>
						<td>7,000</td>
					</tr>
					<tr class="text-center">
						<td>프라임( 16:01~ )</td>
						<td>9,000</td>
						<td>7,000</td>
					</tr>
					<tr class="text-center">
						<td>문라이트( 22:01~ )</td>
						<td>16,000</td>
						<td>13,000</td>
					</tr>
					<tr class="text-center">
						<td>나이트( 24:01~ )</td>
						<td>15,000</td>
						<td>12,000</td>
					</tr>

				</table>
			</div>
			<!-- 1개 테이블 끝-->

		</div>
	</div>

	<!-- Footer -->
	<%@ include file="../../common/footer.jsp"%>
	<!-- footer -->
</body>

</html>