<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="/resources/css/screenList.css">
</head>
<body>
<%@ include file="../common/nav.jsp" %>
    <div class="container" style="width: 1250px;">
        <div class="row mb-3">
            <div class="col">
                <h2>빠른 예매</h2>
            </div>
        </div>
        <div class="col-10">
            <div class="my-box">
                <div class="day">
                    <button class="pre" type="button"></button>
                    <!-- 페이지 네이션으로 입력할 것 -->
                    <!--일에 따라서 class가 바뀐다. -->
                   	<div class="now-day">
                   	</div>
                    <button class="next" type="button"></button>
                    <button class="calender" type="button"></button>
                </div>
                <div class="movie-container">
                <div class="left-one">
                    <h3>영화</h3>
                    <div class="movie-name">
                        <button class="movie-name-button" type="button">전체</button>
                        <button class="movie-name-button" type="button">큐레이션</button>
                    </div>
                    <div class="movie-list">
                        <button class="movie-button" type="button" >
                            <img src="/resources/images/age/전체관람자.png" alt="allpeople"/>
                            <span class="txt">[불쇼이 발레 인 시네마]백조의 호수</span>
                            <img src="/resources/images/btn/ico-heart.png" alt="heart" class="buttonicon">
                        </button>
                        <button class="movie-button" type="button" >
                            <img src="/resources/images/age/전체관람자.png"/>
                            <span class="txt">[불쇼이 발레 인 시네마]백조의 호수</span>
                            <img src="/resources/images/btn/ico-heart.png" alt="heart" class="buttonicon">
                        </button>
                        <button class="movie-button" type="button" >
                            <img src="/resources/images/age/전체관람자.png"/>
                            <span class="txt">[불쇼이 발레 인 시네마]백조의 호수</span>
                            <img src="/resources/images/btn/ico-heart.png" alt="heart" class="buttonicon">
                        </button>
                        <button class="movie-button" type="button">
                            <img src="/resources/images/age/전체관람자.png"/>
                            <span class="txt">[불쇼이 발레 인 시네마]백조의 호수</span>
                            <img src="/resources/images/btn/ico-heart.png" alt="heart" class="buttonicon">
                        </button>
                        <button class="movie-button" type="button">
                            <img src="/resources/images/age/전체관람자.png"/>
                            <span class="txt">[불쇼이 발레 인 시네마]백조의 호수</span>
                            <img src="/resources/images/btn/ico-heart.png" alt="heart" class="buttonicon">
                        </button>
                        <button class="movie-button" type="button">
                            <img src="/resources/imagess/age/전체관람자.png"/>
                            <span class="txt">[불쇼이 발레 인 시네마]백조의 호수</span>
                            <img src="/resources/images/btn/ico-heart.png" alt="heart" class="buttonicon">
                        </button>
                        <button class="movie-button" type="button">
                            <img src="/resources/images/age/전체관람자.png"/>
                            <span class="txt">[불쇼이 발레 인 시네마]백조의 호수</span>
                            <img src="/resources/images/btn/ico-heart.png" alt="heart" class="buttonicon">
                        </button>
                        <button class="movie-button" type="button">
                            <img src="/resources/images/age/전체관람자.png"/>
                            <span class="txt">[불쇼이 발레 인 시네마]백조의 호수</span>
                            <img src="/resources/images/btn/ico-heart.png" alt="heart" class="buttonicon">
                        </button>
                    </div>
                    <div class="movie-img">
                        <!--영화 선택하지 않았을 때 -->
                        <!--<p>모든영화<br>
                        목록에서 영화를 선택하세요</p>-->
                       <!--영화를 하나라도 선택했을 때--> 
                        <div class="choice-list" id="choiceMovieList">
                            <img src="#">
                            <!--영화 이미지 소스가 들어간다. 선택된 영화에만 button이 출력된다. -->
                            <button type="button" class="del"></button>
                        </div>
                        <div class="choice-list" id="choiceMovieList">
                             <!--영화 이미지 소스가 들어간다.-->
                             <button type="button" class="del"></button>
                        </div>
                        <div class="choice-list" id="choiceMovieList">
                             <!--영화 이미지 소스가 들어간다.-->
                            <button type="button" class="del"></button>
                        </div>
                    </div>
                </div>
                <div class="center-one">
                    <h3>극장</h3>
                    <div class="theater-list">
                        <button class="theater-all-button">전체</button>
                        <button class="theater-spacial-button">특별관</button>
                    </div>
                    <div class="list-theater-detail">
                        <div class="all-theater-list">
                            <button class="list-theater-button">선호극장(count수)</button>
                            <button class="list-theater-button">서울(count수)</button>
                            <button class="list-theater-button">경기</button>
                            <button class="list-theater-button">인천</button>
                            <button class="list-theater-button">대전/충청/세종</button>
                            <button class="list-theater-button">부산/대구/경상</button>
                        </div>
                        <div class="theater-choies">
                            <button class="theater-choies-button">강남</button>
                            <button class="theater-choies-button">강남대로(씨티)</button>
                            <button class="theater-choies-button">강동</button>
                            <button class="theater-choies-button">군자</button>
                            <button class="theater-choies-button">동대문</button>
                            <button class="theater-choies-button">강남</button>
                            <button class="theater-choies-button">강남대로(씨티)</button>
                            <button class="theater-choies-button">강동</button>
                            <button class="theater-choies-button">군자</button>
                            <button class="theater-choies-button">동대문</button>
                            <button class="theater-choies-button">강남</button>
                            <button class="theater-choies-button">강남대로(씨티)</button>
                            <button class="theater-choies-button">강동</button>
                            <button class="theater-choies-button">군자</button>
                            <button class="theater-choies-button">동대문</button>
                        </div>
                    </div>
                    <div class="theater-choies-check">
                        <!--선택안했을 경우
                        <p class="check-content">전체극장<br>
                            목록에서 극장을 선택하세요
                        </p> -->
                        <!--선택했을 경우 클릭하면 입력되고 아니면 열리지 않는다.-->
                        <div class="check-theater">
                            <div class="detail-check-theater">
                                <p class="detail-text"><button type="button" class="detail-check"></button><br>
                                "목동"
                                </p>
                            </div>
                        </div>
                        <div class="check-theater">
                            <div class="detail-check-theater">
                                <button type="button" class="detail-check"></button>
                            </div>
                        </div>
                        <div class="check-theater">
                            <div class="detail-check-theater">
                                <button type="button" class="detail-check"></button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="right-one">
                    <h3>시간</h3>
                    <div class="time-check">
                        <button class="pre-time-button" ></button>
                        <button class="time-check-button" data-time="">13</button>
                        <button class="time-check-button" data-time="">14</button>
                        <button class="time-check-button" data-time="">15</button>
                        <button class="time-check-button" data-time="">16</button>
                        <button class="time-check-button" data-time="">17</button>
                        <button class="time-check-button" data-time="">18</button>
                        <button class="time-check-button" data-time="">19</button>
                        <button class="time-check-button" data-time="">20</button>
                        <button class="time-check-button" data-time="">21</button>
                        <button class="time-check-button" data-time="">22</button>
                        <button class="next-time-button" ></button>
                    </div>
                    <div class="movie-check">
                        <button type="button"  class="btn-on" id="2201171311021" >
                            <div class="legend"></div>
                            <span class="time">
                                <strong title="상영시작">17:25</strong>
                                <em title="상영종료">~20:13</em>
                            </span>
                            <span class="title">
                                <strong title="하우스 오브 구찌">하우스 오브 구찌</strong>
                                <em>2D(자막)</em>
                            </span>
                            <div class="info">
                                <span class="theater" title="극장">
                                    상봉<br>
                                    6층 4관[백신패스관]
                                </span>
                                <span class="seat">
                                    <strong class="now" title="잔여 좌석">95</strong>
                                    <em class="all" title="전체 좌석">/154</em>
                                </span>
                            </div>
                        </button>
                        <button type="button"  class="btn-on" id="2201171311021">
                            <div class="legend"></div>
                            <span class="time">
                                <strong title="상영시작">17:25</strong>
                                <em title="상영종료">~20:13</em>
                            </span>
                            <span class="title">
                                <strong title="하우스 오브 구찌">하우스 오브 구찌</strong>
                                <em>2D(자막)</em>
                            </span>
                            <div class="info">
                                <span class="theater" title="극장">
                                    상봉<br>
                                    6층 4관[백신패스관]
                                </span>
                                <span class="seat">
                                    <strong class="now" title="잔여 좌석">95</strong>
                                    <em class="all" title="전체 좌석">/154</em>
                                </span>
                            </div>
                        </button>
                        <button type="button"  class="btn-on" id="2201171311021">
                            <div class="legend"></div>
                            <span class="time">
                                <strong title="상영시작">17:25</strong>
                                <em title="상영종료">~20:13</em>
                            </span>
                            <span class="title">
                                <strong title="하우스 오브 구찌">하우스 오브 구찌</strong>
                                <em>2D(자막)</em>
                            </span>
                            <div class="info">
                                <span class="theater" title="극장">
                                    상봉<br>
                                    6층 4관[백신패스관]
                                </span>
                                <span class="seat">
                                    <strong class="now" title="잔여 좌석">95</strong>
                                    <em class="all" title="전체 좌석">/154</em>
                                </span>
                            </div>
                        </button>
                        <button type="button"  class="btn-on" id="2201171311021" >
                            <div class="legend"></div>
                            <span class="time">
                                <strong title="상영시작">17:25</strong>
                                <em title="상영종료">~20:13</em>
                            </span>
                            <span class="title">
                                <strong title="하우스 오브 구찌">하우스 오브 구찌</strong>
                                <em>2D(자막)</em>
                            </span>
                            <div class="info">
                                <span class="theater" title="극장">
                                    상봉<br>
                                    6층 4관[백신패스관]
                                </span>
                                <span class="seat">
                                    <strong class="now" title="잔여 좌석">95</strong>
                                    <em class="all" title="전체 좌석">/154</em>
                                </span>
                            </div>
                        </button>
                        <button type="button"  class="btn-on" id="2201171311021" >
                            <div class="legend"></div>
                            <span class="time">
                                <strong title="상영시작">17:25</strong>
                                <em title="상영종료">~20:13</em>
                            </span>
                            <span class="title">
                                <strong title="하우스 오브 구찌">하우스 오브 구찌</strong>
                                <em>2D(자막)</em>
                            </span>
                            <div class="info">
                                <span class="theater" title="극장">
                                    상봉<br>
                                    6층 4관[백신패스관]
                                </span>
                                <span class="seat">
                                    <strong class="now" title="잔여 좌석">95</strong>
                                    <em class="all" title="전체 좌석">/154</em>
                                </span>
                            </div>
                        </button>
                        <button type="button"  class="btn-on" id="2201171311021">
                            <div class="legend"></div>
                            <span class="time">
                                <strong title="상영시작">17:25</strong>
                                <em title="상영종료">~20:13</em>
                            </span>
                            <span class="title">
                                <strong title="하우스 오브 구찌">하우스 오브 구찌</strong>
                                <em>2D(자막)</em>
                            </span>
                            <div class="info">
                                <span class="theater" title="극장">
                                    상봉<br>
                                    6층 4관[백신패스관]
                                </span>
                                <span class="seat">
                                    <strong class="now" title="잔여 좌석">95</strong>
                                    <em class="all" title="전체 좌석">/154</em>
                                </span>
                            </div>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <div class="footer">
            <div class="advertise-footer">
                <img src="/resources/images/btn/광고.jpg" alt="advertisement">
            </div>
        </div>
      </div>
