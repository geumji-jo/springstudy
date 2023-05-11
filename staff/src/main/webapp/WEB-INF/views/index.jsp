<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<script>

	$(function() {					// (바디 를먼저 읽고)사원등록,사원조회를 읽고 나서 펑션이벤트를 시작해라(로드이벤트)
		fnList();					//$(document).on('ready',function() {
	})							    //fnList();
									//})
		
	
	
	
	function fnList() {
		$.ajax({
			type: 'get',
			url: '${contextPath}/list.json',
			dataType: 'json',
			success: function(resData) {	// resData = [{},{},{}]
				$('#staffList').empty();	// 반복문이 시작하기 전에 초기화를 해줘야한다.그래야 돌릴때마다 데이터가 누적되지 않음
				$.each(resData, function(i, staff){	// 반복문시작
					let str = '<tr>';
					str += '<td>' + staff.sno;
					str += '<td>' + staff.name;
					str += '<td>' + staff.dept;
					str += '<td>' + staff.salary;
					$('#staffList').append(str);
					
					
				})
			}
		})
	}
	
	function fnAdd() {
		$.ajax({
			type: 'post',
			url: '${contextPath}/add.do',
			data: $('#frm_add').serialize(),
			dataType: 'text',
			success: function(resData) {	//resData : 사원 등록이 성공했습니다.
				alert(resData);
				fnList();
				$('#sno').val('');
				$('#name').val('');
				$('#dept').val('');
			},
			error: function(jqXHR) {	//jqXHR.responseText : 사원 등록이 실패했습니다.
				alert(jqXHR.responseText);
				
			}
			
			
		})
		
	}


</script>
<body>
	
	<div>
		<h3>사원등록</h3>
		<form id="frm_add">
			<input type="text" name="sno" id="sno" placeholder="사원번호">
			<input type="text" name="name" id="name" placeholder="사원명">
			<input type="text" name="dept" id="dept" placeholder="부서명">
			<input type="button" value="등록" onclick="fnAdd()">
		</form>
	</div>
	
	<hr>
	
	<div>
		<h3>사원조회</h3>
		<form id="frm_search">
			<input type="text" name="query" id="query" placeholder="사원번호입력">
			<input type="button" value="조회" onclick="fnSearch()">
			<input type="button" value="전체" onclick="fnList()">
		</form>
	</div>
	
	<hr>
	
	<div>
		<h3>사원목록</h3>
		<table border="1">
			<thead>
				<tr>
					<td>사원번호</td>
					<td>사원명</td>
					<td>부서명</td>
					<td>연봉</td>
				</tr>
			</thead>
			<tbody id="staffList"></tbody>
		</table>
	</div>
	
</body>
</html>