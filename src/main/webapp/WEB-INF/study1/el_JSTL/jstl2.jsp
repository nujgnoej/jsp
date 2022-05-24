<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>jstl2.jsp</title>
	<%@ include file="/include/bs4.jsp" %>
</head>
<body>
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
    <h2>Function 라이브러리</h2>
    <p>사용법 : $ {fn:함수(변수/값)}</p>
    <hr/>
<%				// 0		 1		   2
				// 0123456789012345678901234
	String atom = "Welcome to My Homepage!";
	pageContext.setAttribute("atom", atom);
%>
	<p>
		atom변수의 값 : <%=atom %> / ${atom}<br/>
		1.atom변수의 길이 : <%=atom.length() %> / ${fn:length(atom)}</br>
		2.대문자변화(toUpperCase()) : <%=atom.toUpperCase() %> / ${fn:toUpperCase(atom)}<br/>
		3.소문자변화(toLowerCase()) : <%=atom.toLowerCase() %> / ${fn:toLowerCase(atom)}<br/>
		4-1.문자열추출1(substring()) : <%=atom.substring(0,3) %> / ${fn:substring(atom,0,3)}<br/>
		4-2.문자열추출2(substring()) : <%=atom.substring(3) %> / <%-- ${fn:substring(atom,3)} --%>
		  		${fn:substring(atom,3,fn:length(atom))}<br/>
		5.특정문자열의 위치값찾기(indexOf()) : <%=atom.indexOf("o") %> / ${fn:indexOf(atom,'o')}<br/>
		5-2.atom변수에 기억되어 있는 'o'문자의 위치를 모두 출력하시오?<br/>
		  <c:set var="cnt" value="0"/>
		  <c:forEach var="i" begin="0" end="${fn:length(atom)-1}">
		  	<c:if test="${fn:substring(atom,i,i+1) == 'o'}">
		  	  o의 위치값은? ${i}<br/>
		  	  <c:set var="cnt" value="${cnt+1}"/>
		  	</c:if>
		  </c:forEach>
		  총 o 문자의 개수는? ${cnt}<br/>
		5-3.atom변수에 기억되어 있는 값중 귀에서 처음 만나는 'o'문자의 위치는?
		  <%=atom.lastIndexOf("o") %> / <%-- ${fn:lastIndexOf(atom,'o')} --%><br/>
		  <c:forEach var="i" begin="0" end="${fn:length(atom)-1}">
		  	<c:if test="${fn:substring(atom,i,i+1) == 'o'}">
		  	  <c:set var="lastStr" value="${i}"/>
		  	</c:if>
		  </c:forEach>
		  o의 마지막 위치값은? ${lastStr}<br/>
		6.문자열추출(substringBefore() / substringAfter())<br/>
		  'o'앞의 문자열 출력 : ${fn:substringBefore(atom,'o')}<br/>
		  'o'뒤의 문자열 출력 : ${fn:substringAfter(atom,'o')}<br/>
		7.2번째로 만나는 'o'의 위치값은?
		    ${fn:indexOf(atom,fn:substringAfter(fn:substringAfter(atom,'o'),'o'))-1}<br/>
		  - 먼저 첫번째로 만나는 'o'의 문자 뒤의 모든값을 변수에 담는다. : <br/>
		    ${fn:substring(atom,0,fn:indexOf(atom,'o'))}<br/>
		    ${fn:substring(atom,fn:indexOf(atom,'o')+1,fn:length(atom))}<br/>
		8.문자열 분리(split(변수, 분리할문자))<br/>
		'o'문자를 기준으로 분리하기.
		<c:set var="arrAtom" value="${fn:split(atom,'o')}"/>
		<c:forEach var="arr" items="${arrAtom}">
			${arr} / &nbsp;
		</c:forEach>
		<br/>
		arrAtom[0] = ${arrAtom[0]}<br/>
		arrAtom[1] = ${arrAtom[1]}<br/>
		arrAtom[2] = ${arrAtom[2]}<br/>
		arrAtom[3] = ${arrAtom[3]}<br/>
		<hr/>
		9.문자열 치환(replace())<br/>
		  <%=atom.replace("My", "Your") %> / ${fn:replace(atom,'My','Your')}
		<hr/>
		10.특정문자로 시작하는지의 유무를 판단? startsWith(문자열, 시작문자열)<br/>
		  atom변수의 문자가 'W'로 시작하느냐? ${fn:startsWith(atom, 'W')}<br/>
		<hr/>
		11.특정문자로 끝나는지의 유무를 판단? endsWith(문자열, 마지막문자열)<br/>
		  atom변수의 문자가 '!'로 끝나느냐? ${fn:endsWith(atom, '!')}<br/>
		<hr/>
		12.특정문자의 포함유무? contains()<br/>		<!-- 한글도 가능 -->
		  atom변수에 'o'를 포함하느냐? ${fn:contains(atom, 'o')}<br/>
		  atom변수에 'Your'를 포함하느냐? ${fn:contains(atom, 'Your')}<br/>
	</p>
	<br/>
	<hr/>
