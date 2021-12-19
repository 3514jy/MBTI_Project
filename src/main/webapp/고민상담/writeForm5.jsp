
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writeForm5.jsp</title>
<style type="text/css">
#menu5-write{
border: 1px solid  rgb(192, 192, 192);
font-size: 20px;
}
#menu5-write td,td{
	border:1px dotted  rgb(192, 192, 192);
}
#textconet{
	height: 200px;
}
</style>
</head>
<body>
<%
String id=(String)session.getAttribute("id");
//세션값이 없으면 login.jsp 이동
if(id==null){
	response.sendRedirect("../member/login.jsp");
}
%>
<article>
	<form action="writePro5.jsp" method="post">
	<input type="hidden" value="<%=id%>" name="name">
		<table id="notice">
			<tr>
				<td class="ttitle">제목</td>
				<td><input type="text" name="ttitle"></td>
			</tr>
			<tr>
			<td>비밀번호</td><td><input type="password" name="pass"></td>
			</tr>
			<tr>
			<td>익명닉네임</td><td><input type="text" name="twrite"></td>
			</tr>
			<tr>
				<td class="category">카테고리</td>
				<td><select name="category">
						<option>주제를 선택해주세요</option>
						<option value="연애">연애</option>
						<option value="인간관계">인간관계</option>
						<option value="가족">가족</option>
						<option value="직장">직장</option>
				</select></td>
			</tr>
			<tr>
				<td class="content" colspan="2">글내용</td>
			</tr>
			<tr>
				<td colspan="2"><textarea name="content" role="50" cols="80" id="textconet"></textarea></td>
			</tr>	
			<tr>
				<td colspan="2"><input type="submit" value="작성완료"> <input
					type="reset" value="초기화"></td>
			</tr>
		</table>
	</form>
</article>
	
</body>
</html>