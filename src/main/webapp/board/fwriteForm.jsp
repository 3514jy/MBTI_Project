<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<style type="text/css">

textarea{
	min-height: 200px;
}
</style>
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img"></div>
<!-- 메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">

<ul>
<li><a href="../center/notice.jsp">MBTI이야기</a></li>
<li><a href="../fcenter/fnotice.jsp">다운로드</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<%
String id=(String)session.getAttribute("id");
//세션값이 없으면 login.jsp 이동
if(id==null){
	response.sendRedirect("../member/login.jsp");
}
%>
<form action="fwritePro.jsp" method="post" enctype="multipart/form-data">
										<!--multipart/form-data첨부파일이 있으면 꼭 붙혀야한다.  -->
<article>
<table id="notice">

<tr><td class="twrite">글쓴이</td><td><input type="text" name="twrite" value="<%=id%>" readonly></td></tr>
<tr><td class="ttitle">제목</td><td><input type="text" name="ttitle"></td></tr>
<tr><td class="ttitle">파일첨부</td><td><input type="file" name="file" ></td></tr>
<tr><td class="content" colspan="2">글내용</td></tr>
<tr><td colspan="2"><textarea name="content" role="50" cols="80"></textarea></td></tr>
<tr><td class="pass">비밀번호</td><td><input type="password" name="pass"></td></tr>
<tr><td colspan="2">
	<input type="submit" value="작성완료">	
	<input type="reset" value="초기화">
</td></tr>
</table>
</article>
</form>
</body>
</html>