<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>t4_ApplicationCheck.jsp</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>Application 확인</h2>
	<hr/>
	<div class="border">
		<div class="row m-3">
			<div class="col">Application 아이디</div>
			<div class="col">${aMid}</div>
		</div>
		<div class="row m-3">
			<div class="col">Application 닉네임</div>
			<div class="col">${aNickName}</div>
		</div>
		<div class="row m-3">
			<div class="col">Application 나이</div>
			<div class="col">${aAge}</div>
		</div>
	</div>
	<br/>
	<div><a href="t4_ApplicationMain.jsp" class="btn btn-success form-control m-1">돌아가기</a></div>
	<div><button type="button" onclick="location.href='t4_ApplicationMain.jsp';" class="btn btn-success form-control m-1">돌아가기</button></div>
</div>
<p><br/></p>
</body>
</html>