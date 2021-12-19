<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MBTI정보</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<style type="text/css">
table{
 border: 3px solid;
}
table:hover{
 border: 3px solid red;
 cursor: pointer;
}
</style>
 
</head>
<body>
<div id="wrap">
<!-- 헤더가 들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더가 들어가는 곳 -->

<!-- 본문 들어가는 곳 -->
<!-- 서브페이지 메인이미지 -->
<div id="sub_img"></div>
<!-- 서브페이지 메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="MBTI유형.jsp">MBTI유형</a></li>
<li><a href="MBTI유형별특징.jsp">MBTI유형별 특징</a></li>
<li><a href="MBTI별직업추천.jsp">MBTI별 직업추천</a></li>
<li><a href="MBTI별궁합.jsp">MBTI별 궁합</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 내용 -->
<article>
<h1>MBTI별궁합</h1>
<table>
<tr><td><img src="../images/궁합표2.jpg" width="650" height="450" 
alt="CEO" onclick="location.href='궁합상세.jsp'" id="mianImg"></td></tr>
</table>
<figcaption>MBTI별 궁합</figcaption>


<p></p>
</article>
<!-- 내용 -->
<!-- 본문 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>



    