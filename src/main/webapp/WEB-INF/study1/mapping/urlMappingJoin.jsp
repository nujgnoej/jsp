<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="UTF-8">
	<title>urlMappingJoin.jsp</title>
	<%@ include file="/include/bs4.jsp" %>
	<script>
		function fCheck() {
			// Front 체크....후 전송한다.
			myForm.submit();
		}
	</script>
</head>
<body>
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
    <h2>회 원 가 입</h2>
    <form name="myForm" method="post" action="${ctp}/urlMappingJoinOk.um">
    	<table class="table">
    		<tr>
    			<th>아이디</th>
    			<td><input type="text" name="mid" autofocus class="form-control"/></td>
    		</tr>
    		<tr>
    			<th>비밀번호</th>
    			<td><input type="password" name="pwd" class="form-control" /></td>
    		</tr>
    		<tr>
    			<th>성명</th>
    			<td><input type="text" name="name" class="form-control" /></td>
    		</tr>
    		<tr>
    			<td colspan="2">
    				<div class="row">
	    				<div class="col text-left"><input type="button" value="회원가입" onclick="fCheck()" class="btn btn-info" /></div>
	    				<div class="col text-right"><input type="button" value="돌아가기" onclick="location.href='${ctp}/urlMapping.um';" class="btn btn-info" /></div>
    				</div>
    			</td>
    		</tr>
    	</table>
    </form>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>