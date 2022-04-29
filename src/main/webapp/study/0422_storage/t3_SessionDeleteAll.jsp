<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t3_SessionDeleteAll.jsp -->
<%
	session.invalidate();	// 현재 저장된 모든 세션 삭제
%>
<script>
	alert("모든 세션정보가 삭제 되었습니다.");
	history.back();
</script>