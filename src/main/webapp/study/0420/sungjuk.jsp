<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>sungjuk.jsp</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>
  	'use strict';
    function fCheck() {
    	let name = myForm.name.value;
    	let gender = myForm.gender.value;
    	let no = myForm.no.value;
    	let hakyun = myForm.hakyun.value;
    	let kor = myForm.kor.value;
    	let eng = myForm.eng.value;
    	let mat = myForm.mat.value;
    	let sports = myForm.sports.value;
    	let otherSports = myForm.otherSports.value;
    	//alert(sports);
    	
    	if(name == "") {
    		alert("성명을 입력하세요!");
    		myForm.name.focus();
    	}
    	else if(no == "") {
    		alert("학생 번호를 입력하세요!");
    		myForm.no.focus();
    	}
    	else if(sports == "") {
    		alert("좋아하는 스포츠를 1개이상 선택 하세요!");
    	}
    	else if(sports == "기타" && otherSports == "") {
    		myForm.otherSports.focus();
    	}
    	/* 
    	else if(hakyun == "") {
    		alert("학년을 입력하세요!");
    		myForm.hakyunOption.focus();
    	}
    	 */
    	else {
    		myForm.submit();
    	}
    }
    
    function sportsCheck() {
    	let sports = myForm.sports.value;
    	if(sports == '기타') {
    	//if(sports.indexOf('기타') != -1) {
    		myForm.otherSports.focus();
    	}
    }
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>성적입력</h2>
	<form name="myForm" method="post" action="<%=request.getContextPath()%>/sungjukOk2">
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
	      <th>사용가능컴퓨터언어</th>
	      <td>
	        <input type="checkbox" name="language" value="JAVA" checked />JAVA &nbsp;
	        <input type="checkbox" name="language" value="Database"/>Database &nbsp;
	        <input type="checkbox" name="language" value="HTML5"/>HTML5 &nbsp;
	        <input type="checkbox" name="language" value="CSS3"/>CSS3 &nbsp;
	        <input type="checkbox" name="language" value="Javascript"/>Javascript &nbsp;
	        <input type="checkbox" name="language" value="jQuery"/>jQuery &nbsp;
	        <input type="checkbox" name="language" value="JSP"/>JSP &nbsp;
	        <input type="checkbox" name="language" value="aJax"/>aJax &nbsp;
	        <input type="checkbox" name="language" value="SpringFramework"/>SpringFramework &nbsp;
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
								<!-- <option value="4">4학년</option> 		
								<option value="5">5학년</option> 		
								<option value="6">6학년</option>  -->		
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
			  <th>좋아하는스포츠</th>
			  <td>
			    <select name="sports" size="5" multiple onchange="sportsCheck()">
			      <option value="축구">축구</option>
			      <option value="야구">야구</option>
			      <option value="농구">농구</option>
			      <option value="탁구">탁구</option>
			      <option value="배구" selected>배구</option>
			      <option value="수영">수영</option>
			      <option value="마라톤">마라톤</option>
			      <option value="멀리뛰기">멀리뛰기</option>
			      <option value="등산">등산</option>
			      <option value="볼링">볼링</option>
			      <option value="태권도">태권도</option>
			      <option value="기타">기타</option>
			    </select> &nbsp;&nbsp;
			    기타 <input type="text" name="otherSports"/>
			  </td>
			</tr>
			<tr>
			  <td colspan="2">
			  	<input type="button" value="전송" onclick="fCheck()" class="btn btn-success"/>
			    <input type="reset" value="취소" class="btn btn-success"/>
			  </td>
			</tr>
	  </table>
	</form>
</div>
<p><br/></p>
</body>
</html>