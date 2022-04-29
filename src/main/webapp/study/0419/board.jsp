<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>board.jsp</title>
	<style>
		#paging {
			clear: both;
			margin: 0 auto;
			width: 220px;
			height: 50px;
			align: center;
		}
		#paging > div {
			float: left;
			width: 30px;
			margin: 0 auto;
			text-align: center;
			display: inline;
		}
		#title {
			text-align: left;
		}
	</style>
</head>
<body>
<br/>
<div class="container">
    <h2>게시판</h2><br/>
    <table class="table">
    	<tr>
    		<th>No</th>
    		<th class="col-5">제목</th>
    		<th>작성일</th>
    		<th>작성자</th>
    		<th>조회수</th>
    	</tr>
    	<tr>
    		<td>1</td>
    		<td id="title">제목1</td>
    		<td>2022.04.10</td>
    		<td>홍길동</td>
    		<td>19</td>
    	</tr>
    	<tr>
    		<td>2</td>
    		<td id="title">제목2</td>
    		<td>2022.04.11</td>
    		<td>김말숙</td>
    		<td>14</td>
    	</tr>
    	<tr>
    		<td>3</td>
    		<td id="title">제목3</td>
    		<td>2022.04.13</td>
    		<td>이기자</td>
    		<td>17</td>
    	</tr>
    	<tr>
    		<td>4</td>
    		<td id="title">제목4</td>
    		<td>2022.04.15</td>
    		<td>오박사</td>
    		<td>15</td>
    	</tr>
    	<tr>
    		<td>5</td>
    		<td id="title">제목5</td>
    		<td>2022.04.16</td>
    		<td>한지우</td>
    		<td>10</td>
    	</tr>
    	<tr>
    		<td>6</td>
    		<td id="title">제목6</td>
    		<td>2022.04.18</td>
    		<td>이슬이</td>
    		<td>8</td>
    	</tr>
    	<tr>
    		<td>7</td>
    		<td id="title">제목7</td>
    		<td>2022.04.19</td>
    		<td>웅이</td>
    		<td>1</td>
    	</tr>
    	<tr>
    		<td colspan="5"></td>
    	</tr>
    </table>
   	<div id="paging">
   		<div>◀</div>
   		<div><b>1</b></div>
   		<div>2</div>
   		<div>3</div>
   		<div>4</div>
   		<div>5</div>
   		<div>▶</div>
   	</div>
</div>
<br/>
</body>
</html>