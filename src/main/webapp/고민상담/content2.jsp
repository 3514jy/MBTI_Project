<%@page import="member.MemberDTO1"%>
<%@page import="member.MemberDAO1"%>
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
		System.out.println("36번째 라인 num : "+ num);
		Menu5DAO menu5DAO = new Menu5DAO();
		menu5DAO.updateReadcount(num);

		Menu5DTO mboardDTO = menu5DAO.getBoardM5(num);

		//세션값 가져오기
		String id = (String) session.getAttribute("id");
		//MemberDAO 객체생성
		MemberDAO1 memberDAO1 = new MemberDAO1();
		//id정보를 조회 MemberDTO getMember(id) 메서드 정의
		//MemberDTO  memberDTO = getMember(id) 메서드 호출
		MemberDTO1 memberDTO1 = memberDAO1.getmember1(id);
		%>
		<article>
			<h1>글 내용보기</h1>

			<table id="notice">
				<tr>
					<td>글번호</td>
					<td><%=mboardDTO.getNum()%></td>
					<td>조회수</td>
					<td><%=mboardDTO.getReadcount()%></td>
				</tr>
				<tr>
					<td>작성자의 MBTI</td>
					<td><%=memberDTO1.getMbti()%></td>
					<td>작성일자</td>
					<td><%=mboardDTO.getDate()%></td>
				</tr>
				<tr>
					<td>카테고리</td>
					<td colspan="3"><%=mboardDTO.getCategory()%></td>
				</tr>
				<tr>
					<td>글제목</td>
					<td colspan="3"><%=mboardDTO.getTtitle()%></td>
				</tr>
				<tr>
					<td colspan="4">글내용</td>
				</tr>
				<tr>
					<td colspan="4" height="100px"><%=mboardDTO.getContent()%></td>
				<tr>
				<tr>
					<td>
						<%
						// 글쓴이와 로그인(세션값) 사람이 일치하면 글수정, 글삭제 버튼 보이기
						if (id != null) {
							// 로그인  글쓴이 비교 일치
							if (id.equals(mboardDTO.getName())) {
						%> <input type="button" value="글수정" class="btn"
						onclick="location.href='updateFormM5.jsp?num=<%=mboardDTO.getNum()%>'">
						<input type="button" value="글삭제" class="btn"
						onclick="location.href='deleteFormM5.jsp?num=<%=mboardDTO.getNum()%>'">
						<%
						}
						}
						%> <input type="button" value="글목록"
						onclick="location.href='../고민상담/menu_5_2.jsp'">
					</td>
				</tr>
			</table>
			<br>
		</article>
		<article>
			<h2>고민을 해결해 주세요</h2>
				<form action="commentPro.jsp" method="post">
				<input type="hidden" name="boardNum" value="<%=num%>">
				<input type="hidden" name="name" value="<%=id%>">
				<table>
				<tr><td><textarea placeholder="힘이되는 댓글을 작성해주세요" id="comment" name="comment" rows="5"
				cols="92"></textarea><td></tr>
				<tr><td><input type="submit" value="작성완료" id="result" name="result"><td></tr>
				</table>
				</form>
		</article>
		<div class="clear"></div>
		<!-- 푸터들어가는 곳 -->
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<!-- 푸터들어가는 곳 -->
	</div>
</body>
</html>