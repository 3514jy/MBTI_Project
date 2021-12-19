<%@page import="menu5.Menu5DAO"%>
<%@page import="menu5.Menu5DTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writePro5.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String twrite=request.getParameter("twrite");
String name =request.getParameter("name");
String pass = request.getParameter("pass");
String ttitle=request.getParameter("ttitle");
String content=request.getParameter("content");
String category=request.getParameter("category");


Menu5DTO mboardDTO = new Menu5DTO();
mboardDTO.setTwrite(twrite);
mboardDTO.setPass(pass);
mboardDTO.setName(name);
mboardDTO.setTtitle(ttitle);
mboardDTO.setContent(content);
mboardDTO.setDate(new Timestamp(System.currentTimeMillis()));
mboardDTO.setReadcount(0);
mboardDTO.setCategory(category);


Menu5DAO boardDAO5 = new Menu5DAO();
boardDAO5.insertBoardM5(mboardDTO);

response.sendRedirect("menu_5_2.jsp");
%>
</body>

</html>