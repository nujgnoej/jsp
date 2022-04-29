<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 
<%
	String mid = session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");
	String nickName = session.getAttribute("sNickName")==null ? "" : (String) session.getAttribute("sNickName");
	int age = session.getAttribute("sAge")==null ? 0 : (int) session.getAttribute("sAge");
%>
 --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>t3_SessionCheck.jsp</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>세션 확인</h2>
	<hr/>
	<div class="border">
		<div class="row m-3">
			<div class="col">세션 아이디</div>
			<div class="col">${sMid}</div>
		</div>
		<div class="row m-3">
			<div class="col">세션 닉네임</div>
			<div class="col">${sNickName}</div>
		</div>
		<div class="row m-3">
			<div class="col">세션 나이</div>
			<div class="col">${sAge}</div>
		</div>
		<div class="row m-3">
			<div class="col">my세션 아이디</div>
			<div class="col"><%=session.getId()%></div>
		</div>
	</div>
	<br/>
	<div><a href="t3_SessionMain.jsp" class="btn btn-success form-control m-1">돌아가기</a></div>
	<div><button type="button" onclick="location.href='t3_SessionMain.jsp';" class="btn btn-success form-control m-1">돌아가기</button></div>
</div>
<p><br/></p>
</body>
</html>