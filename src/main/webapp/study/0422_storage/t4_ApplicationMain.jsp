<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>t4_ApplicationMain.jsp</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/><p>
<div class="container">
    <h2>어플리케이션(Application)(JSP) 연습 메인메뉴</h2>
    <hr/>
    <form name=myForm method="post" action="t4_ApplicationSave.jsp">
	    <table class="table">
	    	<tr>
	    		<th>아이디</th><td><input type="text" name="mid" value="${aMid}" class="form-control" /></td>
	    	</tr>
	    	<tr>
	    		<th>닉네임</th><td><input type="text" name="nickName" value="${aNickName}" class="form-control" /></td>
	    	</tr>
	    	<tr>
	    		<th>나이</th><td><input type="text" name="age" value="${aAge}" class="form-control" /></td>
	    	</tr>
	    	<tr>
	    		<td colspan="3"><input type="submit" value="새로운 어플리케이션 설정" class="btn btn-primary form-control" /></td>
	    	</tr>
	    </table>
    </form>
    <hr/>
   	<div><a href="t4_ApplicationSave.jsp" class="btn btn-success form-control m-1">Application 저장(서버 기동후 '처음 1회'만 수행할것)</a></div>
   	<div><a href="t4_ApplicationCheck.jsp" class="btn btn-success form-control m-1">Application 확인</a></div>
   	<div><a href="t4_ApplicationDelete.jsp" class="btn btn-success form-control m-1">Application 아이디 삭제</a></div>
</div>
<p><br/><p>
</body>
</html>