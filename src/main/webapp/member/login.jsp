<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="../css/login.css">
  </head>

  <body width="100%" height="100%">
    <form action="loginPro.jsp" method="post" class="loginForm">
      <h2>Login</h2>
      <div class="idForm">
        <input type="text" class="id" name="id" placeholder="ID">
      </div>
      <div class="passForm">
        <input type="password" class="pw" name="pass" placeholder="PW">
      </div>
      <button type="submit" class="btn" onclick="button()">
        LOG IN
      </button>
     
      <div class="bottomText">
        Don't you have ID? <a href="#">sign up</a>
      </div>
    </form>
  </body>
</html>