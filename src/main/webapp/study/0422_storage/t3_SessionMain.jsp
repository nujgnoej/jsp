<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>t3_SessionMain.jsp</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/><p>
<div class="container">
    <h2>세션(JSP) 연습 메인메뉴</h2>
    <hr/>
    <form name=myForm method="post" action="t3_SessionSave.jsp">
	    <table class="table">
	    	<tr>
	    		<th>아이디</th><td><input type="text" name="mid" value="${sMid}" class="form-control" /></td>
	    	</tr>
	    	<tr>
	    		<th>닉네임</th><td><input type="text" name="nickName" value="${sNickName}" class="form-control" /></td>
	    	</tr>
	    	<tr>
	    		<th>나이</th><td><input type="text" name="age" value="${sAge}" class="form-control" /></td>
	    	</tr>
	    	<tr>
	    		<td colspan="3"><input type="submit" value="새로운 세션 설정" class="btn btn-primary form-control" /></td>
	    	</tr>
	    </table>
    </form>
    <hr/>
    <div class="row">
    	<div class="col"><a href="t3_SessionSave.jsp" class="btn btn-success form-control m-1">세션 저장</a></div>
    	<div class="col"><a href="t3_SessionCheck.jsp" class="btn btn-success form-control m-1">세션 확인</a></div>
    </div>
    <div class="row">
    	<div class="col"><a href="t3_SessionGroupCheck.jsp" class="btn btn-success form-control m-1">세션 그룹 확인</a></div>
    </div>
    <div class="row">
    	<div class="col"><a href="t3_SessionDelete.jsp" class="btn btn-success form-control m-1">세션 아이디 삭제</a></div>
    	<div class="col"><a href="t3_SessionDeleteAll.jsp" class="btn btn-success form-control m-1">세션 전체삭제</a></div>
    </div>
</div>
<p><br/><p>
</body>
</html>