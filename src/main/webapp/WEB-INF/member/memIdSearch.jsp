<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>memIdSearch.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
	<script>
		'use strict';
		function idSearch() {
			
		}
	</script>
</head>
<body>
<jsp:include page="/include/header_home.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/><p>
<div class="container">
    <form name="idCheckForm" method="post" action="${ctp}/memIdSearchCheck.mem">
    	<input type="text" name="email" placeholder="회원가입시 등록하신 이메일주소를 입력해주세요."/><br/>
    	<input type="button" value="아이디찾기" onclick="idSearch()"/>
    </form>
</div>
<p><br/><p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>