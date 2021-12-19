<%@page import="comment.commentDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="comment.commentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

request.setCharacterEncoding("utf-8");
String comment=request.getParameter("comment");
String name =request.getParameter("name");
int boardNum =Integer.parseInt(request.getParameter("boardNum"));

commentDTO cDTO = new commentDTO();
cDTO.setComment(comment);
cDTO.setName(name);
cDTO.setDate(new Timestamp(System.currentTimeMillis()));
cDTO.setBoardNum(boardNum);
commentDAO cDAO = new commentDAO();
cDAO.insertComment(cDTO);

response.sendRedirect("coList.jsp");
%>

</body>
</html>