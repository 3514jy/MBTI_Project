<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고민상담</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<style type="text/css">
#footer{
margin-top: 100px;
}

</style>
</head>
<body>
<%
String id=(String)session.getAttribute("id");
//세션값이 없으면 login.jsp 이동
if(id==null){
	response.sendRedirect("../member/login.jsp");
}
%>
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
<li><a href="menu_5.jsp">고민을 털어내세요</a></li>
<li><a href="menu_5_2.jsp">고민을 덜어주세요</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<h1>고민을 털어놔 보세요</h1>
<div>
</div>


<!-- 게시판 리스트 -->
<jsp:include page="../고민상담/writeForm5.jsp"></jsp:include>

<!-- 내용 -->
<!-- 본문 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<div id="footer">
<jsp:include page="../inc/bottom.jsp"></jsp:include>
</div>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>
