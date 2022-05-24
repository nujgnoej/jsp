<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>colorTest.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
	<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-brown.css">
</head>
<body>
<jsp:include page="/include/header_home.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/><p>
<div class="container">
    <div class="w3-indigo" style="width:300px; height:150px;">
    	이곳은 색상 연습입니다.(Indigo)
    </div>
    <br/><br/>
    <div>
    	<input type="button" value="버튼컬러1" class="btn form-control w3-red w3-hover-pale-yellow"/>
    	<input type="button" value="버튼컬러2" class="btn form-control w3-theme-d5 w3-hover-sand"/>
    </div>
</div>
<p><br/><p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>