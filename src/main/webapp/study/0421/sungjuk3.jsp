<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>sungjuk3.jsp</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>성적입력</h2>
	<%-- <form name="myForm" method="post" action="<%=request.getContextPath()%>/sungjukOk3"> --%>
	<!-- <form name="myForm" method="post" action="sungjukOk3.jsp"> -->
	<!-- <form name="myForm" method="post" action="sungjukOk3_2.jsp"> -->
	<form name="myForm" method="post" action="sungjukOk3_3.jsp">
	  <table class="table">
	    <tr>
	      <th>성명</th>
	      <td><input type="text" name="name" class="form-control" value="홍길동" autofocus /></td>
	    </tr>
	    <tr>
	      <th>성별</th>
	      <td>
	        <input type="radio" name="gender" value="남" checked/>남 &nbsp;&nbsp;
		    <input type="radio" name="gender" value="여">여
		  </td>
		</tr>
		<tr>
		  <th>학생번호</th>
		  <td><input type="number" name="no" value="220231" class="form-control"/></td>
		</tr>
		<tr>
		  <th>학년</th>
		  <td>
		    <div class="row">
		      <div class="col">
				<select name="hakyun" class="form-control">
				  <option value="">학년을 선택하세요</option> 		
				  <option value="1">1학년</option> 		
				  <option value="2" selected>2학년</option> 		
				  <option value="3">3학년</option>		
				</select> &nbsp;&nbsp;
			  </div>
			  <div class="col">
				기타 : <input type="number" value="4" name="hakyunOption" min="4" max="6"/>
			  </div>
			</div>
		  </td>
		</tr>
		<tr>
		  <th>국어</th>
		  <td><input type="number" name="kor" value="90" class="form-control"/></td>
		</tr>
		<tr>
		  <th>영어</th>
		  <td><input type="number" name="eng" value="80" class="form-control"/></td>
		</tr>
		<tr>
		  <th>수학</th>
		  <td><input type="number" name="mat" value="70" class="form-control"/></td>
		</tr>
		<tr>
		  <td colspan="2">
		  	<input type="submit" value="전송" class="btn btn-success"/>
		    <input type="reset" value="취소" class="btn btn-success"/>
		  </td>
		</tr>
	</table>
  </form>
</div>
<p><br/></p>
</body>
</html>