<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <div class="row text-center">
               <div class="col-sm-10">
                    <ul class="pagination">
	                    <li><a href="">&laquo</a></li>
                    		<c:forEach var="a" begin ="1" end="${totalreviewsCount }">
	                    		<li class="${(empty param.rno ? 1 : param.rno) eq a? 'active' : '' }"><a href="gpa.jf?mno=${param.mno }&rno=${a}">${a}</a></li>
                    		</c:forEach>
	                    <li><a href="">&raquo</a></li>
                    </ul>
               </div>
            </div>