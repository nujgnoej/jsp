<%@ include file="/include/memberCheck.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%!
	
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>loginSearch.jsp</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/><p>
<div class="container">
    <h2>개별 자료 조회</h2>
    <hr/>
    <table class="table text-center">
		<tr>
			<th>아이디</th><td>${vo.mid}</td>
		</tr>
		<tr>
			<th>성명</th><td>${vo.name}</td>
		</tr>
		<tr>
			<th>포인트</th><td>${vo.point}</td>
		</tr>
		<tr>
			<th>방문회수</th><td>${vo.vCount}</td>
		</tr>
		<tr>
			<th>최종방문일자</th><td>${vo.lastDate}</td>
		</tr>
		<tr><td colspan=2></td></tr>
 	</table>
    <hr/>
    <%-- <p><a href="${ctp}/study/database/loginMain.jsp?point=${vo.point}&vCount=${vo.vCount}" class="btn btn-secondary">돌아가기</a></p> --%>
    <p><a href="${ctp}/loginMain" class="btn btn-secondary">돌아가기</a></p>
</div>
<p><br/><p>
</body>
</html>