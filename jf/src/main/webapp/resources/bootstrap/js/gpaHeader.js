function goMyGpa(event,member,from){
	event.preventDefault();
	if(member == 2){
		var result = confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?");
   		if(result && from == 'myMovieGpa'){
   			$(".GPA1").removeClass("gpa_active");
   			$(".GPA2").addClass("gpa_active");
			location.href = '/jf/member/login.jf?from='+from+'&toggleNo=2';
			return;
		}
	} else{
    		location.href = '/jf/member/mymoviegpa.jf?toggleNo=2';
	}
}
function checkId() {
	var userId = document.getElementById("user-id").value;
	var msgbox = document.getElementById("msg-box");

	if (userId.length < 6) {
		msgbox.textContent = "아이디는 6글자 이상 12글자 이하 입력해야 합니다.";
		msgbox.style.fontSize = "13px";
		msgbox.style.color = "red";
		id = false;
		return;
	} else if (6 <= userId.length <= 12) {
		msgbox.textContent = "아이디의 길이가 적절합니다.";
		msgbox.style.fontSize = "13px";
		msgbox.style.color = "green";
		id = true;
		return;
	}

}


function toggleLike(no){
	if(no ==1){
		$('.GOB1').addClass('goodOrBad_selected');
		$('.GOB2').removeClass('goodOrBad_selected');
		$('.hiddenText').attr('value',1);
		return;
	}
	if(no ==0){
		$('.GOB2').addClass('goodOrBad_selected');
		$('.GOB1').removeClass('goodOrBad_selected');
		$('.hiddenText').attr('value',2);
		return;
	}
}

function goWish(event, movieNo) {
	
	event.preventDefault();
	if(member==""){
		
		var result = confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?");
		if(result){
			location.href = '/jf/member/login.jf?from='+from;
			return;
		}
	} else{
		var result = confirm("위시리스트에 등록하시겠습니까?");
    	if (result) {
    		var xhr = new XMLHttpRequest();
    		xhr.onreadystatechange = function(){
    			if(xhr.readyState == 4 && xhr.status == 200){
    				var result2 = confirm("위시리스트에 등록되었습니다. 위시리스트로 이동하시겠습니까?");
    				if(result2){
    					location.href="/jf/member/wishlist.jf";
    				} else{
    					window.location.replace("/jf/movie/"+from+".jf?mno="+movieNo);
    				}
    			}
    		}
		xhr.open("GET", "/jf/member/ajax_process_addNewWishList.jf?mno=" + movieNo);
	    xhr.send();
		}
	}
}
function goWishRemoveInChart(event,movieNo){
	event.preventDefault();
	location.href = '/jf/member/process_removeWishListinChart.jf?mno=' + movieNo+'&from='+from;
	alert('위시리스트에서 삭제되었습니다.');
}
//비밀번호 확인







