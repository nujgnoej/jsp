<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>test10.jsp</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/><p>
<div class="container">
    <h2>test10.jsp</h2>
    <h2>JSP Form Tag 연습(service메소드에서 처리)</h2>
    <!-- <form name="myForm" method="post" action="../T10"> -->
    <form name="myForm" method="post" action="../T10_2">
    	<p>아이디 : <input type="text" name="mid" value="hkd1234" autofocus /></p>
    	<p>비밀번호 : <input type="password" name="pwd" value="1234"/></p>
    	<p>성명 : <input type="text" name="name" value="홍길동" /></p>
    	<p>
    		<input type="submit" value="전송" />
    		<input type="reset" value="다시입력" />
    	</p>
    	<%-- 
    	<p>
    		현재 접속중인 IP : <%=request.getRemoteAddr() %><br/>
    		현재 접속중인 IP : <input type="text" name="hostIp" value="<%=request.getRemoteAddr() %>" readonly />
    	</p>
    	 --%>
    	<input type="hidden" name="hostIp" value="<%=request.getRemoteAddr() %>"/>
    </form>
</div>
<p><br/><p>
</body>
</html>