<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>test12.jsp</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		'use strict';
		function fCheck() {
			let product1 = document.getElementById("product1").value;
			
			if(product1 == "") {
				alert("첫번째 상품은 등록하셔야 합니다.");
				document.getElementById("product1").focus();
				// return false;
			}
			else {
				myForm.submit();
			}
		}
	</script>
</head>
<body>
<p><br/><p>
<div class="container">
    <h2>상 품 등 록</h2>
    <form name="myForm" method="post" action="<%=request.getContextPath()%>/T12Ok">
    	<p>상품1 : <input type="text" name="product" id="product1" autofocus /></p>
    	<p>상품2 : <input type="text" name="product"/></p>
    	<p>상품3 : <input type="text" name="product"/></p>
    	<p>상품4 : <input type="text" name="product"/></p>
    	<p>상품5 : <input type="text" name="product"/></p>
    	<p>상품6 : <input type="text" name="product"/></p>
    	<p>상품7 : <input type="text" name="product"/></p>
    	<p>
    		<input type="submit" value="전송" onclick="fCheck()"/>
    		<input type="reset" value="취소" />
    	</p>
    </form>
</div>
<p><br/><p>
</body>
</html>