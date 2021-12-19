<%@page import="board.BoardDTO1"%>
<%@page import="board.BoardDAO1"%>
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
int num = Integer.parseInt(request.getParameter("num"));
String pass = request.getParameter("pass");
BoardDAO1 boardDAO =new BoardDAO1();
BoardDTO1 boardDTO2 = boardDAO.numCheck(num, pass);

if(boardDTO2!=null){
	boardDAO.deleteBoard(num);
	response.sendRedirect("../center/notice.jsp");
}else{
	%>
	<script type="text/javascript">
	alert("입력한 정보가 틀립니다");
	history.back();
	</script>
	<%
}
	%>

%>
</body>
</html>