<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%
	String msg = (String) request.getAttribute("msg");
	String url = (String) request.getAttribute("url");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>message.jsp</title>
	<script>
		'use strict';
		
	    let msg = '<%=msg%>';
	    let url = '<%=url%>';
	    let val = '${val}';
		
		if(msg == "loginJoinOk") msg = "회원에 가입되었습니다.";
		else if(msg == "loginJoinNo") msg = "회원 가입 실패~~~";
		else if(msg == "loginDeleteOk") msg = "회원 탈퇴 성공!!!";
		else if(msg == "loginDeleteNo") msg = "회원 탈퇴 실패~~~";
		else if(msg == "loginIdCheckNo") msg = "중복 회원이 존재합니다.";
		else if(msg == "loginUpdateOk") msg = "회원정보가 수정되었습니다..";
		else if(msg == "loginUpdateNo") msg = "회원정보가 수정이 되지 않았습니다..";
		else if(msg == "guestInputOk") msg = "방명록에 글이 입력되었습니다.";
		else if(msg == "guestInputNo") msg = "방명록에 글이 입력되지 않았습니다.";
		else if(msg == "adminOk") msg = "관리자 인증 확인!!!";
		else if(msg == "adminNo") msg = "관리자 인증 실패~~~";
		else if(msg == "adminLogOutOk") msg = "관리자 로그아웃 되었습니다.";
		else if(msg == "guestDeleteOk") msg = "게시글이 삭제되었습니다.";
		else if(msg == "guestDeleteNo") msg = "게시글이 삭제되지 않았습니다.";
		else if(msg == "memJoinOk") msg = "회원가입 성공";
		else if(msg == "memJoinNo") msg = "회원가입 실패";
		else if(msg == "idCheckNo") msg = "아이디가 중복되었습니다.";
		else if(msg == "nickCheckNo") msg = "닉네임이 중복되었습니다.";
		else if(msg == "loginOk") msg = '${sMid}'+"님 로그인 되셨습니다.";
		else if(msg == "loginNo") msg = "로그인 실패~~~";
		else if(msg == "memLogOutOk") msg = val + "님 로그아웃 되셨습니다.";
		else if(msg == "levelChangeOk") msg = "레벨이 변경되었습니다.";
		else if(msg == "memDeleteUpdateOk") msg = "회원탈퇴 되었습니다.";
		else if(msg == "memDeleteUpdateNo") msg = "회원탈퇴가 취소되었습니다.";
		else if(msg == "userDeleteOk") msg = "회원DB에서 삭제처리 시켰습니다.";
		else if(msg == "userDeleteNo") msg = "회원DB에서 삭제처리 취소했습니다.";
		else if(msg == "passwordNo") msg = "비밀번호가 틀립니다. 확인하세요~~";
		else if(msg == "memUpdateOk") msg = "개인정보 수정 완료!!!";
		else if(msg == "memUpdateNo") msg = "개인정보 수정 실패~~~";
		else if(msg == "memUpdatePwdOk") msg = "비밀번호가 변경되었습니다.";
	    else if(msg == "memUpdatePwdNo") msg = "비밀번호가 변경되지 않았습니다.";
		else if(msg == "boInputOk") msg = "게시글이 등록되었습니다.";
		else if(msg == "boInputNo") msg = "게시글이 등록 실패~~~";
		else if(msg == "boUpdateOk") msg = "게시글이 수정되었습니다.";
		else if(msg == "boUpdateNo") msg = "게시글 수정 실패~~~";
		else if(msg == "boDeleteOk") msg = "게시글이 삭제되었습니다.";
		else if(msg == "boDeleteNo") msg = "게시글 삭제 실패~~~\n댓글을 먼저 지워주세요.";
		else if(msg == "upLoad1Ok") msg = "파일등록에 성공하였습니다.";
		else if(msg == "fileDeleteOk") msg = "파일이 삭제되었습니다.";
		else if(msg == "fileDeleteNo") msg = "파일 삭제 실패~~";
		else if(msg == "pdsInputOk") msg = "자료파일이 업로드 되었습니다.";
		else if(msg == "pdsInputNo") msg = "자료파일 업로드 실패~~";
		else if(msg == "totalDownOk") msg = "압축파일이 정상적으로 다운되었습니다.";
		else if(msg == "scheduleUpdateOk") msg = "일정을 수정하였습니다.";
		else if(msg == "scheduleUpdateNo") msg = "일정 수정실패~~~";
		
		
		alert(msg);
		if(url != "") location.href = url;
	</script>
</head>
<body>

</body>
</html>