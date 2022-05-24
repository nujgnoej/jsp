<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>upLoad1.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
	<script>
		'use strict';
		function fCheck() {
			let fName = $("#file").val();
			let ext = fName.substring(fName.lastIndexOf(".")+1)
			let uExt = ext.toUpperCase();			
			let maxSize = 1024 * 1024 * 10; 	// 업로드 최대파일의 용량은 10MByte로 제한한다.
			
			if(fName.trim() == "") {
				alert("업로드할 파일을 선택하세요!");
				return false;
			}
			
			let fileSize = document.getElementById("file").files[0].size;
			if(uExt != "JPG" && uExt != "GIF" && uExt != "PNG" && uExt != "ZIP" && uExt != "HWP" && uExt != "PPT" && uExt != "PPTX") {
				alert("업로드 가능한 파일은 'JPG/GIF/PNG/ZIP/HWP/PPT' 입니다.")
				return false;
			}
			else if(fileSize > maxSize) {
				alert("업로드할 파일은 최대 10Mbyte 입니다.")
				return false;
			}
			else {
				myForm.submit();
			}
		}
	</script>
</head>
<body>
<jsp:include page="/include/header_home.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/><p>
<div class="container">
    <h2>파일 업로드 테스트 1(싱글파일처리)</h2>
    <p>cos라이브러리를 이용한 파일 업로드</p>
    <hr/>
    <form name="myForm" method="post" action="upLoad1Ok.st" enctype="multipart/form-data">
    	<div class="form-group">파일명 : 
	    	<input type="file" name="fName" id="file" class="form-control-file border mb-2"/>
	    	<input type="button" value="전송" onclick="fCheck()" class="btn btn-primary form-control"/>
    	</div>
    </form>
    <hr/><br/>
    <p><a href="downLoad1.st" class="btn btn-info form-control">다운로드 폼으로 이동하기</a></p>
    <hr/>
</div>
<p><br/><p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>