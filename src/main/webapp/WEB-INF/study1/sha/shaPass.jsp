<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>shaPass.jsp</title>
	<%@ include file="/include/bs4.jsp" %>
	<script>
		'use strict';
		function passCheck() {
			var pwd = document.getElementById("pwd").value;
			if(pwd == "") {
				alert('비밀번호를 입력하세요?');
				document.getElementById("pwd").focus;
			}
			else {
				location.href="${ctp}/shaPassOk.st?pwd=" + pwd;
			}
		}
	</script>
</head>
<body>
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
    <h2>SHA(Secure Hash Algorithm)</h2>
    <pre>
    	: SHA는 단방향식 암호화기법으로, 암호학적 해시함수들의 모임이다.
    	  일반적으로 복호화 할 수 없도록 만든 알고리즘을 SHA-2라고 한다.
    	  해시함수가 출력하는 암축된 문장을 다이제스트(Digest)라고 한다.
    	  SHA-2가 생성해주는 다이제스트의 출력길이는 256, 512Bit가 있다.
    	  256Bit의 출력길이를 갖는 SHA-2암호화를 'SHA-256 암호화' 방식이라고 한다.
    </pre>
    <hr/>
    <p>
    	숫자나 문자를 입력하시오?
    	<input type="password" name="pwd" id="pwd" autofocus />
    	<input type="button" value="암호화하기" onclick="passCheck()"/>
    </p>
    <hr/>
    <div id="demo">암호화된 비밀번호 : <font color="red">${shaPwd}</font></div>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>