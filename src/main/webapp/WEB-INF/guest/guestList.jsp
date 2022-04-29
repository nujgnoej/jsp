<%@page import="guest.GuestVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String admin = session.getAttribute("sAdmin")==null ? "" : (String) session.getAttribute("sAdmin");
	ArrayList<GuestVO> vos = (ArrayList<GuestVO>) request.getAttribute("vos");
	
	int pag = (int) request.getAttribute("pag");
	int totPage = (int) request.getAttribute("totPage");
	int curScrStartNo = (int) request.getAttribute("curScrStartNo");
	int blockSize = (int) request.getAttribute("blockSize");
	int curBlock = (int) request.getAttribute("curBlock");
	int lastBlock = (int) request.getAttribute("lastBlock");
%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>guestList.jsp</title>
	<%@ include file="/include/bs4.jsp" %>
	<script>
		'use strict';
		function delCheck(idx) {
			let ans = confirm("게시글을 삭제하시겠습니까?");
			if(ans) location.href="${ctp}/guestDelete.gu?idx="+idx;
		}
	</script>
	<style>
		th {background-color:#ccc; text-align:center;}
	</style>
</head>
<body>
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/></p>
<div class="container">
	<h2 class="text-center m-3">방 명 록 리 스 트</h2>
	<div class="row mb-2">
<%
    if(!admin.equals("adminOk")) { %>
		  <div class="col text-left">
	      <a href="${ctp}/adminLogin.gu" class="btn btn-secondary">관리자</a>
<%  } else { %>
  	  <div class="col text-left"><a href="${ctp}/adminLogOut.gu" class="btn btn-secondary">관리자로그아웃</a></div>
<%  } %>
      <a href="${ctp}/guestInput.gu" class="btn btn-secondary">글쓰기</a>
    </div>
    <%-- <div class="col text-left"><a href="${ctp}/guestInput.gu" class="btn btn-secondary">글쓰기</a></div> --%>
    <!-- 페이징 처리 시작 -->
	  <div class="col text-right">
	    <%if(pag > 1) { %>
	    	[<a href="guestList.gu?pag=1" title="첫페이지">|◁</a>]
	        <a href="guestList.gu?pag=<%=pag-1%>" title="이전페이지">◀</a>
	    <%} %>
	    <%=pag %>Page / <%=totPage %>Pages
	    <%if(pag != totPage) { %>
	        <a href="guestList.gu?pag=<%=pag+1%>" title="다음페이지">▶</a>
	    	[<a href="guestList.gu?pag=<%=totPage%>" title="마지막페이지">▷|</a>]
	    <%} %>
	  </div>
	  <!-- 페이징 처리 끝 -->
	</div>
<%
	GuestVO vo = new GuestVO();
	int no = vos.size();
	for(int i=0; i<vos.size(); i++) {
		vo = vos.get(i);
		
		String email = vo.getEmail();
		if(email.equals("") || email == null) email = "- 없음 -";
		
		String homepageStr = vo.getHomepage();
	  	String homepage = !homepageStr.equals("") ? homepageStr.substring(8) : "";
	  	if(homepage.equals("") || homepage == null) {
	  		homepage = "- 없음 -";
	  	}
		else {
			homepage = "<a href='"+homepageStr+"' target='_blank'>"+homepageStr+"</a>";
		}
		
		String vDate = vo.getvDate().substring(0,19);
		String content = vo.getContent().replace("\n", "<br/>");
%>
	<table class="table table-borderless m-0 p-0">
		<tr>
			<td class="text-left">
				방문번호 : <%=curScrStartNo %>
<%				if(admin.equals("adminOk")) { %>
					<%-- &nbsp;[<a href="${ctp}/guestDelete.gu?idx=<%=vo.getIdx()%>">삭제</a>] --%>
					&nbsp;[<a href="javascript:delCheck(<%=vo.getIdx()%>);">삭제</a>]
<%				} %>
			</td>
			<td class="text-right">방문IP : <%=vo.getHostIp() %></td>
		</tr>
	</table>
	<table class="table table-bordered">
		<tr>
			<th width="20%">성명</th>
			<td width="30%"><%=vo.getName() %></td>
			<th width="20%">방문일자</th>
			<td width="30%"><%=vDate %></td>
		</tr>
		<tr>
			<th>전자우편</th>
			<td colspan="3"><%=email %></td>
		</tr>
		<tr>
			<th>홈페이지</th>
			<td colspan="3"><%=homepage %></td>
		</tr>
		<tr>
			<th>글내용</th>
			<td colspan="3" style="height:200px"><%=content %></td>
		</tr>
	</table>
	<br/>
<%
		curScrStartNo--;
	}
%>
<%-- 	<!-- 페이징 처리 -->
	<div class="text-center">
		[<a href="guestList.gu?pag=1">처음페이지</a>]
		<%if(pag > 1) { %>
			[<a href="guestList.gu?pag=<%=pag-1%>">이전페이지</a>]
		<%} %>
		<%=pag %>Page / <%=totPage %>pages
		<%if(pag != totPage) { %>
			[<a href="guestList.gu?pag=<%=pag+1%>">다음페이지</a>]
		<%} %>
		[<a href="guestList.gu?pag=<%=totPage%>">마지막페이지</a>]
	</div> --%>
	<!-- 블록 페이징 처리 시작 -->
	<div class="text-center">
		<%if(pag != 1) { %>
			[<a href="guestList.gu?pag=1"><font color='black'>처음페이지</font></a>]
		<%} %>
		
		<%if(curBlock > 0) { %>
			[<a href="guestList.gu?pag=<%=(curBlock-1)*blockSize + 1%>"><font color='black'>이전블럭</font></a>]
		<%} %>
		<%
			for(int i=(curBlock*blockSize)+1; i<=(curBlock*blockSize)+blockSize; i++) {
				if(i > totPage) break;
				if(i == pag) out.println("[<a href='guestList.gu?pag="+i+"'><font color='black'><b>"+i+"</b></font></a>]");
				else out.println("[<a href='guestList.gu?pag="+i+"'><font color='black'>"+i+"</font></a>]");
			}
		%>
		<%if(curBlock < lastBlock) { %>
			[<a href="guestList.gu?pag=<%=(curBlock+1)*blockSize + 1%>"><font color='black'>다음블럭</font></a>]
		<%} %>
		
		<%if(pag != totPage) { %>
			[<a href="guestList.gu?pag=<%=totPage%>"><font color='black'>마지막페이지</font></a>]
		<%} %>
	</div>
	<!-- 블록 페이징 처리 끝 -->

<% %>

</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>