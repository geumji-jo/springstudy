<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>영화 그 이상의 감동. CGV</title>
  <link rel="shortcut icon" href="/jf/photos/cj_logo.ico" />
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/jf/resources/bootstrap/css/bootstrap.min.css">
  <script src="/jf/resources/bootstrap/js/jquery.min.js"></script>
  <script src="/jf/resources/bootstrap/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="/jf/resources/bootstrap/css/reservation.css">
</head>
<body>
<%@ include file="../../common/navigation.jsp" %>
	<div class="container">
		<div class="row text-center">
			<div class="col-sm-4 text-center" style="font-size: 200%; margin-top: 10px; width: 100%; height: 300px;">
				<h1 style="margin-top: 110px;">성공적으로 예매가 완료되었습니다.</h1>
			</div>
		</div>
	</div>
<%@ include file="../../common/footer.jsp" %>
<script type="text/javascript">
	function returnmain() {
		location.href = '/jf/member/mycgvpage.jf';
	}
	
	setTimeout(returnmain, 2000);
</script>
</body>
</html>