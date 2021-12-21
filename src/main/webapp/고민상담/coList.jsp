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
commentDAO cDAO = new commentDAO();
Menu5DTO menu5dto = new Menu5DTO();
int boardNum=Integer.parseInt(request.getParameter("boardNum"));
System.out.println("comment 에서 가져온 boardNum "+boardNum);

int pagesize=10;
String pageNum = request.getParameter("pageNum");
if(pageNum==null){
	pageNum="1";
}
int currentPage =Integer.parseInt(pageNum);
int startRow=(currentPage-1)*pagesize+1;
int endRow=startRow+pagesize-1;
List<commentDTO> comList = cDAO.getCommentList(startRow, pagesize, boardNum);
int count=cDAO.getCommnetCount();
%>
<table id="notice" border="1">

<%
for(int i = 0; i<comList.size(); i++){
	commentDTO dto = comList.get(i);
// 	if(dto.getBoardNum()==menu5dto.getNum()){
%>
	<tr><td class="Cname">작성자 : <%=id%></td><td class="Cdate"><%=dto.getDate()%></td></tr>
	<tr><td colspan="2" class="Ccomment"><%=dto.getComment()%></td></tr>
<% }
%>
</table>



</body>
</html>