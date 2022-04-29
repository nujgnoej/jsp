<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t3_SessionDelete.jsp -->
<%
	session.removeAttribute("sMid");
%>
<script>
	alert("세션 아이디가 삭제 되었습니다.");
	history.back();
</script>