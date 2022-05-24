<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>pdsInput.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
	<script>
		'use strict';
		let cnt = 1;
		
		function fileAppend() {
			cnt++;
		  	let fileBox = "";
		  	fileBox += '<div id="fBox'+cnt+'" class="form-group">';
		  	fileBox += '<input type="file" name="fName'+cnt+'" id="fName'+cnt+'" class="form-control-file border" style="width:85%;float:left;"/>';
		  	fileBox += '<input type="button" value="삭제" onclick="deleteBox('+cnt+')" class="btn btn-danger form-control ml-2" style="width:10%"/>';
		  	fileBox += '</div>';
		  	$("#fileInsert").append(fileBox);
		}
		
		function deleteBox(cnt) {
			$("#fBox"+cnt).remove();
		}
		
		function fCheck() {
			let fName = $("#fName1").val();
			let maxSize = 1024 * 1024 * 20;
			let title = $("#title").val();
			let pwd = $("#pwd").val();
			
			if(fName.trim() == "") {
	    		alert("업로드할 파일명을 선택하세요.");
	    		return false;
	    	}
	    	else if(title.trim() == "") {
	    		alert("파일제목을 입력하세요.");
	    		document.getElementById("title").focus();
	    		return false;
	    	}
	    	else if(pwd.trim() == "") {
	    		alert("비밀번호를 입력하세요.");
	    		document.getElementById("pwd").focus();
	    		return false;
	    	}
			
			let fileSize = 0;
			for(let i=1; i<=cnt; i++) {
				let imsiName = "fName" + i;
				fName = document.getElementById(imsiName).value;
				if(fName != "") {
					let ext = fName.substring(fName.lastIndexOf(".")+1);
					let uExt = ext.toUpperCase();
					fileSize += document.getElementById(imsiName).files[0].size;
					
					if(uExt != "JPG" && uExt != "GIF" && uExt != "PNG" && uExt != "ZIP" && uExt != "HWP" && uExt != "PPT" && uExt != "PPTX") {
						alert("업로드 가능한 파일은 'JPG/GIF/PNG/ZIP/HWP/PPT' 입니다.");
						return false;
					}
				}
			}
			
			if(fileSize > maxSize) {
				alert("업로드할 파일은 최대 20Mbyte 입니다.");
				return false;
			}
			else {
				myForm.fileSize.value = fileSize;
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
    <form name="myForm" method="post" action="${ctp}/pdsInputOk.pds" enctype="multipart/form-data">
    	<h2>자 료 올 리 기</h2>
    	<div class="form-group">
    		<input type="button" value="파일추가" onclick="fileAppend()" class="btn btn-info btn-sm mb-2"/>
    		<input type="file" name="fName1" id="fName1" class="form-control-file border" accept=".jpg,.gif,.png,.zip,.ppt,.pptx,.hwp"/>
    	</div>
    	<div class="form-group" id="fileInsert"></div>
    	<div class="form-group">올린이 : ${sNickName}</div>
    	<div class="form-group">
    		<label for="title">제목 : </label>
    		<input type="text" name="title" id="title" placeholder="자료 제목을 입력하세요" class="form-control" required />
    	</div>
    	<div class="form-group">
    		<label for="content">내용 : </label>
    		<textarea rows="4" name="content" id="content" class="form-control"></textarea>
    	</div>
    	<div class="form-group">
    		<label for="part">분류 : </label>
    		<select name="part" id="part" class="form-control">
    			<option value="학습">학습</option>
				<option value="여행" selected>여행</option>
				<option value="음식">음식</option>
				<option value="기타">기타</option>
    		</select>
    	</div>
    	<div class="form-group">
    		<label for="openSw">공개여부 : </label>&nbsp;
    		<input type="radio" name="openSw" value="공개" checked />공개 &nbsp;&nbsp;
    		<input type="radio" name="openSw" value="비공개" />비공개
    	</div>
    	<div class="form-group">
    		<label for="pwd">비밀번호 : </label>
    		<input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요" class="form-control" />
    	</div>
    	<div class="form-group">
			<input type="button" value="자료올리기" onclick="fCheck()" class="btn btn-primary"/> &nbsp;
			<input type="reset" value="다시쓰기" class="btn btn-info"/> &nbsp;
			<input type="button" value="돌아가기" onclick="location.href='${ctp}/pdsList.pds';" class="btn btn-secondary"/>
     	</div>
     	<input type="hidden" name="fileSize"/>
    </form>
</div>
<p><br/><p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>