<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>scUpdate.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
	<script>
		'use strict';
		function scUpdate() {
			myForm.submit();
			window.close();
		}
	</script>
	<style>
		th {background-color: #ccc}
	</style>
</head>
<body>
<p><br/><p>
<div class="container">
	<form name="myForm" method="post" action="${ctp}/scUpdateOk.sc">
	    <h2>일정 내역보기(${vo.ymd})</h2>
	    <br/>
	    <table class="table table-bordered">
	    	<tr>
	    		<th>작성자</th>
	    		<td>${vo.mid}</td>
	    	</tr>
	    	<tr>
	    		<th>분류</th>
	    		<td>
	    			<select name="part" class="form-control">
				    	<option value="모임" ${vo.part == '모임' ? 'selected' : ''}>모임</option>
				    	<option value="업무" ${vo.part == '업무' ? 'selected' : ''}>업무</option>
				    	<option value="학습" ${vo.part == '학습' ? 'selected' : ''}>학습</option>
				    	<option value="여행" ${vo.part == '여행' ? 'selected' : ''}>여행</option>
				    	<option value="기타" ${vo.part == '기타' ? 'selected' : ''}>기타</option>
			    	</select>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>내용</th>
	    		<td><textarea rows="4" class="form-control" name="content">${vo.content}</textarea></td>
	    	</tr>
	    	<tr>
	    		<td colspan="2" class="text-center">
	    			<input type="button" value="수정하기" onclick="scUpdate()" class="btn btn-info"/> &nbsp;
	    			<input type="button" value="창닫기" onclick="window.close()" class="btn btn-info"/>
	    		</td>
	    	</tr>
	    </table>
	    <input type="hidden" name="idx" value="${vo.idx}"/>
    </form>
</div>
<p><br/><p>
</body>
</html>