<%
	int won = 1234567;
	pageContext.setAttribute("won", won);
%>
	<h4>Format 라이브러리</h4>
	<p>형식문자열을 지정할때 사용(쉼표,화폐단위,백분율)</p>
	<p>사용법 : < fmt : 명령어 value=" $ { 값 }"</p>
	<p>
		<h5>formatNumber 형식을 지정한 출력</h5>
		1.천단위마다 콤마표시 : <fmt:formatNumber value="${won}"/><br/>
		2.화폐단위 : <fmt:formatNumber value="${won}" type="currency"/><br/>
		2-2.영문화폐단위 : <fmt:formatNumber value="${won}" type="currency" currencyCode="USD"/><br/>
		<c:set var="su" value="123456.789"/>
		3.소수이하 두자리 출력(반올림) : <fmt:formatNumber value="${su}"/> / <fmt:formatNumber value="${su}" pattern=".00"/><br/>
		3-2.정수부만 출력(소수이하 반올림) : <fmt:formatNumber value="${su}" pattern="0"/><br/>
		3-3.정수부만 출력(소수이하 반올림, 콤마) : <fmt:formatNumber value="${su}" pattern="#,##0"/><br/>
		3-4.정수부만 출력(소수이하 버림) : <fmt:parseNumber value="${su}" integerOnly="true"/><br/>
		<c:set var="su1" value="55"/>
		<c:set var="su2" value="100"/>
		4.백분율 : <fmt:formatNumber value="${su1/su2}" type="percent"/><br/>
		<hr/>
		<h4>날짜형식 : formatDate</h4>
		<p>자바형식의 날짜를 jstl변수에 저장하기 : <c:set var="now" value="<%=new java.util.Date() %>"/></p>
		<p>
			오늘 날짜: ${now}<br/>
			<fmt:formatDate value="${now}"/><br/>
			<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/><br/>
			<fmt:formatDate value="${now}" pattern="hh : mm : ss"/><br/>
			<fmt:formatDate value="${now}" pattern="yyyy-MM-dd hh:mm:ss"/><br/>
			<fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일 hh시 mm분 ss초"/><br/>
			
		</p>
		<hr/>
		<h4>국가별성정(로케일)</h4>
		<p>
			톰캣 서버의 기본 로케일 : <%=response.getLocale() %><br/>
			미국식으로 로케일 변경후 통화량 표시?<fmt:setLocale value="en_US"/>
			<fmt:formatNumber value="${won}" type="currency"/>
		</p>
		<br/>
		<hr/>
		<h4>기타 참조사항</h4>
		<p>
			지정한곳으로의 이동? location.href() / response.sendRedirect() / c:redirect<br/>
			<%-- <c:redirect url="jstl1.st"/> --%>
			<%-- <c:redirect url="https://www.naver.com"/> --%>
		</p>
		<p>
			<b>URL문 : 그림파일이나 외부파일을 불러올수 있다.</b><br/>
			<div>그림1 : <img src="${ctp}/images/01.jpg" width="300px"/></div>
			<div>그림2 : <img src="images/02.jpg" width="300px"/></div>
			<div>그림3 : <c:url var="data" value="images/20.jpg"/>
				<img src="${data}" width="300px"/>
			</div>
		</p>
		<p>
			<%-- <%@ include file="/include/footer.jsp" %> --%>
			<c:import url="/include/footer.jsp"></c:import>
		</p>
	</p>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>