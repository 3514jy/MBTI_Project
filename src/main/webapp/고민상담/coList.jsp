<%@page import="member.MemberDTO1"%>
<%@page import="java.util.List"%>
<%@page import="comment.commentDAO"%>
<%@page import="comment.commentDTO"%>
<%@page import="menu5.Menu5DTO"%>
<%@page import="menu5.Menu5DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateFormM5.jsp</title>
</head>
<body>

<%
String id = (String)session.getAttribute("id");
int boardNum = Integer.parseInt(request.getParameter("boardNum"));
commentDAO cDAO = new commentDAO();
commentDTO cDTO =  cDAO.getComment(boardNum);

int pagesize=50;
String pageNum = request.getParameter("pageNum");
if(pageNum==null){
	pageNum="1";
}
int currentPage =Integer.parseInt(pageNum);
int startRow=(currentPage-1)*pagesize+1;
int endRow=startRow+pagesize-1;
List<commentDTO> comList = cDAO.getCommentList(startRow, pagesize);

int count=cDAO.getCommnetCount();
%>
<p>전체댓글수 :<%=count %></p>
<table id="notice" border="1">

<%
for(int i = 0; i<comList.size(); i++){
	commentDTO dto = comList.get(i);
%>
	<tr><td>작성자 : <%=id%></td><td><%=cDTO.getDate()%></td></tr>
	<tr><td colspan="2"><%=cDTO.getComment()%></td></tr>
<% }%>
</table>



</body>
</html>