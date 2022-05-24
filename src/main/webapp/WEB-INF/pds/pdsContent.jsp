<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>pdsContent.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
	<style>
		th {
			background-color: #ddd;
		}
	</style>
</head>
<body>
<jsp:include page="/include/header_home.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/><p>
<div class="container">
    <h2 class="text-center">개별 자료 상세 내역</h2>
    <br/>
    <table class="table table-bordered text-center">
    	<tr>
    		<th>올린이</th>
    		<td>${vo.nickName}</td>
    		<th>올린날짜</th>
    		<td>${fn:substring(vo.fDate,0,fn:length(vo.fDate)-2)}</td>
    	</tr>
    	<tr>
    		<th>파일명</th>
    		<td>${vo.fName}</td>
    		<th>다운횟수</th>
    		<td>${vo.downNum}</td>
    	</tr>
    	<tr>
    		<th>분류</th>
    		<td>${vo.part}</td>
    		<th>파일크기</th>
    		<td><fmt:formatNumber value="${vo.fSize / 1024}" pattern="#,##0"/>KByte</td>
    	</tr>
    	<tr>
    		<th>제목</th>
    		<td colspan="3" class="text-left">${vo.title}</td>
    	</tr>
    	<tr>
    		<th>상세내역</th>
    		<td colspan="3" style="height:280px;" class="text-left">${fn:replace(vo.content, newLine, '<br/>')}</td>
    	</tr>
    </table>
    <div class="text-center">
		<input type="button" value="돌아가기" onclick="location.href='${ctp}/pdsList.pds?pag=${pag}&part=${part}';" class="btn btn-secondary"/>
	</div>
	<hr/>
	<div class="text-center">
		<c:set var="fSNames" value="${fn:split(vo.fSName,'/')}"/>
		<c:forEach var="fSName" items="${fSNames}" varStatus="st">
			${st.count}. ${fSName}<br/>
			<c:set var="fSNameLen" value="${fn:length(fSName)}"/>		
			<c:set var="ext" value="${fn:substring(fSName,fSNameLen-3,fSNameLen)}"/>
			<c:set var="extUpper" value="${fn:toUpperCase(ext)}"/>
			<c:if test="${extUpper=='JPG' || extUpper=='GIF' || extUpper=='PNG'}">
				<img src="${ctp}/data/pds/${fSName}" width="500px"/>
			</c:if>
			<hr/>
		</c:forEach>
	</div>
</div>
<p><br/><p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>