</body>
<script type="text/javascript">
	$(function(){
		const dataDate = new Date();
		let year = dataDate.getFullYear();
		let month = dataDate.getMonth()+1;
		let dataDay = dataDate.getDate();
		let dayLabel = dataDate.getDay();
		const reserveDate = $('div.now-day');
		
		const weekOfDay = ["일", "월", "화", "수", "목", "금", "토"];
		let thisWeek = [];
		let button = "";
		let spanWeekOfDay = "";
		let spanDay = "";
		let div = "";
		for(let i = 0 ; i<=11 ; i++) {
			div = document.createElement("div");
			button = document.createElement("button");
			spanWeekOfDay = document.createElement("span");
			spanDay = document.createElement("strong");
			button.setAttribute("mon");
			spanWeekOfDay.classList = 'movie-week-of-day';
			spanDay.classList ='movie-day';
			let resultDay = new Date(year, month, dataDay +(i-dayLabel));
			
			let yyyy = resultDay.getFullYear();
			let mm = Number(resultDay.getMonth())+1;
			let dd = resultDay.getDate();
			let d = resultDay.getDay();
			
			mm = String(mm).length === 1 ? '0'+mm : mm;
			dd = String(dd).length === 1 ? '0'+dd : dd;
			d = String(d).length === 1 ? '0'+d : d;
			spanWeekOfDay.innerHTML = mm;
			button.append(spanWeekOfDay);
			spanDay.innerHTML = dd;
			button.append(spanDay);
			reserveDate.append(button);
			
			thisWeek[i] = yyyy + "-" + mm +'-' +dd +'-'+d ;
		
			
			dayClickEvent(button);
		}
		
		function dayClickEvent(button){
			$('.mon').on('click',function(){
				const movieDateActive = $('.mon-active');
				movieDateActive.forEach((list) =>{
					list.classList.remove('.mon-active');
				})
				button.classList.add(".mon-active");
			})
		}
		
		
	})
</script>
</html>