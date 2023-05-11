<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="header">
	<nav class="navbar navbar-expand-lg navbar-light bg-top" id="navbar-top">
		<div class="container p-0">
			<div class="collapse navbar-collapse">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a href="#" class="nav-link ">VIP LOUNGE</a></li>
					<li class="nav-item"><a href="#" class="nav-link ">멤버십</a></li>
					<li class="nav-item"><a href="#" class="nav-link ">고객센터</a></li>
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item"><a href="#" class="nav-link" data-bs-toggle="modal" data-bs-target="#loginModal">로그인</a></li>
					<li class="nav-item"><a href="#" class="nav-link">회원가입</a></li>
					<li class="nav-item"><a href="#" class="nav-link">빠른예매</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<nav class="navbar navbar-expand-lg navbar-light" id="navbar-2">
		<div class="container p-0">
			<div class="collapse navbar-collapse justify-content-start">
				<ul class="navbar-nav util-list">
					<li class="nav-item">
					<a class="nav-link" href="#"><img src="/resources/images/nav/ico-sitemap.png"></a>
					</li>
	
					<li class="nav-item dropdown"><a class="nav-link" href="#"
						id="navbarDropdown" role="button" data-bs-toggle="dropdown"
						aria-expanded="false"> <img
							src="/resources/images/nav/ico-search.png">
					</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown" style="">
							<div class="search-box p-3">
								<form action="">
		     		 				<input class="form-control" type="search" name="keyword" value="" placeholder="영화를 검색하세요!" aria-label="Search">
		      						<button class="btn btn-sm" type="button"><img src="/resources/images/nav/ico-search.png"></button>
		    					</form>
							</div>
						</ul>
					</li>
				</ul>
			</div>
			<div class="collapse navbar-collapse justify-content-center" id="navbarNav">
				<ul class="navbar-nav ">
					<li class="nav-item"><a class="nav-link" href="/movie/list">영화</a></li>
					<li class="nav-item"><a class="nav-link" href="#">예매</a></li>
					<li class="nav-item"><a class="nav-link" href="#">극장</a></li>
					<li class="nav-item"><a class="nav-link" href="#" style="font-family: 'Alfa Slab One'; font-weight: 400;">HTA CINEMA</a></li>
					<li class="nav-item"><a class="nav-link" href="#">이벤트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">스토어</a></li>
					<li class="nav-item"><a class="nav-link" href="#">혜택</a></li>
				</ul>
			</div>
			<div class="collapse navbar-collapse justify-content-end">
				<ul class="navbar-nav util-list">
					<li class="nav-item"><a class="nav-link" href="#"><img src="/resources/images/nav/ico-schedule.png"></a></li>
					<li class="nav-item"><a class="nav-link" href="#"><img src="/resources/images/nav/ico-mymega.png"></a></li>
				</ul>
			</div>
		</div>
	</nav>
</div>
<!-- 로그인 모달 -->
<div class="modal fade" id="loginModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">로그인</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form method="post" action="login.do">
					<input type="text" class="form-control" name="id" />
					<input type="password" class="form-control mt-3" name="password" />
					<div class="form-check mt-3">
						<input class="form-check-input" type="checkbox" value="checked" id="flexCheckChecked" name="saveId" checked>
						<label class="form-check-label" for="flexCheckChecked">
							아이디 저장
						</label>
					</div>
					<div class="d-grid">
						<button type="submit" class="btn btn-primary mt-3">로그인</button>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				
			</div>
		</div>
	</div>
</div>