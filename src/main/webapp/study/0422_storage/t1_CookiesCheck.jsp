<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>t1_CookiesCheck.jsp</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>쿠키 확인</h2>
	<hr/>
<%
	Cookie[] cookies = request.getCookies();
	
	out.println("<table class='table table-hover text-center'>");
	out.println("<tr><th>번호</th><th>저장된 쿠키명</th><th>저장된 쿠키값</th></tr>");
	for(int i=0; i<cookies.length; i++) {
		out.println("<tr>");
		String strName = cookies[i].getName();		// 쿠키명(저장시켜놓은 쿠키변수명) 가져오기
		String strValue = cookies[i].getValue();	// 쿠키값(저장시켜놓은 쿠키값) 가져오기
		out.println("<td>"+ (i+1) +"</td>");
		out.println("<td>"+ strName +"</td>");
		out.println("<td>"+ strValue +"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
%>
	<br/>
	<div>
		<a href="t1_CookiesMain.jsp" class="btn btn-success form-control">돌아가기</a>
	</div>
</div>
<p><br/></p>
</body>
</html>