<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t2_LoginDel.jsp -->
<%
	Cookie[] cookies = request.getCookies();
	String mid = "";	
	
	for(int i=0; i<cookies.length; i++) {
		if(cookies[i].getName().equals("cMid")) {
			mid = cookies[i].getValue();
			cookies[i].setMaxAge(0);
			response.addCookie(cookies[i]);
			break;
		}
	}
%>
<script>
	alert("<%=mid%>님 쿠키정보가 삭제되었습니다.");
	location.href="t2_LogOut.jsp";
</script>