<%@page import="org.apache.catalina.mbeans.MBeanUtils"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.BoardDAO1"%>
<%@page import="board.BoardDTO1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updatePro.jsp</title>
</head>
<body>
<%
//멀티파트를 통한 업로드 필요->cos.jar파일을 설치 해야함
String uploadPath = request.getRealPath("/upload");//업로드 폴더의 물리적인 경로
int maxSize=10*1024*1024;
//DefaultFileRenamePolicy란? 동일한 파일명을 처리하는 부분.
MultipartRequest multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());


//BoardDAO 객체 생성
BoardDAO1 boardDAO=new BoardDAO1();
//getBoard(num) 메서드 호출
int num=Integer.parseInt(multi.getParameter("num"));
String pass=multi.getParameter("pass");
String ttitle=multi.getParameter("ttitle");
String twrite=multi.getParameter("twrite");
String content=multi.getParameter("content");
//첨부파일을 가져왔을때 
String file = multi.getFilesystemName("file");
//첨부파일이 없을경우 : null값이 들어감.
//새파일이 없다면 기존 파일을 가져온다.
if(file==null){
	//기존파일이름가져오기
	file=multi.getParameter("oldFile");
}

BoardDTO1 boardDTO = new BoardDTO1();
boardDTO=boardDAO.getBoard(num);
boardDTO.setPass(pass);
boardDTO.setTtitle(ttitle);
boardDTO.setTwrite(twrite);
boardDTO.setContent(content);
boardDTO.setFile(file);

BoardDAO1 boardDAO1 =  new BoardDAO1();
BoardDTO1 boardDTO2 = boardDAO1.numCheck(num, pass);

if(boardDTO2!=null){
	boardDAO1.newUpdateBoard(boardDTO);
response.sendRedirect("../center/notice.jsp");
}else{
%>
<script type="text/javascript">
alert("비밀번호가 일치하지 않습니다");
history.back();

</script>
<%
}
%>	

%>




</body>
</html>