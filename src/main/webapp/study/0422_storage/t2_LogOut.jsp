<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t2_LogOut.jsp -->
<%
	String mid = (String) session.getAttribute("sMid");
	pageContext.setAttribute("mid", session.getAttribute("sMid"));

	session.invalidate();
%>
<script>
	alert("${mid}님 로그아웃 되셨습니다.");
	location.href="t2_Login.jsp";
</script>