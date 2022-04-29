<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>test11.jsp</title>
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
			
			if(name == "") {
				alert("성명을 입력하세요!");
				myForm.name.focus();
			}
			else if(no == "") {
				alert("학생번호를 입력하세요!");
				myForm.no.focus();
			}
			else if(sports == "") {
				alert("좋아하는 스포츠를 1개이상 선택하세요!")
			}
			else if(spors == "기타" && otherSports == "") {
				myForm.otherSports.focus();
			}
			else {
				myForm.submit();
			}
		}
		
		function sportsCheck() {
			let sports = myForm.sports.value;
			if(sports == "기타") {
				myForm.otherSports.focus();
			}
		}
	</script>
</head>
<body>
<p><br/><p>
<div class="container">
    <pre>
    	문제: 성적평가표 만들기
    	입력사항 : 성명(name : text), 성별(gender : radio), 학생번호(no : number), 학년(hakyun : 콤보상자),
    			국어(kor : number), 영어(end : number), 수학(mat : number), 전송버튼(button), 취소(reset)
    	자바스크립트를 이용한 유효성체크(공백)
    	전송받을 주소? /T11Ok (컨트롤러 어노테이션 이용)
    	
    	출력사항 : 입력사항 모두 + 총점/평균/학점()
    </pre>
    <h2>성 적 평 가 표</h2><br/>
    <form name="myForm" method="post" action="../T11Ok">
    	<table>
    		<tr>
    			<td>성명<font color='red'>*</font></td>
    			<td><input type="text" name="name" autofocus /></td>
    		</tr>
    		<tr>
    			<td>성별</td>
    			<td>
    				<input type="radio" name="gender" value="남자" checked />남자&nbsp;&nbsp;&nbsp;
	    			<input type="radio" name="gender" value="여자" />여자
    			</td>
    		</tr>
    		<tr>
    			<td>사용가능컴퓨터언어</td>
    			<td>
    				<input type="checkbox" name="language" value="JAVA" />JAVA &nbsp;
    				<input type="checkbox" name="language" value="Database" />Database &nbsp;
    				<input type="checkbox" name="language" value="HTML5" />HTML5 &nbsp;
    				<input type="checkbox" name="language" value="CSS3" />CSS3 &nbsp;
    				<input type="checkbox" name="language" value="Javascript" />Javascript &nbsp;
    				<input type="checkbox" name="language" value="jQuery" />jQuery &nbsp;
    				<input type="checkbox" name="language" value="JSP" />JSP &nbsp;
    				<input type="checkbox" name="language" value="aJax" />aJax &nbsp;
    				<input type="checkbox" name="language" value="SpringFramework" />SpringFramework &nbsp;
    			</td>
    		</tr>
    		<tr>
    			<td>학생번호<font color='red'>*</font>&nbsp;&nbsp;&nbsp;</td>
    			<td><input type="number"  name="no" /></td>
    		</tr>
    		<tr>
    			<td>학년</td>
    			<td>
    				<div class="row">
    					<div class="col">
		    				<select name="hakyun">
				    			<option value="">---선택---</option>
				    			<option value="1학년">1학년</option>
				    			<option value="2학년">2학년</option>
				    			<option value="3학년">3학년</option>
				    			<!-- <option value="4학년">4학년</option>
				    			<option value="5학년">5학년</option>
				    			<option value="6학년">6학년</option> -->
			    			</select>
			    		</div>
			    		<div class="col">
			    			기타:<input type="number" name="hakyunOption" value="4" min="4" max="6" />
		    			</div>
	    			</div>
    			</td>
    		</tr>
    		<tr>
    			<td>국어</td>
    			<td><input type="number" value=0 name="kor" /></td>
    		</tr>
    		<tr>
    			<td>영어</td>
    			<td><input type="number" value=0 name="eng" /></td>
    		</tr>
    		<tr>
    			<td>수학</td>
    			<td><input type="number" value=0 name="mat" /></td>
    		</tr>
    		<tr>
    			<td>좋아하는스포츠</td>
    			<td>
    				<select name="sports" size="5" multiple onchange="sportsCheck()">
    					<option value="축구">축구</option>
    					<option value="야구">야구</option>
    					<option value="농구">농구</option>
    					<option value="탁구">탁구</option>
    					<option value="배구">배구</option>
    					<option value="수영">수영</option>
    					<option value="마라톤">마라톤</option>
    					<option value="멀리뛰기">멀리뛰기</option>
    					<option value="등산">등산</option>
    					<option value="볼링">볼링</option>
    					<option value="태권도">태권도</option>
    					<option value="기타">기타</option>
    				</select> &nbsp;&nbsp;
    				기타:<input type="text" name="otherSports" />
    			</td>
    		</tr>
	    	<tr>
		    	<td colspan="2">
		    		<input type="button" value="전송버튼" onclick="fCheck()" class="btn btn-success" />
	    			<input type="reset" value="취소버튼" class="btn btn-success" />
		    	</td>
	    	</tr>
	    	<tr>
	    		<td></td>
	    	</tr>
    	</table>
    </form>
</div>
<p><br/><p>
</body>
</html>