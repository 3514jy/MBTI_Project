<%@page import="menu5.Menu5DTO"%>
<%@page import="menu5.Menu5DAO"%>
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
Menu5DAO menu5dao=new Menu5DAO();
Menu5DTO menu5dto = menu5dao.numCheck(num, pass);

if(menu5dto!=null){
	menu5dao.deleteBoardM5(num);
	response.sendRedirect("../고민상담/menu_5_2.jsp");
}else{
	%>
	<script type="text/javascript">
	alert("입력한 정보가 틀립니다");
	history.back();
	</script>
	<%
}
	%>


</body>
</html>