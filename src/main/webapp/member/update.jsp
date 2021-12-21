<%@page import="member.MemberDTO1"%>
<%@page import="member.MemberDAO1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
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
<li><a href="update.jsp">회원정보수정</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<%
// 세션값 가져오기
String id=(String)session.getAttribute("id");
// MemberDAO 객체생성
MemberDAO1 memberDAO1=new MemberDAO1();
// id정보를 조회 MemberDTO getMember(id) 메서드 정의
// MemberDTO  memberDTO = getMember(id) 메서드 호출
MemberDTO1 memberDTO1=memberDAO1.getmember1(id);
%>
<h1>회원정보 수정</h1>
<form action="updatePro.jsp" id="join" method="post" >
<fieldset>
<legend>기본 정보</legend>
<label>아이디</label>
<input type="text" name="id" class="id" value="<%=id %>" readonly><br>
<label>비밀번호</label>
<input type="password" name="pass"><br>
<label>이름</label>
<input type="text" name="name" value="<%=memberDTO1.getName()%>"><br>
<label>이메일</label>
<input type="text" name="email" value="<%=memberDTO1.getEmail()%>"><br>

<label>MBTI</label> 
<input type="radio" name="MBTI"  value="INTJ" <%if(memberDTO1.getMbti().contains("INTJ")) {%> checked <%} %>> INTJ
<input type="radio" name="MBTI" value="INTP" <%if(memberDTO1.getMbti().contains("INTP")) {%> checked <%} %>> INTP
<input type="radio" name="MBTI" value="INFJ" <%if(memberDTO1.getMbti().contains("INFJ")) {%> checked <%} %>> INFJ
<input type="radio" name="MBTI" value="INFP"  <%if(memberDTO1.getMbti().contains("INFP")) {%> checked <%} %>> INFP
<input type="radio" name="MBTI" value="ISTJ"  <%if(memberDTO1.getMbti().contains("ISTJ")) {%> checked <%} %>> ISTJ
<input type="radio" name="MBTI" value="ISTP"  <%if(memberDTO1.getMbti().contains("ISTP")) {%> checked <%} %>> ISTP
<input type="radio" name="MBTI" value="ISFJ"  <%if(memberDTO1.getMbti().contains("ISFJ")) {%> checked <%} %>> ISFJ
<input type="radio" name="MBTI" value="ISFP"  <%if(memberDTO1.getMbti().contains("ISFP")) {%> checked <%} %>> ISFP<br>
<input type="radio" name="MBTI" value="ENTJ"  <%if(memberDTO1.getMbti().contains("ENTJ")) {%> checked <%} %>> ENTJ
<input type="radio" name="MBTI" value="ENTP"  <%if(memberDTO1.getMbti().contains("ENTP")) {%> checked <%} %>> ENTP
<input type="radio" name="MBTI" value="ENFJ"  <%if(memberDTO1.getMbti().contains("ENFJ")) {%> checked <%} %>> ENFJ
<input type="radio" name="MBTI" value="ENFP"  <%if(memberDTO1.getMbti().contains("ENFP")) {%> checked <%} %>> ENFP
<input type="radio" name="MBTI" value="ESTJ"  <%if(memberDTO1.getMbti().contains("ESTJ")) {%> checked <%} %>> ESTJ
<input type="radio" name="MBTI" value="ESTP"  <%if(memberDTO1.getMbti().contains("ESTP")) {%> checked <%} %>>ESTP
<input type="radio" name="MBTI" value="ESFJ" <%if(memberDTO1.getMbti().contains("ESFJ")) {%> checked <%} %>>ESFJ
<input type="radio" name="MBTI" value="ESFP"  <%if(memberDTO1.getMbti().contains("ESFP")) {%> checked <%} %>> ESFP
</fieldset>

<fieldset>
<legend>선택사항</legend>


<label>주소</label>
<input type="text" name="address" id="address" value="<%=memberDTO1.getAddress()%>">
<input type ="text" name="address2" value="<%=memberDTO1.getAddress2()%>">
<input type="button" value="주소찾기" onclick="kakaopost()"><br>
<label>전화번호</label>
<input type="text" name="phone" value="<%=memberDTO1.getPhone()%>"><br>
<label>휴대전화번호</label>
<input type="text" name="mobile" value="<%=memberDTO1.getMobile()%>"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="수정" class="submit">
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