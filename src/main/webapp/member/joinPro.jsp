<%@page import="member.MemberDAO1"%>
<%@page import="member.MemberDTO1"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/joinPro.jsp</title>
</head>
<body>
<%
// http가 폰에서 입력한 정보를 서버에 들고오면
// 서버에서 request내장객체 생성하고 request에 들고온 정보를 저장
// request 한글처리
request.setCharacterEncoding("utf-8");
// request 파라미터 가져오기
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String email=request.getParameter("email")+"@"+request.getParameter("email2");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String mobile=request.getParameter("mobile");
String address2 =request.getParameter("address2");
String MBTI=request.getParameter("MBTI");

// 날짜내장객체 <= 시스템 날짜 가져오기 
Timestamp date=new Timestamp(System.currentTimeMillis());

// 패키지 member 파일 MemberDTO 만들기
// 멤버변수 정의 set get 정의 
// MemberDTO 객체생성
MemberDTO1 memberDTO1 =new MemberDTO1();
// 멤버변수에 폼에서 가져온 내용을 set호출해서 저장
memberDTO1.setId(id);
memberDTO1.setPass(pass);
memberDTO1.setName(name);
memberDTO1.setDate(date);
memberDTO1.setEmail(email);
memberDTO1.setAddress(address);
memberDTO1.setPhone(phone);
memberDTO1.setMobile(mobile);
memberDTO1.setAddress2(address2);
memberDTO1.setMbti(MBTI);


// 패키지 member 파일 MemberDAO 만들기
// insertMember(바구니주소) 메서드 정의
// MemberDAO 객체생성  
MemberDAO1 memberDAO1=new MemberDAO1();
// insertMember(주소) 메서드 호출
memberDAO1.insertMemeber1(memberDTO1);

// "회원가입성공"  login.jsp 이동
%>
<script type="text/javascript">
	alert("회원가입성공");
	location.href="login.jsp";
</script>
</body>
</html>




