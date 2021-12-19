<%@page import="menu5.Menu5DTO"%>
<%@page import="menu5.Menu5DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateFormM5</title>
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
int num = Integer.parseInt(request.getParameter("num"));
Menu5DAO menu5dao = new Menu5DAO();
Menu5DTO  menu5dto  = menu5dao.getBoardM5(num);
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
<h1>글 내용수정</h1>
<article>
<form action="updateProM5.jsp" metdod="post">
<input type="hidden" name="num" value="<%=menu5dto.getNum()%>">
		<table  id="notice">
			<tr>
				<td class="ttitle">제목</td>
				<td><input type="text" name="ttitle" value="<%=menu5dto.getTtitle()%>"></td>
			</tr>
			<tr>
				<td class="category">카테고리</td>
				<td><input type="text" value="<%=menu5dto.getCategory()%>" readonly></td>
			</tr>
			<tr>
				<td class="content">글내용</td>
				<td><textarea name="content" ><%=menu5dto.getContent()%></textarea></td>
			</tr>
			<tr>
			<td>비밀번호</td><td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="작성완료"> <input
					type="reset" value="초기화"></td>
			</tr>
		</table>

	</form>
</article>
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