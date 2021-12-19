<%@page import="member.MemberDTO1"%>
<%@page import="member.MemberDAO1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
span{
color: red;
}
</style>
</head>
<body>
<%
String uID=request.getParameter("uID");
// 디비작업
//MemberDAO 객체생성
MemberDAO1 memberDAO=new MemberDAO1();
//MemberDTO memberDTO = getMember(String id)메서드 호출 
MemberDTO1 memberDTO=memberDAO.getmember1(uID);
// 아이디 없으면 null   => 아이디 중복아님  아이디 사용가능
// 아이디 있으면 null아님 => 아이디 중복  아이디 사용못함
if(memberDTO==null){
	%><span>이 아이디가 딱이네요!</span><%
}else{
	%><span>중복된 아이디가 있어요!</span><%
}
%>
</body>
</html>