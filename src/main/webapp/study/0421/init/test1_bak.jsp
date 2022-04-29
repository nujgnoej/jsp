<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String mid = (String) request.getAttribute("mid");
  String pwd = (String) request.getAttribute("pwd");
  String className = (String) request.getAttribute("className");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test1.jsp</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>특정 서블릿으로부터 초기값을 할당받는다.</h2>
  <h3>servlet에서 받은 초기값</h3>
  <p>
    아이디 : <%=mid %><br/>
    비밀번호 : <%=pwd %><br/>
    부서명 : <%=className %><br/>
  </p>
</div>
<p><br/></p>
</body>
</html>