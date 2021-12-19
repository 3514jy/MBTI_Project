<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>welcome.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->

<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
 
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
<li><a href="welcome.jsp">인사말</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 내용 -->
<article>
<h1>Welcome</h1>
<figure class="ceo"><img src="../images/member/intj.jpg" width="196" height="226" 
alt="CEO"><figcaption>주인장은 INTJ</figcaption>
</figure>
<pre>
<b>이 사이트는 전체 인구의 0.8%에 해당하는 
여성 INTJ가 직접 만든 MBTI 전용 사이트입니다.</b>

이제는 혈액형보다 더 사람들의 관심을 많이 받는 MBTI
● 나와 잘 맞는 사람은 누굴까?
● 나는 왜 내 연인과 매일 싸우는 걸까?
● 나는 어떤 직업을 선택해야 할까?
● 내가 제일 싫어하는 사람의 유형은 어떤 사람일까?
자기 스스로가 어떤 사람인지 늘 궁금하지 않으셨나요?
나도 잘 몰랐던 나에 대한 이야기
지금부터 시작합니다.
<a href="https://www.16personalities.com/ko/%EB%AC%B4%EB%A3%8C-%EC%84%B1%EA%B2%A9-%EC%9C%A0%ED%98%95-%EA%B2%80%EC%82%AC">MBTI 검사하기</a>

</pre>
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



    