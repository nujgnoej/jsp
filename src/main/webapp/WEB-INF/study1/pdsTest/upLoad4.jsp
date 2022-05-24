<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>upLoad4.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
	<script>
		'use strict';
		
		function fCheck() {
			let fName = $("#fName").val();
			let maxSize = 1024 * 1024 * 20;
			
			if(fName.trim() == "") {
				alert("업로드할 파일명을 선택하세요.");
				return false;
			}
			
			let fileLength = document.getElementById("fName").files.length;
			let fileSize = 0;
			for(let i=0; i<fileLength; i++) {
				fName = document.getElementById("fName").files[i].name;		// 개별 파일명을 변수에 담는다.
				let ext = fName.substring(fName.lastIndexOf(".")+1)
				let uExt = ext.toUpperCase();
				fileSize += document.getElementById("fName").files[i].size;
				
				if(uExt != "JPG" && uExt != "GIF" && uExt != "PNG" && uExt != "ZIP" && uExt != "HWP" && uExt != "PPT" && uExt != "PPTX") {
					alert("업로드 가능한 파일은 'JPG/GIF/PNG/ZIP/HWP/PPT' 입니다.")
					return false;
				}
			}
			
			if(fileSize > maxSize) {
				alert("업로드할 파일은 최대 20Mbyte 입니다.")
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
    <form name="myForm" method="post" action="upLoad2Ok.st" enctype="multipart/form-data">
	    <h2>파일 업로드 테스트 4(멀티파일처리-다중파일선택)</h2>
	    <p>cos라이브러리를 이용한 파일 업로드</p>
	    <p>여러개의 파일을 선택할 경우는 'Ctrl+클릭/Shift+클릭' 하세요</p>
		<hr/>
	    <div class="form-group">
	    	<input type="file" name="fName" id="fName" class="form-control-file border" autofocus multiple />
	    </div>
	    <hr/>
	    <div class="form-group">
	    	<input type="button" value="전송" onclick="fCheck()" class="btn btn-secondary form-control mb-3" />
	    	<input type="button" value="다운로드 폼으로" onclick="location.href='${ctp}/downLoad1.st'" class="btn btn-info form-control" />
	    </div>
	    <hr/>
	    <input type="hidden" name="upLoadFlag" value="4" />
    </form>
</div>
<p><br/><p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>