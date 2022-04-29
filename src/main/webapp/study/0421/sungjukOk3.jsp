<%@ page import="study.t0420.SungjukVO3"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!-- 변수를 선언할때는 'c:set'을 사용... -->
<c:set var="name" value="${param.name}"/>
<c:set var="gender" value="${param.gender}"/>
<c:set var="no" value="${param.no}"/>
<c:set var="hakyun" value="${param.hakyun}"/>
<c:set var="kor" value="${param.kor}"/>
<c:set var="eng" value="${param.eng}"/>
<c:set var="mat" value="${param.mat}"/>
<c:set var="tot" value="${kor + eng + mat}"/>
<c:set var="avg" value="${tot / 3.0}"/>
<c:set var="grade" value="A"/>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>sungjukOk3.jsp</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2 class="text-center">개 별 학 생 성 적 표</h2>
  <table class="table table-hover text-center">
    <tr>
      <th>학번</th><td>${no}</td>
    </tr>
    <tr>
      <th>성명</th><td>${name}</td>
    </tr>
    <tr>
      <th>성별</th><td>${gender}</td>
    </tr>
    <tr>
      <th>학년</th><td>${hakyun}</td>
    </tr>
    <tr>
      <th>국어</th><td>${kor}</td>
    </tr>
    <tr>
      <th>영어</th><td>${eng}</td>
    </tr>
    <tr>
      <th>수학</th><td>${mat}</td>
    </tr>
    <tr>
      <th>총점</th><td>${tot}</td>
    </tr>
    <tr>
      <th>평균</th><td>${avg}</td>
    </tr>
    <tr>
      <th>학점</th><td>${grade}</td>
    </tr>
    <tr>
      <td colspan="2">
        <input type="button" value="돌아가기" onclick="location.href='<%=request.getContextPath()%>/study/0421/sungjuk3.jsp';" class="btn btn-info form-control"/>
      </td>
    </tr>
  </table>
</div>
<p><br/></p>
</body>
</html>
