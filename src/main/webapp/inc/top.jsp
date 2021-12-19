<%@page import="member.MemberDTO1"%>
<%@page import="member.MemberDAO1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<%
//세션값 가져오기
String id=(String)session.getAttribute("id");


if(id==null){
	//세션값 없음 로그인이 안된 상태
	%>
<div id="login"><a href="../member/login.jsp">로그인</a> | 
                <a href="../member/join.jsp">회원가입</a></div>	
	<%
}else{
	//세션값 있음 로그인이 된 상태
	%>
<div id="login"><a href =../member/info.jsp> <%=id %>님</a> | <a href="../member/logout.jsp">logout</a> | 
                             <a href="../member/update.jsp">update</a></div>	
	<%
}
%>

<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><a href="../main/main.jsp"><img src="../images/로고.png" width="300" height="110" ></a></div>
<!-- 메인화면 검색창 -->


<!-- 메인화면 메뉴바 -->
<nav id="top_menu">
<ul>
	<li><a href="../main/main.jsp">HOME</a></li>
	<li><a href="../company/welcome.jsp">사이트소개</a></li>
	<li><a href="../MBTI정보/MBTI유형.jsp">MBTI정보</a></li>
	<li><a href="../center/notice.jsp">이야기방</a></li>
	<li><a href="../고민상담/menu_5.jsp">고민상담</a></li>
</ul>
</nav>

</header>
