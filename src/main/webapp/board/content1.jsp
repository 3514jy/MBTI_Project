
<%@page import="board.BoardDTO1"%>
<%@page import="board.BoardDAO1"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center1.jsp</title>
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
<li><a href="../center/notice.jsp">MBTI이야기</a></li>
<li><a href="../fcenter/fnotice.jsp">다운로드</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->


<!-- 게시판 -->
<%
//BoardDAO 객체생성
BoardDAO1 boardDAO=new BoardDAO1();
//http://localhost:8181/FunWeb/center/content.jsp?num=2
//request내장객체에서 num 가져오기
int num=Integer.parseInt(request.getParameter("num"));
//조회수 증가 update board set readcount=readcount+1 where num=?
boardDAO.updateReadcount(num);
//getBoard(num) 메서드 호출
BoardDTO1 boardDTO=boardDAO.getBoard(num);
%>
<article>
<h1>게시판</h1>
<table id="notice">
<tr><td>글번호</td><td><%=boardDTO.getNum() %></td>
    <td>작성일</td><td><%=boardDTO.getDate() %></td></tr>
<tr><td>글쓴이</td><td><%=boardDTO.getTwrite()%></td>
    <td>조회수</td><td><%=boardDTO.getReadcount() %></td></tr>
<tr><td>글제목</td><td colspan="3"><%=boardDTO.getTtitle() %></td></tr>
<tr><td>첨부파일</td>
    <td colspan="3">
<img src="../upload/<%=boardDTO.getFile() %>" width="400" height="300"></td></tr>
<tr><td>글내용</td><td colspan="3"><%=boardDTO.getContent() %></td></tr>
</table>
<div id="table_search">
<%
String id=(String)session.getAttribute("id");
//세션값이 있으면 
// 글쓴이와 로그인(세션값) 사람이 일치하면 글수정, 글삭제 버튼 보이기
if(id!=null){
	// 로그인  글쓴이 비교 일치
	if(id.equals(boardDTO.getTwrite())){
		%>
<input type="button" value="글수정" class="btn" 
   onclick="location.href='updateForm.jsp?num=<%=boardDTO.getNum()%>'">
<input type="button" value="글삭제" class="btn" 
   onclick="location.href='deleteForm.jsp?num=<%=boardDTO.getNum()%>'">		
		<%
	}
}
%>

<input type="button" value="글목록" class="btn"
   onclick="location.href='../center/notice.jsp'">
</div>
<div class="clear"></div>
<div id="page_control">


</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>