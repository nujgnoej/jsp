<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>calendar1.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
	<style>
		#td1,#td8,#td15,#td22,#td29,#td36 {color:red;}
		#td7,#td14,#td21,#td28,#td35 {color:blue;}
		.today {
			font-size: 1.5em;
			background-color: pink;
			color: #fff;
		}
	</style>
</head>
<body>
<jsp:include page="/include/header_home.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/><p>
<div class="container">
    <div class="text-center">
    	<button class="btn btn-secondary btn-sm" onclick="location.href='${ctp}/calendar1.st?yy=${yy-1}&mm=${mm}';" title="이전년도">◁◁</button>
    	<button class="btn btn-secondary btn-sm" onclick="location.href='${ctp}/calendar1.st?yy=${yy}&mm=${mm-1}';" title="이전월">◀</button>
    	&nbsp; <font size="5">${yy}년 ${mm+1}월</font> &nbsp;
    	<button class="btn btn-secondary btn-sm" onclick="location.href='${ctp}/calendar1.st?yy=${yy}&mm=${mm+1}';" title="다음월">▶</button>
    	<button class="btn btn-secondary btn-sm" onclick="location.href='${ctp}/calendar1.st?yy=${yy+1}&mm=${mm}';" title="다음년도">▷▷</button>
    	&nbsp; &nbsp;
    	<button class="btn btn-secondary btn-sm" onclick="location.href='${ctp}/calendar1.st';" title="오늘날짜"><i class="fa fa-home"></i></button>
    </div>
    <br/>
    <div>
    	<table class="table table-bordered" style="height:450px;">
    		<tr class="text-center" style="background-color:#eee">
				<th style="width:13%; color:red; vertical-align:middle">일</th>
				<th style="width:13%; vertical-align:middle">월</th>
				<th style="width:13%; vertical-align:middle">화</th>
				<th style="width:13%; vertical-align:middle">수</th>
				<th style="width:13%; vertical-align:middle">목</th>
				<th style="width:13%; vertical-align:middle">금</th>
				<th style="width:13%; color:blue; vertical-align:middle">토</th>
			</tr>
    		<tr">
    			<!-- 시작일 이전을 공백처리한다. -->
    			<c:set var="gap" value="1"/>
    			<c:forEach begin="1" end="${startWeek-1}">
    				<td>&nbsp;</td>
    				<c:set var="gap" value="${gap + 1}"/>
    			</c:forEach>
    			
    			<!-- 해당월에 대한 날짜를 반복 출력한다. -->
    			<c:set var="cnt" value="${gap}"/>
    			<c:forEach begin="1" end="${lastDay}" varStatus="st">
    				<c:set var="todaySw" value="${toYear==yy && toMonth==mm && toDay==st.count ? 1 : 0}"/>	<!-- 오늘날짜가 맞으면 1을 틀리면 0을 반환 -->
    				<td id="td${cnt}" ${todaySw==1 ? 'class=today' : ''} style="font-size:0.9em;" valign="top">
    					${st.count}
    				</td>
    				<c:if test="${gap % 7 == 0}"><tr></tr></c:if>	<!-- 한주가 꽉차면 다음줄로 줄바꾸기 -->
    				<c:set var="cnt" value="${cnt + 1}"/>
    				<c:set var="gap" value="${gap + 1}"/>
    			</c:forEach>
    			
    			<!-- 마지막일 이후를 공백처리한다. -->
    			<c:forEach begin="${gap}" end="42">
    				<td>&nbsp;</td>
    				<c:if test="${gap % 7 == 0}"><tr></tr></c:if>
    				<c:set var="gap" value="${gap + 1}"/>
    			</c:forEach>
    		</tr>
    	</table>
    </div>
</div>
<p><br/><p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>