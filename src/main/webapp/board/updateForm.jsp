<%@page import="board.BoardDTO1"%>
<%@page import="board.BoardDAO1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateForm.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
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
int num = Integer.parseInt(request.getParameter("num"));
BoardDAO1 boardDAO = new BoardDAO1();
BoardDTO1 boardDTO = boardDAO.getBoard(num);
%>
<h1>글 내용 수정</h1>
<article>
<form action="updatePro.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="num" value="<%=boardDTO.getNum()%>">
<table border="1" id="notice">
<tr>
	<td>작성자</td><td><input type="text" name=twrite value="<%=boardDTO.getTwrite()%>"></td>
	<td>작성일자</td><td><input type="text" name=date value="<%=boardDTO.getDate() %>" readonly></td>
</tr>
<tr>
	<td>글제목</td><td><input type="text" name =ttitle value="<%=boardDTO.getTtitle() %>"></td>
	<td>비밀번호</td><td><input type="password" name =pass ></td>
</tr>
<tr>
	<td colspan="6">
	<input type="hidden" name="oldFile" value="<%=boardDTO.getFile()%>">
	<img src="../upload/<%=boardDTO.getFile()%>" width="400" height="200">
	<input type="file" name="file"><%=boardDTO.getFile()%></td>
</tr>

<tr>
<td colspan="6"><textarea name=content placeholder="글내용을 입력해주세요"><%=boardDTO.getContent()%></textarea></td>
</tr>
<tr>
<td colspan="6">
<input type="submit" value="수정완료" onclick="../center/notice.jsp">
</td>
</tr>
</table>
</form>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>

</body>
</html>