<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = (String) session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");
	String pwd = (String) session.getAttribute("sPwd")==null ? "" : (String) session.getAttribute("sPwd");
	
	if(mid.equals("")) {
		out.println("<script>");
		out.println("alert('로그인후 사용하세요.')");
		out.println("location.href='t5_Login.jsp';");
		out.println("</script>");
	}
	
	int vCnt = 0;
	if(session.getAttribute("sVCnt") != null) {
		vCnt = (int) session.getAttribute("sVCnt") + 1;
		session.setAttribute("sVCnt", vCnt);
	}
	else {
		session.setAttribute("sVCnt", 1);
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>t5_LoginMember.jsp</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container text-center">
	<h2>회원 전용방</h2>
	<hr/>
	<p><font color="blue"><b>${sMid}</b></font>님 로그인 중입니다.</p>
	<p>방문카운트 : ${sVCnt} / 전체 방문카운트 : ${aVCnt}</p>
	<hr/>
	<p><img src="<%=request.getContextPath()%>/images/10.JPG" width="400px" /></p>
	<hr/>
<%if(mid.equals("admin") && pwd.equals("1234")) {%>
	<div><a href="t5_LoginCountInit.jsp" class="btn btn-success form-control m-1">전체 방문카운트 초기화</a></div>
<%} %>
	<div><a href="t5_LogOut.jsp" class="btn btn-success form-control m-1">로그아웃</a></div>
</div>
<p><br/></p>
</body>
</html>