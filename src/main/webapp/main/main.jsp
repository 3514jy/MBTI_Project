<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDTO1"%>
<%@page import="board.BoardDAO1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">


</head>
<body>
<div id="wrap">
<div id="mainback-img">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<!-- 로그인아이디 -->
 <%
 String id = (String)session.getAttribute("id");
 
 if(id==null){
 %>
  
<form action="../member/loginPro.jsp" id="join" method="post" >
<fieldset id="loginMain">
<label>아 이 디 :  </label>
<input type="text" name="id" id="loginMainid"><br>
<label>비밀 번호 : </label>
<input type="password" name="pass" id="loginMainid"><br>
<div id="buttons">
<input type="submit" value="로그인" class="submit" id="loginButton">
</div>
<br>
<ul id = "liname">
<li>아이디찾기</li>
<li>비밀번호찾기</li>
<li><a href ='../member/join.jsp'>회원가입</a></li>
</ul>

</fieldset>
</form>

<%}else{ %>
<fieldset id="loginMain">
<div id="login-af">
<label>
<input type="button" value="<%=id%>님이 로그인 하셨습니다." onclick="location.href='../member/info.jsp'" id="loginbtn">
</label>
</div>
<br>

<label><a href="../member/logout.jsp">로그아웃</a>ㅣ<a href="../member/update.jsp">회원정보수정</a></label>
</fieldset>
<%
}
%>
<!-- 메인이미지 들어가는곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<div id="solution">
<div id="hosting">
<h3>MBTI연예인테스트</h3>
<p><img src="../images/main/그림1.png" width="180px" height="180px" 
	onclick="location.href='https://app.m-nitpick.com/psytest/mc'"></p>
</div>
<div id="security">
<h3>술BTI테스트</h3>
<p><img src="../images/main/그림2.png" width="180px" height="180px" 
	onclick="location.href='https://poomang.com/ggbti?from_detail=True'"></p>
</div>
<div id="payment">
<h3>열대과일MBTI</h3>
<p><img src="../images/main/그림3.png" width="180px" height="180px" 
	onclick="location.href='https://poomang.com/detail/nizxo'"></p>
</div>
</div>
</div>
<div class="clear"></div>
<div id="sec_news">
<h3><a href="https://search.naver.com/search.naver?query=MBTI&where=news&ie=utf8&sm=nws_hty">
<span class="orange">
MBTI</span> News</a></h3>
<dl>
<dt><a href="https://www.whitepaper.co.kr/news/articleView.html?idxno=210533">
KB증권, 중개형 ISA·연금 및 '부자 MBTI' 이벤트</a></dt>
<dd>'부자 MBTI'는 본인의 투자 유형을 MBTI로 진단받고 투자에 대한 조언까지 확인할 수 있는 이벤트다.
'부자 MBTI'에 참여한 고객 전원에게 국내주식 ...</dd>
</dl>
<dl>
<dt><a href="http://pop.heraldcorp.com/view.php?ud=202110311600140431771_1">
박영진, 민경훈과 쌍둥이론 주장.."전국 1% 뿐인 MBTI"</a></dt>
<dd> 박영진은 자신과 민경훈의 MBTI가 전국에 1% 뿐인 ‘INFJ’임을 밝히며 MBTI 쌍둥이론을 주장했다. 
이어 “또 다른 자아 있고, 현실 유행에 둔감...</dd>
</dl>
<dl>
<dt><a href="http://www.ohmynews.com/NWS_Web/View/at_pg.aspx?CNTN_CD=A0002782952&CMPT_CD=P0010&utm_source=naver&utm_medium=newsearch&utm_campaign=naver_news">
MBTI 신봉자가 된 중3 아이, 이유가 울컥합니다</a></dt>
<dd>'내가 이상한 게 아니구나' 안도했다는 딸아이... 외로운 마음을 너무 늦게 알았네요..</dd>
</dl>
</div>
<div id="news_notice">
<h3 class="brown">최신글</h3>
<table>
<%
BoardDAO1 boardDAO = new BoardDAO1();
int pageSize=5;
String pageNum="1";
int currentPage=Integer.parseInt(pageNum);
int startRow=(currentPage-1)*pageSize+1;
List<BoardDTO1> boardList=boardDAO.getBoardList(startRow, pageSize);
SimpleDateFormat DateFormat = new SimpleDateFormat("YYYY.MM.dd");
for(int i =0; i<boardList.size(); i++){
	BoardDTO1 boardDTO1=boardList.get(i);
	
%>
<tr><td class="contxt"><a href="../board/content1.jsp?num=<%=boardDTO1.getNum()%>">
      <%=boardDTO1.getTtitle()%></a></td>
    <td><%=boardDTO1.getDate()%></td></tr>
<%
}
%>


</table>
</div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>