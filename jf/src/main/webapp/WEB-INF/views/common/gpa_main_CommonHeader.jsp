<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<div class="row GPA_header_col_1">
			<div class="col-sm-2">
				<span class="GPA_left_1">평점</span>
			</div>
			<div class="col-sm-4 col-sm-offset-6 GPA_header text-right">
				<a href="/jf/movie/gpa.jf?toggleNo=1">
					<span class="GPA GPA1 ${toggleNo eq 1 ? 'gpa_active' : '' }">
						<span class="glyphicon glyphicon-play"></span>일반평점
					</span>
				</a>
				<a onclick="goMyGpa(event,${not empty LOGINMEMBER ? 1 : 2},'myMovieGpa');" href="#">
					<span class="GPA GPA2 ${toggleNo eq 2 ? 'gpa_active' : '' }">
					<span class="glyphicon glyphicon-play"></span>내가 쓴 평점</span>
				</a>
			</div>
		</div>
