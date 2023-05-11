<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/jf/resources/bootstrap/css/bootstrap.min.css">
    <script src="/jf/resources/bootstrap/js/jquery.min.js"></script>
    <script src="/jf/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #fdfcf0;">
    <div>
        <%@include file="../../common/admin.jsp"%>
        <div class="container text-center">
            <div style="margin-top: 40px; margin-bottom: 40px;">
                <FONT face="Impact" style="font-size: 50px;">
                	Registration
                </FONT>
            </div>
        </div>
    </div>
    <div class="container well">
        <form method="post" action="insertMovie.jf" enctype="multipart/form-data">
            <div class="row">
                <div class="col-sm-6 text-center" style="margin-top: 5px;">
                    <img src="/jf/photos/movieposters/default.jpg" id="poster-box" class="img-thumbnail" width="200" height="280" />
                    <input type="file" name="poster" id="poster-image">
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>영화이름(한국어)</label>
                        <input type="text" class="form-control" name="korTitle">
                    </div>
                    <div class="form-group">
                        <label>영화이름(영어)</label>
                        <input type="text" class="form-control" name="engTitle">
                    </div>
                    <div class="form-group">
                        <label>영화감독</label>
                        <input type="text" class="form-control" name="director">
                    </div>
                    <div class="form-group">
                        <label>영화배우</label>
                        <input type="text" class="form-control" name="actors">
                    </div>
                    <div class="form-group">
                        <label>제작국가</label>
                        <select class="form-control" name="country">
                            <option value="선택"> 선택</option>
                            <option value="한국"> 한국</option>
                            <option value="미국"> 미국</option>
                            <option value="일본"> 일본</option>
                            <option value="중국"> 중국</option>
                            <option value="홍콩"> 홍콩</option>
                            <option value="프랑스"> 프랑스</option>
                            <option value="영국"> 영국</option>
                            <option value="독일"> 독일</option>
                            <option value="인도"> 인도</option>
                            <option value="기타"> 기타</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="form-group">
                        <label>영화개봉일</label> <input type="date" name="releaseDate" /><br />
                    </div>
                    <div class="form-group">
                        <label>영화상영시간</label> <input type="text" name="runningTime" /><br />
                    </div>
                    <div class="form-group">
                        <label>영화장르</label>
                        <div class="radio">
                            <label class="radio-inline"> <input type="radio" name="genre" value="가족" ${movie.genre=='가족' ? 'checked' : '' }> 가족</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="호러" ${movie.genre=='호러' ? 'checked' : '' }> 호러</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="드라마" ${movie.genre=='드라마' ? 'checked' : '' }> 드라마</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="SF" ${movie.genre=='SF' ? 'checked' : '' }> SF</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="멜로" ${movie.genre=='멜로' ? 'checked' : '' }> 멜로</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="코미디" ${movie.genre=='코미디' ? 'checked' : '' }> 코미디</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="애니메이션" ${movie.genre=='애니메이션' ? 'checked' : '' }> 애니메이션</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="느와르" ${movie.genre=='느와르' ? 'checked' : '' }> 느와르</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="단편" ${movie.genre=='단편' ? 'checked' : '' }> 단편</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="다큐멘터리" ${movie.genre=='다큐멘터리' ? 'checked' : '' }> 다큐멘터리</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="로드무비" ${movie.genre=='로드무비' ? 'checked' : '' }> 로드무비</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="무협" ${movie.genre=='무협' ? 'checked' : '' }> 무협</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="뮤지컬" ${movie.genre=='뮤지컬' ? 'checked' : '' }> 뮤지컬</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="뮤직" ${movie.genre=='뮤직' ? 'checked' : '' }> 뮤직</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="미스터리" ${movie.genre=='미스터리' ? 'checked' : '' }> 미스터리</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="범죄" ${movie.genre=='범죄' ? 'checked' : '' }> 범죄</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="옴니버스" ${movie.genre=='옴니버스' ? 'checked' : '' }> 옴니버스</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="서부" ${movie.genre=='서부' ? 'checked' : '' }> 서부</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="스릴러" ${movie.genre=='스릴러' ? 'checked' : '' }> 스릴러</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="스포츠" ${movie.genre=='스포츠' ? 'checked' : '' }> 스포츠</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="시대극" ${movie.genre=='시대극' ? 'checked' : '' }> 시대극</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="아동" ${movie.genre=='아동' ? 'checked' : '' }> 아동</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="액션" ${movie.genre=='액션' ? 'checked' : '' }> 액션</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="어드벤처" ${movie.genre=='어드벤처' ? 'checked' : '' }> 어드벤처</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="역사" ${movie.genre=='역사' ? 'checked' : '' }> 역사</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="전기" ${movie.genre=='전기' ? 'checked' : '' }> 전기</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="전쟁" ${movie.genre=='전쟁' ? 'checked' : '' }> 전쟁</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="종교" ${movie.genre=='종교' ? 'checked' : '' }> 종교</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="재난" ${movie.genre=='재난' ? 'checked' : '' }> 재난</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="청춘영화" ${movie.genre=='청춘영화' ? 'checked' : '' }> 청춘영화</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="퀴어" ${movie.genre=='퀴어' ? 'checked' : '' }> 퀴어</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="환타지" ${movie.genre=='환타지' ? 'checked' : '' }> 환타지</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="학원물" ${movie.genre=='학원물' ? 'checked' : '' }> 학원물</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="에로" ${movie.genre=='에로' ? 'checked' : '' }> 에로</label>
                            <label class="radio-inline"> <input type="radio" name="genre" value="없음" ${movie.genre=='없음' ? 'checked' : '' }> 없음</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>관람가</label>
                        <div class="radio">
                            <label class="radio-inline">
                                <input type="radio" name="ageLimit" value="0"> 전체관람가
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="ageLimit" value="12"> 12세관람가
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="ageLimit" value="15"> 15세관람가
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="ageLimit" value="18"> 청소년관람불가
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                    	<label>트레일러</label> <input type="text" name="trailer" /><br />
                        <label>스틸컷</label> <input type="file" name="steelCut" /><br />
                        <label>영화줄거리</label>
                        <textarea class="form-control" rows="10" name="info"></textarea>
                    </div>
                    <div class="text-right">
                        <input type="button" class="btn btn-default" value="뒤로가기" onclick="history.back(-1);">
                        <input type="submit" class="btn btn-primary" value="등록완료">
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
<script type="text/javascript">
    function readURL(input) {

        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
                $('#poster-box').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }
    $("#poster-image").change(function() {
        readURL(this);
    });
</script>

</html>