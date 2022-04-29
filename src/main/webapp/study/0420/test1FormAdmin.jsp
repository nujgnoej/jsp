<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
  response.setContentType("text/html; charset=utf-8");
	String name = request.getParameter("name");
	int price = request.getParameter("price")==null ? 0 : Integer.parseInt(request.getParameter("price"));
	String adminSw = request.getParameter("adminSw");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test1FormAdmin.jsp</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>이곳은 test1FormAdmin.jsp 파일입니다.</h2>
  <p>성명 : <%=name %></p>
	<p>가격 : <%=price %></p>
	<p>adminSw : <%=adminSw %></p>
  <p><a href="test1Form.jsp">돌아가기</a></p>
</div>
<p><br/></p>
</body>
</html>