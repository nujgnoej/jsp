<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
  int level = session.getAttribute("sLevel")==null? 99 : (int) session.getAttribute("sLevel"); 
%>
<script>
  'use strict';
  function memberDelCheck() {
	  let ans = confirm("정말 탈퇴하시겠습니까?");
	  if(ans) {
		  ans = confirm("탈퇴후 1개월간은 같은아이디로 재가입하실수 없습니다.\n탈퇴 하시겠습니까?");
		  if(ans) location.href="<%=request.getContextPath()%>/memDelete.mem";
	  }
  }
</script>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="<%=request.getContextPath()%>/">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item font-weight-bold">
        <a class="nav-link" href="<%=request.getContextPath()%>/guestList.gu">GUEST</a>
      </li>
<%    if(level != 99) { %>
      <li class="nav-item font-weight-bold">
        <a class="nav-link" href="<%=request.getContextPath()%>/boList.bo">BOARD</a>
      </li>
<%    } 
      if(level != 99 && level != 1) { %>
      <li class="nav-item font-weight-bold">
        <a class="nav-link" href="<%=request.getContextPath()%>/pdsList.pds">PDS</a>
      </li>
      <li class="nav-item font-weight-bold">
        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Study1</a>
        <div class="dropdown">
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/study1/urlMapping">URL(디렉토리)매핑</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/urlMapping.url">URL(확장자)매핑</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/urlMapping.url2">URL(확장자)매핑2</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/urlMapping.um">URL(확장자)매핑3</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/adminLogin.gu">관리자인증</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/el.st">EL연습</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/jstl1.st">JSTL연습1</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/jstl2.st">JSTL연습2</a>
			    </div>
			  </div>
      </li>
      <li class="nav-item font-weight-bold">
        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Study2</a>
        <div class="dropdown">
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/study1/shaPass.st">SHA 암호화</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/study1/ajax1.st">aJax연습1</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/study1/upLoad1.st">싱글파일업로드1</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/study1/upLoad2.st">멀티파일업로드2</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/study1/upLoad3.st">멀티파일업로드3</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/study1/upLoad4.st">멀티파일업로드4</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/study1/dynamicForm.st">동적폼연습</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/study1/calendar1.st">달력1</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/study1/calendar2.st">달력2</a>
			    </div>
			  </div>
      </li>
<%    } %>
<%    if(level != 99) { %>
      <li class="nav-item font-weight-bold">
        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">My Page</a>
        <div class="dropdown">
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/memMain.mem">회원방</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/schedule.sc">일정관리</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/">1:1문의</a>
			      <c:if test="${sLevel != 1}">
			      	<a class="dropdown-item" href="<%=request.getContextPath()%>/memList.mem">회원리스트</a>
			      </c:if>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/memUpdate.mem">회원정보변경</a>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/memUpdatePwd.mem">회원비밀번호변경</a>
			      <a class="dropdown-item" href="javascript:memberDelCheck()">회원탈퇴</a>
<%          if(level == 0) { %>
			      <a class="dropdown-item" href="<%=request.getContextPath()%>/adMenu.ad">관리자메뉴</a>
<%          } %>
			    </div>
			  </div>
      </li>
<%    } %>
      <li class="nav-item font-weight-bold">
<%    if(level != 99) { %>
        <a class="nav-link" href="<%=request.getContextPath()%>/memLogOut.mem">LogOut</a>
<%    } else { %>
        <a class="nav-link" href="<%=request.getContextPath()%>/memLogin.mem">Login</a>
      </li>
      <li class="nav-item font-weight-bold">
        <a class="nav-link" href="<%=request.getContextPath()%>/memJoin.mem">Join</a>
      </li>
<%    } %>
    </ul>
  </div>  
</nav>