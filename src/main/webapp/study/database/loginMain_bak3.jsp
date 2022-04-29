<%@ include file="/include/memberCheck.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%
	// int point = Integer.parseInt(request.getParameter("point"));
	// int vCount = Integer.parseInt(request.getParameter("vCount"));
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>loginMain.jsp</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
		'use strict';
		function delCheck() {
			let ans = confirm("정말 탈퇴하시겠습니까?");
			if(ans) {
				location.href = "${ctp}/loginDelete";
			}
		}
	</script>
</head>
<body>
<p><br/></p>
<div class="container text-center">
	<h2>회원 전용방</h2>
	<hr/>
	<p><font color="blue"><b>${sMid}(${sName})</b></font>님 로그인 중입니다.</p>
	<p><img src="<%=request.getContextPath()%>/images/10.JPG" width="500px" /></p>
	<hr/>
	<%-- <p>방문횟수 : <%=vCount%> / 포인트 : <%=point%></p> --%>
	<p>방문횟수 : ${param.vCount} / 포인트 : ${param.point}</p>
	<hr/>
	<div class="row">
		<div class="col"><a href="${ctp}/loginSearch" class="btn btn-success form-control m-1">개인 정보조회</a></div>
		<div class="col"><a href="${ctp}/loginUpdate" class="btn btn-success form-control m-1">개인 정보수정</a></div>
		<div class="col"><a href="javascript:delCheck();" class="btn btn-success form-control m-1">회원 탈퇴</a></div>
	</div>
	<div class="row">
		<div class="col"><a href="${ctp}/loginList" class="btn btn-success form-control m-1">전체 회원</a></div>
		<div class="col"><a href="${ctp}/logOut" class="btn btn-success form-control m-1">로그아웃</a></div>
	</div>
</div>
<p><br/></p>
</body>
</html>