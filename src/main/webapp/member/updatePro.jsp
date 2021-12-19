<%@page import="member.MemberDAO1"%>
<%@page import="member.MemberDTO1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/updatePro.jsp</title>
</head>
<body>
<%
// 한글처리
request.setCharacterEncoding("utf-8");
// 파라미터 가져오기 
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String email=request.getParameter("email");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String mobile=request.getParameter("mobile");
String address2=request.getParameter("address2");
String MBTI=request.getParameter("MBTI");

// MemberDTO  memberDTO 객체생성
MemberDTO1 memberDTO1 =new MemberDTO1();
// 멤버변수에 폼에서 가져온 내용을 set호출해서 저장
memberDTO1.setId(id);
memberDTO1.setPass(pass);
memberDTO1.setName(name);
memberDTO1.setEmail(email);
memberDTO1.setAddress(address);
memberDTO1.setPhone(phone);
memberDTO1.setMobile(mobile);
memberDTO1.setAddress2(address2);
memberDTO1.setMbti(MBTI);
//MemberDAO 객체생성
MemberDAO1 memberDAO1=new MemberDAO1();
// MemberDTO memberDTO2  =  userCheck(id,pass)메서드 호출
MemberDTO1 memberDTO2=memberDAO1.userCheck1(id, pass);
if(memberDTO2!=null){
	//일치 updateMember(memberDTO) 메서드 정의
	MemberDTO1 memberDTO1_update = new MemberDTO1();
	memberDTO1_update.setId(id);
	memberDTO1_update.setPass(pass);
	memberDTO1_update.setName(name);
	memberDTO1_update.setEmail(email);
	memberDTO1_update.setAddress(address);
	memberDTO1_update.setPhone(phone);
	memberDTO1_update.setMobile(mobile);
	memberDTO1_update.setAddress2(address2);
	memberDTO1_update.setMbti(MBTI);
	memberDAO1.updateMember(memberDTO1_update);

	// ../main/main.jsp
	response.sendRedirect("info.jsp");
}else{
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



