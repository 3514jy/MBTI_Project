<%@page import="menu5.Menu5DTO"%>
<%@page import="menu5.Menu5DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고민상담</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img"></div>
<!-- 메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="menu_5.jsp">고민을 털어내세요</a></li>
<li><a href="menu_5_2.jsp">고민을 덜어주세요</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<%
int num = Integer.parseInt(request.getParameter("num"));
Menu5DAO menu5DAO = new Menu5DAO();
menu5DAO.updateReadcount(num);

Menu5DTO mboardDTO = menu5DAO.getBoardM5(num);
%>
<article>
<h1>글 내용보기</h1>

<table id="notice">
<tr>
	<td>글번호</td><td><%=mboardDTO.getNum()%></td>
	<td>조회수</td><td><%=mboardDTO.getReadcount() %></td>
</tr>
<tr>
	<td>작성자</td><td><%=mboardDTO.getTwrite()%></td>
	<td>작성일자</td><td><%=mboardDTO.getDate() %></td>
</tr>
<tr><td colspan="4">글제목</td></tr>
<tr><td colspan="4"><%=mboardDTO.getTtitle() %></td></tr>
<tr>
	<td colspan="4">글내용</td>
</tr>
<tr><td colspan="4" height="100px"><%=mboardDTO.getContent() %></td><tr>
<tr>
<td>
<%
String id=(String)session.getAttribute("id");
//세션값이 있으면 
// 글쓴이와 로그인(세션값) 사람이 일치하면 글수정, 글삭제 버튼 보이기
if(id!=null){
	// 로그인  글쓴이 비교 일치
	if(id.equals(mboardDTO.getName())){
		%>
<input type="button" value="글수정" class="btn" 
   onclick="location.href='updateFormM5.jsp?num=<%=mboardDTO.getNum()%>'">
<input type="button" value="글삭제" class="btn" 
   onclick="location.href='deleteFormM5.jsp?num=<%=mboardDTO.getNum()%>'">		
		<%
	}
}
%>
<input type="button" value="글목록" onclick="location.href='../고민상담/menu_5_2.jsp'">
</td>
</tr>
</table>
<br>
</article>
<article>
<jsp:include page="comment.jsp"></jsp:include>
<%-- <jsp:include page="coList.jsp"></jsp:include> --%>
</article>
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>