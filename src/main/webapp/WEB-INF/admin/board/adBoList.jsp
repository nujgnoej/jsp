<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>adBoList.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
	<script>
		'use strict';
		// 페이지마다 보여주는 게시물갯수 처리
		function pageCheck() {
			let pageSize = $("#pageSize").val();
			location.href = "adBoList.ad?pag=${pag}&pageSize="+pageSize;
		}
		
		function adRecent() {
			let recent = $("#recent").val();
			let pageSize = $("#pageSize").val();
			if(recent == "0") {
				alert("최신 검색일자를 선택하세요");
			}
			else {
				location.href = "adBoList.ad?pag=${pag}&pageSize="+pageSize+"&recent="+recent;
			}
		}
	</script>
</head>
<body>
<p><br/><p>
<div class="container">
    <h2 class="text-center">게 시 판 리 스 트</h2>
    <br/>
    <table class="table table-borderless">
    	<tr>
    		<td class="text-left p-0">
    			<select name="recent" id="recent" onchange="adRecent()">
    				<option value="0">최신자료순</option>
    				<c:forEach var="i" begin="1" end="30">
    					<option value="${i}" ${recent==i ? 'selected' : ''}>${i}일전</option>
    				</c:forEach>
    			</select>
    		</td>
    		<td class="text-right p-0">
    			<select name="pageSize" id="pageSize" onchange="pageCheck()">
    				<option value="5" ${pageSize==5 ? 'selected' : ''}>5건</option>
    				<option value="10" ${pageSize==10 ? 'selected' : ''}>10건</option>
    				<option value="15" ${pageSize==15 ? 'selected' : ''}>15건</option>
    				<option value="20" ${pageSize==20 ? 'selected' : ''}>20건</option>
    			</select>
    		</td>
    	</tr>
    </table>
    <table class="table table-hover text-center">
    	<tr class="table-dark text-dark">
    		<th>글번호</th>
    		<th>글제목</th>
    		<th>글쓴이</th>
    		<th>글쓴날짜</th>
    		<th>조회수</th>
    		<th>좋아요</th>
    	</tr>
    	<c:forEach var="vo" items="${vos}">
    		<tr>
    			<td>${curScrStartNo}</td>
    			<td class="text-left"><a href="boContent.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}">${vo.title}</a>
    				<c:if test="${vo.replyCount != 0}">[${vo.replyCount}]</c:if>
    				<c:if test="${vo.wNdate <= 24}"><img src="${ctp}/images/new.gif"/></c:if>
    			</td>
    			<td>${vo.nickName}</td>
    			<td>
    				<c:if test="${vo.wNdate <= 24}">${fn:substring(vo.wDate,11,19)}</c:if>
    				<c:if test="${vo.wNdate > 24}">${fn:substring(vo.wDate,0,10)}</c:if>
    			</td>
    			<td>${vo.readNum}</td>
    			<td>${vo.good}</td>
    		</tr>
    		<c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
    	</c:forEach>
    	<tr><td colspan="6" class="p-0"><td></tr>
    </table>
</div>
<!-- 블록 페이징 처리 시작 -->
<div class="text-center">
	<ul class="pagination justify-content-center">
		<c:if test="${pag >= 1}">
			<li class="page-item"><a href="adBoList.ad?pag=1&pageSize=${pageSize}&recent=${recent}" class="page-link text-secondary">◁◁</a></li>
		</c:if>
		<c:if test="${curBlock > 0}">
			<li class="page-item"><a href="adBoList.ad?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}&recent=${recent}" class="page-link text-secondary">◀</a></li>
		</c:if>
		<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
			<c:if test="${i <= totPage && i == pag}">
	 			<li class="page-item active"><a href="adBoList.ad?pag=${i}&pageSize=${pageSize}&recent=${recent}" class="page-link text-light bg-secondary border-secondary">${i}</a></li>
			</c:if>
			<c:if test="${i <= totPage && i != pag}">
				<li class="page-item"><a href="adBoList.ad?pag=${i}&pageSize=${pageSize}&recent=${recent}" class="page-link text-secondary">${i}</a></li>
			</c:if>
		</c:forEach>
		<c:if test="${curBlock < lastBlock}">
			<li class="page-item"><a href="adBoList.ad?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}&recent=${recent}" class="page-link text-secondary">▶</a></li>
		</c:if>
		<c:if test="${pag <= totPage}">
			<li class="page-item"><a href="adBoList.ad?pag=${totPage}&pageSize=${pageSize}&recent=${recent}" class="page-link text-secondary">▷▷</a></li>
		</c:if>
	</ul>
</div>
<!-- 블록 페이징 처리 끝 -->

</body>
</html>