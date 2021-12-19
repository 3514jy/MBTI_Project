<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="script1.js"></script>
 <!-- 우편 주소 검색 api -->
 
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function kakaopost() {
    new daum.Postcode({
        oncomplete: function(data) {
           document.querySelector("#address").value = (data.zonecode+" "+data.address);
        }
    }).open();
}


	


</script>
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="join.jsp">회원가입</a></li>
<li><a href="#">Privacy policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1>회원 가입</h1>
<form action="joinPro.jsp" id="join" method="post" onsubmit="return checkForm()">
<fieldset>
<legend>필수 기재</legend>
<label>아이디</label>
<input type="text" name="id" class="id" id="uID" >
<input type="button" value="중복확인" class="dup" ><br> <!-- onclick="checkID()" -->
<div id="dupdiv"></div><div></div>
<label>비밀번호</label>
<input type="password" name="pass" id="pass"><br>
<label>비밀번호 재확인</label>
<input type="password" name="pass2" id="pass2"><br>
<label>이 름</label>
<input type="text" name="name" id="name"><br>
<label>이메일</label>
<input type="text" name="email" id="email">@
<select name ="email2">
	<option>이메일은 선택해주세요</option>
	<option value="naver.com" >naver.com</option>
	<option value="nate.com" >nate.com</option>
	<option value="gmail.com" >gmail.com</option>
	<option value="yahoo.com" >yahoo.com</option>
	<option value="hanmail.net">hanmail.net</option>
	<option value="daum.net">daum.net</option>
	<option >그외 직접입력</option>
</select><br>
<label>MBTI</label>
<input type="radio" name="MBTI" value="INTJ" id="MBTI"> INTJ
<input type="radio" name="MBTI" value="INTP" id="MBTI"> INTP
<input type="radio" name="MBTI" value="INFJ" id="MBTI"> INFJ
<input type="radio" name="MBTI" value="INFP" id="MBTI"> INFP
<input type="radio" name="MBTI" value="ISTJ" id="MBTI"> ISTJ
<input type="radio" name="MBTI" value="ISTP" id="MBTI"> ISTP
<input type="radio" name="MBTI" value="ISFJ" id="MBTI"> ISFJ
<input type="radio" name="MBTI" value="ISFP" id="MBTI"> ISFP<br>
<input type="radio" name="MBTI" value="ENTJ" id="MBTI"> ENTJ
<input type="radio" name="MBTI" value="ENTP" id="MBTI"> ENTP
<input type="radio" name="MBTI" value="ENFJ" id="MBTI"> ENFJ
<input type="radio" name="MBTI" value="ENFP" id="MBTI"> ENFP
<input type="radio" name="MBTI" value="ESTJ" id="MBTI"> ESTJ
<input type="radio" name="MBTI" value="ESTP" id="MBTI"> ESTP
<input type="radio" name="MBTI" value="ESFJ" id="MBTI"> ESFJ
<input type="radio" name="MBTI" value="ESFP" id="MBTI"> ESFP

</fieldset>

<fieldset>
<legend>선택 사항</legend>
<label>주소</label>
<input type="text" name="address" id="address" >
<input type ="text" name="address2" id="address2" placeholder="상세주소를 입력해주세요">
<input type="button" value="주소찾기" onclick="kakaopost()"><br>



<label>휴대 전화</label>
<input type="text" name="phone" id="phone"><br>
<label>모바일 전화</label>
<input type="text" name="mobile" id="mobile"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="회원가입" class="submit">
<input type="reset" value="초기화" class="cancel">
</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>