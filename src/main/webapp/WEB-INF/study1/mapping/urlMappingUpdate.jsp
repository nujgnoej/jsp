<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="UTF-8">
	<title>urlMappingUpdate.jsp</title>
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
    <h2>회 원 정 보 수 정</h2>
    <form name="myForm" method="post" action="${ctp}/urlMappingUpdateOk.um">
    	<table class="table">
    		<tr>
    			<th>아이디</th>
    			<td>${vo.mid}</td>
    		</tr>
    		<tr>
    			<th>비밀번호</th>
    			<td><input type="password" name="pwd" value="${vo.pwd}" class="form-control" /></td>
    		</tr>
    		<tr>
    			<th>성명</th>
    			<td><input type="text" name="name" value="${vo.name}" class="form-control" /></td>
    		</tr>
    		<tr>
    			<td colspan="2">
    				<div class="row">
	    				<div class="col text-left"><input type="button" value="회원정보수정" onclick="fCheck()" class="btn btn-info" /></div>
	    				<div class="col text-right"><input type="button" value="돌아가기" onclick="location.href='${ctp}/urlMappingList.um';" class="btn btn-info" /></div>
    				</div>
    			</td>
    		</tr>
    	</table>
    	<input type="hidden" name="mid" value="${vo.mid}"/>
    </form>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>