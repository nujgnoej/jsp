<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t4_ApplicationSave.jsp -->
<%
	String mid = request.getParameter("mid") == null ? "hkd1234" : request.getParameter("mid");
	String nickName = request.getParameter("nickName") == null ? "홍장군" : request.getParameter("nickName");
	int age = request.getParameter("age") == null ? 25 : Integer.parseInt(request.getParameter("age"));
	
	application.setAttribute("aMid", mid);
	application.setAttribute("aNickName", nickName);
	application.setAttribute("aAge", age);
%>
<script>
	alert("Application에 정보를 저장했습니다.");
	location.href="t4_ApplicationMain.jsp";
</script>