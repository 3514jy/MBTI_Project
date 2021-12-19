<%@page import="comment.commentDTO"%>
<%@page import="comment.commentDAO"%>
<%@page import="board.BoardDTO1"%>
<%@page import="member.MemberDTO1"%>
<%@page import="menu5.Menu5DTO"%>
<%@page import="menu5.Menu5DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateFormM5.jsp</title>
</head>
<%
int boardNum=Integer.parseInt(request.getParameter("num"));
commentDAO dao = new commentDAO();
commentDTO dto = dao.getComment(boardNum);
//세션값이 없으면 login.jsp 이동
String id = (String)session.getAttribute("id");
%>

<body>
<h2>고민을 해결해 주세요</h2>
	<form action="commentPro.jsp" method="post">
	<input type="hidden" name="boardNum" value="<%=boardNum%>">
	<input type="hidden" name="name" value="<%=id%>">
	<table>
	<tr><td><textarea placeholder="힘이되는 댓글을 작성해주세요" id="comment" name="comment" rows="5"
	cols="92"></textarea><td></tr>
	<tr><td><input type="submit" value="작성완료" id="result" name="result"><td></tr>
	</table>
	</form>
</body>
</html>