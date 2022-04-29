<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<c:set var="kor" value="${param.kor + 10}"/>
<c:set var="eng" value="${param.eng}"/>
<c:set var="mat" value="${param.mat}"/>
<c:set var="tot" value="${kor + eng + mat}"/>
<c:set var="avg" value="${tot / 3.0}"/>
<c:set var="grade" value="A"/>

<!-- 자바 클래스를 사용할경우는 jsp액션태그(jsp:useBean)을 사용한다. -->
<jsp:useBean id="vo" class="study.t0420.SungjukVO3"/>

<!-- 앞에서 넘어온 변수의 값을 vo객체에 저장하려면? jsp:setProperty -->
<!-- name:클래스변수명(id), property:Form태그에서넘어온변수명 -->
<jsp:setProperty name="vo" property="*"/>

<jsp:setProperty name="vo" property="kor" value="${kor}"/>

<jsp:setProperty name="vo" property="tot" value="${tot}"/>
<jsp:setProperty name="vo" property="avg" value="${avg}"/>
<jsp:setProperty name="vo" property="grade" value="${grade}"/>



<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>sungjukOk3_3.jsp</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2 class="text-center">개 별 학 생 성 적 표</h2>
  <table class="table table-hover text-center">
    <tr>
      <th>학번</th><td><jsp:getProperty name="vo" property="no"/></td>
    </tr>
    <tr>
      <th>성명</th><td><jsp:getProperty name="vo" property="name"/></td>
    </tr>
    <tr>
      <th>성별</th><td><jsp:getProperty name="vo" property="gender"/></td>
    </tr>
    <tr>
      <th>학년</th><td><jsp:getProperty name="vo" property="hakyun"/></td>
    </tr>
    <tr>
      <th>국어</th><td><jsp:getProperty name="vo" property="kor"/></td>
    </tr>
    <tr>
      <th>영어</th><td><jsp:getProperty name="vo" property="eng"/></td>
    </tr>
    <tr>
      <th>수학</th><td><jsp:getProperty name="vo" property="mat"/></td>
    </tr>
    <tr>
      <th>총점</th><td><jsp:getProperty name="vo" property="tot"/></td>
    </tr>
    <tr>
      <th>평균</th><td><jsp:getProperty name="vo" property="avg"/></td>
    </tr>
    <tr>
      <th>학점</th><td><jsp:getProperty name="vo" property="grade"/></td>
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
