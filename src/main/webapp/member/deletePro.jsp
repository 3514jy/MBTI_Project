<%@page import="member.MemberDAO1"%>
<%@page import="member.MemberDTO1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deletePro.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String id=request.getParameter("id");
String pass=request.getParameter("pass");

MemberDAO1 memberDAO1 = new MemberDAO1();
MemberDTO1 memberDTO1 = memberDAO1.userCheck1(id, pass);

if(memberDTO1!=null){
	memberDAO1.deleteMember(id);
	session.invalidate();
	%>
	
<script type="text/javascript">
alert("삭제완료");
location.href="../main/main.jsp";
</script>	

	
	<%
}else{
%>
<script type="text/javascript">
alert("입력하신 정보가 틀립니다.");
history.back();
</script>
<%
}
%>	
</body>
</html>