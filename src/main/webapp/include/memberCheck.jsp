<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- memberCheck.jsp -->
<%	if(session.getAttribute("sMid")==null) { %>		<!-- 로그인안하고 접속 시 로그인창으로 되돌려보낸다. -->
		<script>
			alert("로그인후 사용하세요!");
			location.href="<%=request.getContextPath()%>/study/database/login.jsp";
		</script>
<%
		return;
	}
%>