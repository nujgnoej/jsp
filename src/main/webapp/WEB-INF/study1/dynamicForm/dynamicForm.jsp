<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>dynamicForm.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
	<script>
		'use strict';
		let cnt = 1;
		
		function textBoxAppend() {
			cnt++;
			let textBox = "";
			textBox += '<div id="tBox'+cnt+'" class="form-group">';
			textBox += '<input type="text" name="product'+cnt+'" id="product'+cnt+'" class="form-control mb-2" style="width:85%; float:left;"/>';
			textBox += '<input type="button" value="삭제" onclick="deleteBox('+cnt+')" class="btn btn-danger form-control ml-2" style="width:10%;"/>';
			textBox += '</div>';
			$("#textBoxInsert").append(textBox);
		}
		
		function deleteBox(cnt) {
			$("#tBox"+cnt).remove();
		}
		
		function textView() {
			let str = "";
			for(let i=1; i<=cnt; i++) {
				let product = "product" + i;
				if(document.getElementById(product) != null) {
					str += document.getElementById(product).value + " / ";
				}
			}
			$("#demo").html(str);
		}
	</script>
</head>
<body>
<jsp:include page="/include/header_home.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/><p>
<div class="container">
    <h2>동적폼 연습</h2>
    <p>DIV태그를 활용한 동적 테스트박스 추가/삭제</p>
    <hr/>
    <div class="form-group">
    	<input type="button" value="텍스트박스추가" onclick="textBoxAppend()" class="btn btn-info btn-sm form-control mb-2" />
    	<input type="text" name="product1" id="product1" class="form-control" autofocus />
    </div>
    <div id="textBoxInsert" class="form-group"></div>
    <hr/>
    <div class="form-group">
    	<input type="button" value="출력" onclick="textView()" class="btn btn-secondary form-control" />
    </div>
    <hr/>
    <div id="demo"></div>
</div>
<p><br/><p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>