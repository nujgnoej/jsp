<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ page session="false" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memLogin.jsp</title>
  <%@ include file="/include/bs4.jsp" %>
  <script>
    function fCheck() {
    	// Front 체크....후 전송한다.
    	myForm.submit();
    }
  </script>
</head>
<body>
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/></p>
<div class="container">
	<div class="modal-dialog">
	  <div class="modal-content">
		  <div class="container p-3 border">
			  <form name="myForm" method="post" action="${ctp}/memLoginOk.mem" class="was-validated">
			    <h2>회원 로그인</h2>
			    <p>회원 아이디와 비밀번호를 입력해 주세요</p>
			    <div class="form-group">
			      <label for="mid">회원 아이디 :</label>
			      <input type="text" class="form-control" name="mid" id="mid" value="${mid}" placeholder="아이디를 입력하세요." required autofocus />
			      <div class="valid-feedback">입력성공</div>
			      <div class="invalid-feedback">회원 아이디는 필수 입력사항입니다.</div>
			    </div>
			    <div class="form-group">
			      <label for="pwd">비밀번호 : </label>
			      <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요." required />
			      <div class="invalid-feedback">비밀번호는 필수 입력사항입니다.</div>
			    </div>
			    <div class="form-group">
				    <button type="submit" class="btn btn-secondary btn-sm">로그인</button> &nbsp;
				    <button type="reset" class="btn btn-secondary btn-sm">취소</button> &nbsp;
				    <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='${ctp}/';">돌아가기</button> &nbsp;
				    <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='${ctp}/memJoin.mem';">회원가입</button>
			    </div>
			    <div class="row" style="font-size:12px">
			      <span class="col"><input type="checkbox" name="idCheck" checked /> 아이디 저장</span>
			      <span class="col"><a href="${ctp}/memIdSearch.mem">아이디찾기</a> / <a href="location.href='${ctp}/memPwdSearch.mem">비밀번호찾기</a></span>
			    </div>
			  </form>
		  </div>
	  </div>
	</div>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>