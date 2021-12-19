/**
 * script.js
 */
function CheckValue(obj){ //obj로 전달받는 값은 배열
	var value = 0;
	for(var i=0; i<obj.length; i++){
		if(obj[i].checked == true){//라디오버튼과 체크박스는 checked라는 속성이 부여
			value = 1;
			break;
		}

	}
	if(value == 0){ //라디오버튼 또는 체크박스에 체크하지 않았다면
		return false;
	} 
	else {
		return true;
	}
	
}// CheckValue()
//
/*아이디 중복체크 함수1 팝업을 이용한 호출 button onclick에 함수명을 넣을때*/
/*function CheckId() {
//		alert("함수호출");
	var uID=$("input[id='uID']");
	if(uID.val()==""){
		alert("아이디 입력하세요");
		uID.focus();
		return false;
	}
	//창열기
	window.open("idCheck.jsp?uID="+uID.val(),"","width=500,height=300");
}//CheckId*/

	/*아이디 중복체크 함수1 ajax를 통해 */
	// <input type="button" value="dup. check" class="dup"> 클릭했을때 
	// html 문서가 실행이 준비 되면 => 동작
	$(document).ready(function(){	
		// 버튼을 클릭했을때
		$('.dup').click(function(){
//			alert("클릭이벤트");
			// idCheck2.jsp에 아이디를 들고 가서  아이디를 중복체크 아이디 중복, 아이디 사용가능 출력
		$.ajax('idCheck2.jsp',{
			data:{uID:$('#uID').val()},
			success:function(rdata){
				//#dupdiv 대상에  가져온 값을 출력
				$('#dupdiv').html(rdata);
			}
		});	
		});
	});



//로그인시 미입력 액션 함수
function checkForm(){
	var pass = $("input[id='pass']");
	var pass2 = $("input[id='pass2']");
	var name = $("input[id='name']");
	var MBTI = $("input[id='MBTI']");
	var email =$("input[id='email']");
	var uID = $("input[id='uID']");
	

	if(uID.val()==""){
	alert("아이디 입력하세요");
	uID.focus();
	return false;
	}

		
	if (pass.val() == "") {
			alert("비밀번호를 입력하세요.");
			pass.focus();
			return false;
	}
	// 비밀번호 비밀번호2 확인 일치 여부
	if(pass.val() != pass2.val()){
			//두 비밀번호가 일치하지 않습니다. 경고메세지창
			alert("두 비밀번호가 일치하지 않습니다.");
			//비밀번호 확인 입력 공간에 입력되어 있는 정보들을 빈공백을 주어 제거
			pass2.value = pass2.val("");
			return false;
	}
	
	
	if (name.val() == "") {
			alert("이름을 입력하세요.");
			name.focus();
			return false;
	}
	
		if (email.val() == "") {
			alert("이메일을 입력하세요");
			name.focus();
			return false;
	}

	if(!CheckValue(MBTI)){
			alert("MBTI를 선택해 주세요");
			return false;
	}

	

	
	
}