<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t3_SessionSave.jsp -->
<%
	String mid = request.getParameter("mid")==null ? "hkd1234" : request.getParameter("mid");
	String nickName = request.getParameter("nickName")==null ? "홍장군" : request.getParameter("nickName");
	int age = request.getParameter("age")==null ? 25 : Integer.parseInt(request.getParameter("age"));

	session.setAttribute("sMid", mid);
	session.setAttribute("sNickName", nickName);
	session.setAttribute("sAge", age);
%>
<script>
	alert("<%=mid%>님 세션에 정보가 저장되었습니다.");
	history.back();
</script>