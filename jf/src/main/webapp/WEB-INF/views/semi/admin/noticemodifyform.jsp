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
</head>
<body  style="background-color: #fdfcf0;">
	<div>
		<%@include file="../../common/admin.jsp"%>
		<div class="container">
		    <div style="margin-top: 40px; margin-bottom: 40px;">
			    <FONT face="Impact" style="font-size: 50px;">
					NOTICE
				</FONT>
	   		</div>
		
	   		<form method="post" action="noticemodify.jf?nno=${notice.no}" >
				<table class="table  table-bordered">
	               <tr class="active">
	                    <th class="col-sm-2 text-center ">
	                        <label>제목</label>
	                    </th>
	                    <td class="col-sm-10">
	                        <input type="text" class="form-control"  name="title" value="${notice.title }"/>
	                   </td>
	               </tr>
	                <tr class="active">
	                <th class="text-center" >
	                    <label>내용</label>
	                </th>
	                <td class="col-sm-10">
	                    <textarea class="form-control " id="" cols="100" rows="10" name="contents" >${notice.contents }</textarea>
	                </td>
	                </tr>
				</table>
				<div class="text-right">
			    	<button type="submit" class="btn btn-info " > 공지수정 </button>
			    </div>
			</form>
		</div>
	</div>
</body>
</html>