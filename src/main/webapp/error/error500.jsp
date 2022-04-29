<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>error500.jsp</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/><p>
<div class="container">
    <h2>현재 공사중 입니다.</h2>
    <hr/>
    <p>불편을 드려서 죄송합니다.</p>
    <p><img src="<%=request.getContextPath()%>/images/14.jpg" width="500px"/></p>
    <hr/>
    <p>빠른시일내에 복구하도록 하겠습니다.</p>
    <hr/>
    <p>문의사항 : xxx-xxxx-xxxx</p>
    <hr/>
</div>
<p><br/><p>
</body>
</html>