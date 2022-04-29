<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cMid")) {
				pageContext.setAttribute("mid", cookies[i].getValue());
				break;
			};
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>login.jsp</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
	<form name="myForm" method="post" action="<%=request.getContextPath()%>/login">
		<table class="table table-bordered text-center">
			<tr>
				<td colspan="2"><h3>로 그 인</h3></td>
			</tr>
			<tr>
				<td class="bg-secondary text-white">아이디</td>
				<td><input type="text" name="mid" value="${mid}" autofocus class="form-control"/></td>
			</tr>
			<tr>
				<td class="bg-secondary text-white">비밀번호</td>
				<td><input type="password" name="pwd" value="1234" class="form-control"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn btn-success">로그인</button>&nbsp;&nbsp;
					<button type="reset" class="btn btn-success">다시입력</button>&nbsp;&nbsp;
					<button type="button" onclick="location.href='loginJoin.jsp';" class="btn btn-success">회원가입</button>&nbsp;&nbsp;
					<input type="checkbox" name="idSave" checked />&nbsp;아이디저장
				</td>
			</tr>
		</table>
	</form>
</div>
<p><br/></p>
</body>
</html>