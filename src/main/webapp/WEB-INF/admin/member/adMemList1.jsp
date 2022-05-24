<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>adMemList.jsp</title>
	<%@ include file="/include/bs4.jsp" %>
	<script>
		'use strict';
		function levelChange() {
			alert("등급변경 버튼을 클릭하시면 선택된 등급으로 변환됩니다.");
		}
		
		function userDelCheck(idx) {
			let ans = confirm("정말 회원에서 삭제처리하시겠습니까?");
			if(ans) location.href="${ctp}/memUserDelete.mem?idx="+idx;
		}
	</script>
</head>
<body>
<p><br/><p>
<div class="container">
    <h2 class="text-center">전체 회원 리스트</h2>
    <br/>
    <table class="table table-hover text-center">
    	<tr class="table-dark text-dark">
    		<th>번호</th>
    		<th>아이디</th>
    		<th>별명</th>
    		<th>성명</th>
    		<th>공개유무</th>
    		<th>회원등급</th>
    		<th>활동유무</th>
    	</tr>
    	<c:forEach var="vo" items="${vos}" varStatus="st">
    		<tr>
    			<td>${curScrStartNo}</td>
    			<td><a href="${ctp}/memInfor.mem?mid=${vo.mid}">${vo.mid}</a></td>
    			<td>${vo.nickName}</td>
    			<td>${vo.name}</td>
    			<td>${vo.userInfor}</td>
    			<td>
    				<%-- 
    				<c:if test="${vo.level == 0}"><c:set var="strLevel" value="관리자"/></c:if>
    				<c:if test="${vo.level == 1}"><c:set var="strLevel" value="준회원"/></c:if>
    				<c:if test="${vo.level == 2}"><c:set var="strLevel" value="정회원"/></c:if>
    				<c:if test="${vo.level == 3}"><c:set var="strLevel" value="우수회원"/></c:if>
    				<c:if test="${vo.level == 4}"><c:set var="strLevel" value="운영자"/></c:if>
    				 --%>
    				<form name="levelForm" method="post" action="${ctp}/adMemLevelChange.ad">
	    				<select name="level" onchange="levelChange()">
	    					<option value="0" <c:if test="${vo.level == 0}">selected</c:if>>관리자</option>
	    					<option value="1" <c:if test="${vo.level == 1}">selected</c:if>>준회원</option>
	    					<option value="2" <c:if test="${vo.level == 2}">selected</c:if>>정회원</option>
	    					<option value="3" <c:if test="${vo.level == 3}">selected</c:if>>우수회원</option>
	    					<option value="4" <c:if test="${vo.level == 4}">selected</c:if>>운영자</option>
	    				</select>
						<input type="submit" value="등급변경" class="btn btn-secondary btn-sm"/>
						<input type="hidden" name="idx" value="${vo.idx}"/>
    				</form>
    			</td>
    			<td>
    				<c:if test="${vo.userDel == 'OK'}"><font color="red">탈퇴신청</font></c:if>
    				<c:if test="${vo.userDel != 'OK'}">활동중</c:if>
    				<c:if test="${vo.applyDiff >= 30 && vo.userDel eq 'OK'}"><font color="blue"><a href="javascript:userDelCheck(${vo.idx})">*</a></font></c:if>
    			</td>
    		</tr>
    		<c:set var="curScrStartNo" value="${curScrStartNo-1}"/>
    	</c:forEach>
    	<tr><td colspan="5"></td></tr>
    </table>
</div>
</body>
</html>