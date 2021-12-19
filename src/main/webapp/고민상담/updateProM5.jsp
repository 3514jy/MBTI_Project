<%@page import="menu5.Menu5DAO"%>
<%@page import="menu5.Menu5DTO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updatePro.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num"));
String twrite=request.getParameter("twrite");
String pass = request.getParameter("pass");
String ttitle=request.getParameter("ttitle");
String content=request.getParameter("content");
String category=request.getParameter("category");

Menu5DTO mboardDTO = new Menu5DTO();
mboardDTO.setNum(num);
mboardDTO.setTwrite(twrite);
mboardDTO.setPass(pass);
mboardDTO.setTtitle(ttitle);
mboardDTO.setContent(content);
mboardDTO.setCategory(category);



Menu5DAO menu5DAO = new Menu5DAO();
Menu5DTO mboardDTO2 =menu5DAO.numCheck(num, pass);

if(mboardDTO2!=null){
	menu5DAO.updateBoardM5(mboardDTO);
	response.sendRedirect("menu_5_2.jsp");
}else{
%>
<script type="text/javascript">
alert("비밀번호가 일치하지 않습니다");
history.back();

</script>
<%
}
%>	

</body>
</html>