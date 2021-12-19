<%@page import="java.text.SimpleDateFormat"%>
<%@page import="menu5.Menu5DTO"%>
<%@page import="menu5.Menu5DAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고민상담</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<style type="text/css">
#footer{
margin-top: 100px;
}
</style>
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
<!-- 게시판 -->
<article>
<h1>고민을 상담해주세요</h1>
<%
//BoardDAO 객체생성
Menu5DAO boardDAO_M5 =new Menu5DAO();

// 한화면에 보여줄 글개수  10개 설정
int pageSize=3;

//페이지 번호 가져오기 
String pageNum=request.getParameter("pageNum");
//페이지번호가 없으면 -> 1
if(pageNum==null){
	pageNum="1";
}

//시작하는 행번호 구하기

// pageNum => 정수형 변경
int currentPage=Integer.parseInt(pageNum);
int startRow=(currentPage-1)*pageSize+1;

int endRow=startRow+pageSize-1;
List<Menu5DTO> boardListM5=boardDAO_M5.getBoardM5List(startRow, pageSize);
// 배열  for 첫번째 칸 => BoardDTO => 멤버변수 num pass name...

//게시판 전체 글 개수
// select count(*) from board
int count=boardDAO_M5.getBoardM5Count();
%>


<p>[전체 고민 수 : <%=count %>]<p>
<table id="notice" >
<tr><th class="tno" >글번호</th>
    <th class="ttitle">제목</th>
    <th class="twrite">글쓴이</th>
    <th class="tdate">등록일</th>
    <th class="tread">조회수</th></tr>
<%
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd"); //날짜 포맷을 변경하는데사용
for(int i=0;i<boardListM5.size();i++){
	// boardList 한칸접근 게시판 한개 들고 오기
// 	BoardDTO boardDTO=(BoardDTO)boardList.get(i);
	// 배열에서 형변환 없이 한칸에 데이터 가져오기
	Menu5DTO mboardDTO=boardListM5.get(i);
%><tr><td><%=mboardDTO.getNum() %></td>
      <td><a href="content2.jsp?num=<%=mboardDTO.getNum()%>">
      <%=mboardDTO.getTtitle()%></a></td>
      <td><%=mboardDTO.getTwrite() %></td>
      <td><%=dateFormat.format(mboardDTO.getDate()) %></td>
      <td><%=mboardDTO.getReadcount() %></td></tr><%	
}
%>
</table>

<%
//한페이지에 보여줄 페이지 개수 설정
int pageBlock=3;

//시작하는 페이지 번호
int startPage=(currentPage-1)/pageBlock*pageBlock+1;

// 끝나는 페이지 번호
int endPage=startPage+pageBlock-1;
int pageCount=count/pageSize+(count%pageSize==0?0:1);

if(endPage >  pageCount){
// 	끝나는페이지번호 =  전체글페이지수
	endPage=pageCount;
}

//이전   1 안보임   11 21.. 보임
if(startPage > pageBlock){
	%>
	<a href="menu_5_2.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
	<%
}
//1~10 
for(int i=startPage;i<=endPage;i++){
	%>
	<a href="menu_5_2.jsp?pageNum=<%=i%>"><%=i %> </a>
	<%
}

//다음 끝페이지번호 10  < 전체페이지개수  50 => 다음에 글있음
if(endPage < pageCount){
	%>
	<a href="menu_5_2.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
	<%
}

%>

</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<div id="footer">
<jsp:include page="../inc/bottom.jsp"></jsp:include>
</div>
<!-- 푸터들어가는 곳 -->
</div>

</body>
</html>