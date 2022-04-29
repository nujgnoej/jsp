<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
  
  String[] products = request.getParameterValues("product");
  String[] strProducts = request.getParameterValues("product");
  
  String[] prices = request.getParameterValues("price");
  int[] intPrices = new int[6];
  
  String flag = request.getParameter("flag");
  
  // 정수배열로 변환
  for(int i=0; i<prices.length; i++) {
  	//strProducts[i] = products[i];
  	intPrices[i] = Integer.parseInt(prices[i]);
  }
  
  // 자료 정렬
  int temp = 0;
  String strTemp = "";
  for(int i=1; i<=5; i++) {
  	for(int j=i+1; j<=6; j++) {
  		if(flag.equals("asc")) {
  			if(intPrices[i-1] > intPrices[j-1]) {
	  			strTemp = products[i-1];products[i-1] = products[j-1];products[j-1] = strTemp;
	  			temp = intPrices[i-1];intPrices[i-1] = intPrices[j-1];intPrices[j-1] = temp;
	  		}
  		}
  		else {
  			if(intPrices[i-1] < intPrices[j-1]) {
  				strTemp = products[i-1];products[i-1] = products[j-1];products[j-1] = strTemp;
	  			temp = intPrices[i-1];intPrices[i-1] = intPrices[j-1];intPrices[j-1] = temp;
	  		}
  		}
  	}
  }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test3Ok.jsp</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
  <div>
    <h2>원본 자료</h2>
<%  for(int i=0; i<prices.length; i++) { %>
      <%=strProducts[i]%> / <%=prices[i]%><br/>
<%  } %>
  </div>
  <br/>
    <h2><% if(flag.equals("asc")){ %>오름차순정렬<% } else { %>내림차순정렬<% } %> 자료</h2>
  <div>
<%  for(int i=0; i<prices.length; i++) { %>
      <%=products[i]%> / <%=intPrices[i]%><br/>
<%  } %>
  </div>
  <br/>
  <div>
    <input type="button" value="돌아가기" onclick="location.href='test3.jsp';"/>
  </div>
</div>
<p><br/></p>
</body>
</html>