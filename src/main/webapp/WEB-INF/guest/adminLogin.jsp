<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>adminLogin.jsp</title>
	<%@ include file="/include/bs4.jsp" %>
</head>
<body>
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/></p>
<div class="container">
	<form name="myForm" method="post" action="<%=request.getContextPath()%>/adminLoginOk.gu">
		<table class="table table-bordered text-center">
			<tr>
				<td colspan="2"><h3>관 리 자 로 그 인</h3></td>
			</tr>
			<tr>
				<td class="bg-secondary text-white">아이디</td>
				<td><input type="text" name="mid" autofocus class="form-control"/></td>
			</tr>
			<tr>
				<td class="bg-secondary text-white">비밀번호</td>
				<td><input type="password" name="pwd" value="1234" class="form-control"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn btn-secondary">관리자로그인</button> &nbsp;
					<button type="reset" class="btn btn-secondary">다시입력</button> &nbsp;
					<button type="button" class="btn btn-secondary" onclick="location.href='${ctp}/guestList.gu';">돌아가기</button> &nbsp;
				</td>
			</tr>
		</table>
	</form>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>