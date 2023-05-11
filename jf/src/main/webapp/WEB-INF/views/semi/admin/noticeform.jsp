<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<body style="background-color: #fdfcf0;">
	<div >
       <%@include file="../../common/admin.jsp"%>
	    </div>
		<div class="container">
		    <div style="margin-top: 40px; margin-bottom: 40px;">
			    <FONT face="Impact" style="font-size: 50px;">
					NOTICE
				</FONT>
	   		</div>
			<div>
				<form method="post" action="addnotice.jf" >
					<table class="table  table-bordered">
		               <tr class="active">
		                    <th class="col-sm-2 text-center ">
		                        <label>제목</label>
		                    </th>
		                    <td class="col-sm-10">
		                        <input type="text" class="form-control"  name="title"/>
		                   </td>
		               </tr>
		                <tr class="active">
		                <th class="text-center" >
		                    <label>내용</label>
		                </th>
		                <td class="col-sm-10">
		                    <textarea class="form-control " id="" cols="100" rows="10" name="contents"></textarea>
		                </td>
		                </tr>
					</table>
					<div class="text-right">
				    	<button class="btn btn-info " onclick="location.href='addnotice.jf'" > 공지등록 </button>
				    </div>
				</form>
		    </div>		
		</div>
		<div style="margin-bottom: 400px;"></div>
	</div>
	<%@include file="../../common/footer.jsp" %>
</body>
</html>