<%@page import="study.t0420.Test5_url2ResVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// request.setCharacterEncoding("utf-8");
  // 앞에서 'response.sendRedirect()'로 넘겼을경우 아래처럼 받으면 된다. 그리고 출력시에 '< %=vo % >' 로 출력하면 vo값이 모두 출력된다.
   String vo = request.getParameter("vo");
  		
  // 앞에서 forword방식으로 넘겼다면 vo 타입으로 받아서 처리하면 된다. 이때는 Test4Vo객체를 그대로 사용할 수 있다. forword방식은 'request.getAttribute()'로 객체를 받아야 한다.
  //Test5_url2ResVO vo = new Test5_url2ResVO();  // 여기서는 기본타입은 필요없다.
//  Test5_url2ResVO vo = (Test5_url2ResVO) request.getAttribute("vo");
  System.out.println("vo: " + vo);
%>
<%-- 
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test5_url2Res.jsp(결과 출력화면)</title>
</head>
<body>
<div class="container">
  <p><br/></p>
  
  <p>학번 : <%=vo.getHakbun() %></p>
  <p>성명 : <%=vo.getName() %></p>
  <p>국어 : <%=vo.getKor() %></p>
  <p>영어 : <%=vo.getEng() %></p>
  <p>수학 : <%=vo.getMat() %></p>
  <p>총점 : <%=vo.getTot() %></p>
  <p>평균 : <%=vo.getAvg() %></p>
  <p>학점 : <%=vo.getGrade() %></p>
  
  <p><br/></p>
</div>
</body>
</html>
 --%>