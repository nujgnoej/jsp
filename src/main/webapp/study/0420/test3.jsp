<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test3.jsp</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>
    function fCheck(flag) {
    	/* 
    	if(flag == 'asc') {
    		myForm.flag.value=flag;
    	}
    	else {
    		myForm.flag.value=flag;
    	}
    	 */
    	myForm.flag.value=flag;
    	myForm.submit();
    }
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <pre>
    폼을 통해서 상품명과 상품 가격을 6개를 입력받아서 가격순으로 오름차순/내림차순 정렬처리후 출력하시오.
    구현 파일 : jsp
    파일명 : test3Ok.jsp
    폼태그의 내용은 미리 value값에 저장시켜놓는다.
    버튼 : '오른차순'/'내림차순'/'돌아가기'
    출력시에는 원본자료와 정렬된 자료를 모두 출력시켜주시오.
    완성후 화면을 예쁘게 꾸며보세요.(bs4사용...)
  </pre>
  <hr/>
  <form name="myForm" method="post" action="test3Ok.jsp">
    <h2>상품명과 가격을 입력하세요</h2>
    <div class="row m-3">
	    <div class="col">
	      상품명1 : 
	      <input type="text" name="product" value="냉장고" class="form-control"/>
	    </div>
	    <div class="col">
	      가격1 : 
	      <input type="number" name="price" value="10000" class="form-control"/>
	    </div>
    </div>
    <div class="row m-3">
	    <div class="col">
	      상품명2 : 
	      <input type="text" name="product" value="선풍기" class="form-control"/>
	    </div>
	    <div class="col">
	      가격2 : 
	      <input type="number" name="price" value="500" class="form-control"/>
	    </div>
    </div>
    <div class="row m-3">
	    <div class="col">
	      상품명3 : 
	      <input type="text" name="product" value="오디오" class="form-control"/>
	    </div>
	    <div class="col">
	      가격3 : 
	      <input type="number" name="price" value="7000" class="form-control"/>
	    </div>
    </div>
    <div class="row m-3">
	    <div class="col">
	      상품명4 : 
	      <input type="text" name="product" value="전자레인지" class="form-control"/>
	    </div>
	    <div class="col">
	      가격4 : 
	      <input type="number" name="price" value="15000" class="form-control"/>
	    </div>
    </div>
    <div class="row m-3">
	    <div class="col">
	      상품명5 : 
	      <input type="text" name="product" value="에어컨" class="form-control"/>
	    </div>
	    <div class="col">
	      가격5 : 
	      <input type="number" name="price" value="20000" class="form-control"/>
	    </div>
    </div>
    <div class="row m-3">
	    <div class="col">
	      상품명6 : 
	      <input type="text" name="product" value="전기밥솥" class="form-control"/>
	    </div>
	    <div class="col">
	      가격6 : 
	      <input type="number" name="price" value="9000" class="form-control"/>
	    </div>
    </div>
    <div>
      <input type="button" value="오름차순출력" onclick="fCheck('asc')" class="btn btn-primary form-control m-1"/>
      <input type="button" value="내림차순출력" onclick="fCheck('desc')" class="btn btn-primary form-control m-1"/>
      <input type="reset" value="다시입력" class="btn btn-primary form-control m-1"/>
    </div>
    <input type="hidden" name="flag"/>
  </form>
</div>
<p><br/></p>
</body>
</html>