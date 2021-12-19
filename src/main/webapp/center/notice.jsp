<%@page import="member.MemberDTO1"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDTO1"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice.jsp</title>
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
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<article>
<h1>MBTI 이야기방</h1>

<table id="notice">
<%
BoardDAO1 boardDAO = new BoardDAO1();


//한화면에 보여줄 글개수  10개 설정
int pageSize=5;

//첫번째 페이지 => 1
//http://localhost:8181/JspStudy/board/notice.jsp

//페이지번호 하이퍼링크 클릭하면 => 1,2, 3,...
//http://localhost:8181/JspStudy/board/notice.jsp?pageNum=3


//페이지 번호 가져오기 
String pageNum=request.getParameter("pageNum");
//페이지번호가 없으면 -> 1
if(pageNum==null){
	pageNum="1";
}


//시작하는 행번호 구하기

//pageNum => 정수형 변경
int currentPage=Integer.parseInt(pageNum);
int startRow=(currentPage-1)*pageSize+1;
// out.println("startRow="+startRow);

//끝나는 행번호 구하기
int endRow=startRow+pageSize-1;

//List boardList  =  getBoardList(startRow, pageSize ) 메서드 정의
//메서드 호출
//List boardList=boardDAO.getBoardList(startRow, pageSize);
//select * from board order by num desc limit 시작행-1, 가져올개수
List<BoardDTO1> boardList=boardDAO.getBoardList(startRow, pageSize);
int count=boardDAO.getBoardCount();
//배열  for 첫번째 칸 => BoardDTO => 멤버변수 num pass name...

//게시판 전체 글 개수

//select count(*) from board
%>
<p>전체글수  :<%=count %></p>
<tr><th class="tno" >번호</th>
    <th class="ttitle">제목</th>
    <th class="twrite">글쓴이</th>
    <th class="tdate">작성일자</th>
    <th class="tread">조회수</th></tr>
<!-- 게시판 리스트 -->
<%
//날짜포맷변경
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd"); //날짜 포맷을 변경하는데사용
	MemberDTO1 memberDTO1 = new MemberDTO1();
for(int i =0; i<boardList.size(); i++){
	BoardDTO1 boardDTO =boardList.get(i);
%><tr><td><%=boardDTO.getNum() %></td>
      <td><a href="../board/content1.jsp?num=<%=boardDTO.getNum()%>">
      <%=boardDTO.getTtitle()%></a></td>
      <td><%=boardDTO.getTwrite() %></td>
      <td><%=dateFormat.format(boardDTO.getDate()) %></td>
      <td><%=boardDTO.getReadcount() %></td></tr><%	
}
%>
</table>


<div class="clear"></div>
<div id="page_control">
<%
//한페이지에 보여줄 페이지 개수 설정
int pageBlock=5;

//시작하는 페이지 번호
int startPage=(currentPage-1)/pageBlock*pageBlock+1;

// 끝나는 페이지 번호
int endPage=startPage+pageBlock-1;
// 구한 끝나는 페이지 번호 10 , 전체 글 페이지 수 2
// 전체 글 페이지 수 구하기
// 전체 글 50 / 한화면에 보여줄 글개수 10 => 전체페이지수 5 + 나머지글 없음 0
// 전체 글 57 / 한화면에 보여줄 글개수 10 => 전체페이지수 5 + 나머지글 있음 1
//                                                 나머지 없으면 0 더하기, 있으면 1 더하기
int pageCount=count/pageSize+(count%pageSize==0?0:1);
// out.println("pageCount="+pageCount);

if(endPage >  pageCount){
// 	끝나는페이지번호 =  전체글페이지수
	endPage=pageCount;
}

//이전   1 안보임   11 21.. 보임
if(startPage > pageBlock){
	%>
	<a href="notice.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
	<%
}
//1~10 
for(int i=startPage;i<=endPage;i++){
	%>
	<a href="notice.jsp?pageNum=<%=i%>"><%=i %> </a>
	<%
}

//다음 끝페이지번호 10  < 전체페이지개수  50 => 다음에 글있음
if(endPage < pageCount){
	%>
	<a href="notice.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
	<%
}

%>
</div>
<%
//로그인(세션값 있음) => 글쓰기 버튼 보임
String id=(String)session.getAttribute("id");
if(id!=null){
	%>
<div id="table_search">
<input type="button" value="글쓰기" class="btn" onclick="location.href='../board/fwriteForm.jsp'">
</div>	
	<%
}
%>
<div id="table_search">
<form action="noticeSearch.jsp" method="get">
<input type="text" name="search" class="input_box">
<input type="submit" value="검색" class="btn">
</form>
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