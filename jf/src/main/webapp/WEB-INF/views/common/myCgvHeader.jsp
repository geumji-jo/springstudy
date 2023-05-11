<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row">
			<div class="col-sm-12 mycgv-info"></div>
			<div class="row info-contents">
				<div class="col-sm-2">
					<div class="profile-photo">
						<img
							src="http://img.cgv.co.kr/WebApp/images/couplingclub/config/img_character_09.png"
							alt="프로필사진">
					</div>
				</div>
				<div class="col-sm-10 mycgv_user_info">
					<div class="row">
						<div class="col-sm-12">
							<div class="info-content2">
								<span id="info-name">${LOGINMEMBER.name }님</span>
								<div id="info-id">
									ID : <strong>${LOGINMEMBER.id}</strong> <br /> NickName : <strong>${LOGINMEMBER.nickName }</strong>
								</div>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="info-content3">
								<span id="info-info">phone : ${LOGINMEMBER.phone }</span> <span
									id="info-info">e-mail : ${LOGINMEMBER.email }</span> <span
									id="info-info">birth : <fmt:formatDate
										value="${LOGINMEMBER.birth }" pattern="yyyy-MM-dd" />
								</span>
							</div>
						</div>
					</div>
					<div class="info-content4 info-ul">
						<div class="mycgv_myFT_div">
							<span id="my-movie">My Favorite Theaters</span> <span
								class="mycgv_setMyTheater"><a style="color: #D9C787;"
								href="" data-toggle="modal" data-target="#exampleModal">자주가는
									극장 설정<span class="glyphicon glyphicon-cog"></span>
							</a></span>
						</div>
						<ul>
							<c:forEach var="m" items="${MyTheaters }">
								<li><a href="/jf/cgv/cgvtheaters.jf?tno=${m.theaterNo }">${m.theaterName }</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>