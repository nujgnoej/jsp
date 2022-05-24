<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>scContent.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
	<style>
		th {background-color: #ccc}
	</style>
</head>
<body>
<p><br/><p>
<div class="container">
    <h2>일정 내역보기(${vo.ymd})</h2>
    <br/>
    <table class="table table-bordered">
    	<tr>
    		<th>작성자</th>
    		<td>${vo.mid}</td>
    	</tr>
    	<tr>
    		<th>분류</th>
    		<td>${vo.part}</td>
    	</tr>
    	<tr>
    		<th>내용</th>
    		<td>${fn:replace(vo.content,newLine,"<br/>")}</td>
    	</tr>
    	<tr>
    		<td colspan="2" class="text-center">
    			<input type="button" value="창닫기" onclick="window.close()"/>
    		</td>
    	</tr>
    </table>
</div>
<p><br/><p>
</body>
</html>