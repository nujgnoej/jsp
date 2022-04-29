<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();

	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			cookies[i].setMaxAge(0);	// 쿠키의 만료시간을 0으로 설정하면 해당 쿠키가 삭제된다.
			response.addCookie(cookies[i]);
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>t1_CookiesDelete.jsp</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>쿠키 삭제 완료</h2>
	<hr/>
	<br/>
	<div>
		<a href="t1_CookiesMain.jsp" class="btn btn-success form-control">돌아가기</a>
	</div>
</div>
<p><br/></p>
</body>
</html>