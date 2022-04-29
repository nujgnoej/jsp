<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test5_url2.jsp</title>
</head>
<body>
	<h2>성 적 자 료</h2>
	<form name="myform" method="post" action="<%=request.getContextPath()%>/test5_url2/t5">
		<p>성명 : <input type="text" name="name" value="홍길동"/></p>
		<p>학번 : <input type="text" name="hakbun" value="a100"/></p>
		<p>국어 : <input type="number" name="kor" value="100"/></p>
		<p>영어 : <input type="number" name="eng" value="90"/></p>
		<p>수학 : <input type="number" name="mat" value="80"/></p>
		<p>
		  <input type="submit" value="전송"/>
		  <input type="reset" value="다시입력"/>
		</p>
	</form>
</body>
</html>