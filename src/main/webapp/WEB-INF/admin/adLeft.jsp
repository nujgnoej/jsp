<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>adLeft.jsp</title>
	<%@ include file="/include/bs4.jsp" %>
	<script>
		function logoutCheck() {
			parent.location.href="${ctp}/memLogOut.mem";
		}
	</script>
	<style>
		body {background-color:#ddd}
	</style>
</head>
<body>
<p><br/><p>
<div class="container">
    <h4>관리자메뉴</h4>
    <hr/>
    <p><a href="${ctp}/" target="_top">홈으로</a></p>
    <p><a href="${ctp}/adGuestList.ad" target="adContent">방명록</a></p>
    <p><a href="${ctp}/adMemList.ad" target="adContent">회원관리</a></p>
    <p><a href="${ctp}/adBoList.ad" target="adContent">게시판</a></p>
    <p><a href="${ctp}/" target="adContent">게시판</a></p>
    <p><a href="${ctp}/" target="adContent">자료실</a></p>
    <p><a href="javascript:logoutCheck()">로그아웃</a></p>
</div>
</body>
</html>