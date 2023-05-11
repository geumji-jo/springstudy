<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="bootstrap-3.3.2-dist/js/jquery.min.js"></script>
  <script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="/jf/resources/bootstrap/css/customercenter-noticelist.css">
</head>
<body  style="background-color: #fdfcf0;">
			<%@include file="../../common/admin.jsp"%>
		   	<div class="container">
		   		<div style="margin-top: 40px; margin-bottom: 40px;">
				    <FONT face="Impact" style="font-size: 50px;">
						NOTICE
					</FONT>
		   		</div>
			    
			    <br />
				    <div class="text-right" >
					    <button class="btn btn-sm btn-warning" style="color:white;" onclick="location.href='noticelist.jf?pno=1'">목록</button>
			        </div>
			    <br />
			    	
				    <table class="table tbl_area" >
				        <thead>
				            <tr class="tr_background">
				                <th class="col-sm-7">${notice.title }</th>
				                <th class="col-sm-3">등록일 <fmt:formatDate value="${notice.createDate }"/></th>
				                <th class="col-sm-2">조회수 ${notice.views }</th>
				            </tr>
				        </thead>
				        <tbody class="active">
				        <tr>
			               <td colspan="3">${notice.contents }</td>
				        </tr>
				        </tbody>
				    </table>
				    <hr style="border:solid 0.5px gray;"/>
				    <div class="text-right" >
					    <button class="btn btn-sm btn-default" style="background-color: black; color:white;" onclick="location.href='noticemodifyform.jf?nno=${notice.no}'">수정</button>
					    <button class="btn btn-sm btn-danger" style="color:white;" onclick="location.href='noticedetaildelete.jf?nno=${notice.no}'">삭제</button>
			        </div>
			       
			       
	            </div>
	        
	<%@include file="../../common/footer.jsp" %>
</body>
</html>