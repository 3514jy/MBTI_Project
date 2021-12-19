<%@page import="member.MemberDAO1"%>
<%@page import="member.MemberDTO1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/loginPro.jsp</title>
</head>
<body>

<%
//한글처리
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pass=request.getParameter("pass");
//id pass
//리턴할형 MemberDTO userCheck(id,pass)메서드 정의
//userCheck(id,pass)메서드 호출
MemberDAO1 memberDAO1 = new MemberDAO1();
MemberDTO1 memberDTO1 =memberDAO1.userCheck1(id, pass);

if(memberDTO1!=null){
	//일치 세션값 생성 "id",id
	session.setAttribute("id", id);
	response.sendRedirect("../main/main.jsp");
}else{
// main폴더	main.jsp 이동

	//틀림 "입력하신 정보 틀림" 뒤로이동
	%>
	<script type="text/javascript">
		alert("입력하신 정보 틀림");
		history.back();
	</script>
	<%
}
%>
</body>
</html>