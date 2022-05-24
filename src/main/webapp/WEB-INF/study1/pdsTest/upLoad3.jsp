<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>upLoad3.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
	<script>
		'use strict';
		let cnt = 1;
		
		function fileBoxAppend() {
			cnt++;
			let fileBox = "";
			fileBox += '<div id="fBox'+cnt+'" class="form-group">';
			fileBox += '<input type="file" name="fName'+cnt+'" id="fName'+cnt+'" class="form-control mb-2" style="width:85%; float:left;"/>';
			fileBox += '<input type="button" value="삭제" onclick="deleteBox('+cnt+')" class="btn btn-danger form-control ml-2" style="width:10%"/>';
			fileBox += '</div>';
			$("#fileBoxInsert").append(fileBox);
		}
		
		function deleteBox(cnt) {
			$("#fBox"+cnt).remove();
		}
		
		function fCheck() {
			let fName = $("#fName1").val();
			let maxSize = 1024 * 1024 * 20;
			
			if(fName.trim() == "") {
				alert("업로드할 파일명을 선택하세요.");
				return false;
			}
			
			let fileSize = 0;
			for(let i=1; i<=cnt; i++) {
				let imsiName = "fName" + i;
				fName = document.getElementById(imsiName).value;
				if(fName != "") {
					let ext = fName.substring(fName.lastIndexOf(".")+1)
					let uExt = ext.toUpperCase();
					fileSize += document.getElementById(imsiName).files[0].size;
					
					if(uExt != "JPG" && uExt != "GIF" && uExt != "PNG" && uExt != "ZIP" && uExt != "HWP" && uExt != "PPT" && uExt != "PPTX") {
						alert("업로드 가능한 파일은 'JPG/GIF/PNG/ZIP/HWP/PPT' 입니다.")
						return false;
					}
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
	    <h2>파일 업로드 테스트 3(멀티파일처리-동적폼)</h2>
	    <p>cos라이브러리를 이용한 파일 업로드</p>
		<hr/>
	    <div class="form-group">
	    	<input type="button" value="파일박스추가" onclick="fileBoxAppend()" class="btn btn-info btn-sm form-control mb-2" />
	    	<input type="file" name="fName1" id="fName1" class="form-control" autofocus />
	    </div>
	    <div id="fileBoxInsert" class="form-group"></div>
	    <hr/>
	    <div class="form-group">
	    	<input type="button" value="전송" onclick="fCheck()" class="btn btn-secondary form-control" />
	    	<input type="button" value="다운로드 폼으로" onclick="location.href='${ctp}/downLoad1.st'" class="btn btn-info form-control" />
	    </div>
	    <hr/>
	    <input type="hidden" name="upLoadFlag" value="3" />
    </form>
</div>
<p><br/><p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>