<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteForm.jsp</title>
</head>
<body>
<%
int num=Integer.parseInt(request.getParameter("num"));
%>
<form action="deletePro.jsp" method="get">
<input type="hidden" name="num" value="<%=num%>">
<table>
<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
<tr><td><input type="submit" value="삭제완료"></td></tr>
</table>

</form>
</body>
</html>