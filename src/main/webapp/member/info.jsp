<%@page import="member.MemberDTO1"%>
<%@page import="member.MemberDAO1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<li><a href="info.jsp">내정보보기</a></li>
<li><a href="deleteForm.jsp">회원정보탈퇴</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<%
// 세션값 가져오기
String id=(String)session.getAttribute("id");
// MemberDAO 객체생성
MemberDAO1 memberDAO=new MemberDAO1();
// id정보를 조회 MemberDTO getMember(id) 메서드 정의
// MemberDTO  memberDTO = getMember(id) 메서드 호출
MemberDTO1 memberDTO=memberDAO.getmember1(id);
%>
<h1><%=memberDTO.getId()%>님의 정보</h1>

<fieldset>
<legend>회원 정보 보기</legend>
<label>아이디</label>
<input type="text" name="id" class="id" value="<%=id %>" readonly><br>
<label>Name</label>
<input type="text" name="name" value="<%=memberDTO.getName()%>" readonly><br>
<label>이메일</label>
<input type="text" name="email" value="<%=memberDTO.getEmail()%>" readonly>
<br>

<label>MBTI</label>
<input type="text" value="<%=memberDTO.getMbti()%>">
</fieldset>

<fieldset>
<legend>선택 사항</legend>
<label>주소</label>
<input type="text" name="address" value="<%=memberDTO.getAddress()%>" readonly>
<input type="text" name="address" value="<%=memberDTO.getAddress2()%>" readonly><br>
<label>휴대전화</label>
<input type="text" name="phone" value="<%=memberDTO.getPhone()%>" readonly><br>
<label>모바일전화</label>
<input type="text" name="mobile" value="<%=memberDTO.getMobile()%>" readonly><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="button" value="회원정보수정" onclick="location.href='update.jsp'">
</div>

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