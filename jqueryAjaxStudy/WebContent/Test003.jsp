<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test03.jsp</title>
<link rel="stylesheet" href="<%=cp %>/main.css">
<style type="text/css">
	.txtBox
	{
		border: 1px solid gray;
		border-radius: 3px;
	}
	
	#result
	{
		font-size: 50px;
		font-weight: bold;
	}
</style>
<script type="text/javascript" src="<%=cp%>/ajax.js"></script>

<script type="text/javascript">

	function sendIt()
	{
		var su1Obj = document.getElementById("su1");
		var su2Obj = document.getElementById("su2");
		var operObj = document.getElementById("oper");
		
		var url = "<%=cp%>/Test003_ok.jsp?su1="+su1Obj.value+"&su2="+su2Obj.value+"&oper="+operObj.value;
		
		//alert(url);
		
		ajax = createAjax();
		
		ajax.onreadystatechange = callBack;
		
		ajax.open("GET", url, true);
		ajax.send("");
		
	}

	function callBack()
	{
		if (ajax.readyState==4)
		{
			if (ajax.status==200)
				printData();
		}
	}
	
	function printData()
	{
		var data = ajax.responseXML.getElementsByTagName("root")[0];
		var result = document.getElementById("result");
		result.innerHTML="";
		result.style.display="";
		
		var value = data.firstChild.nodeValue;
		result.innerHTML="결과 : "+value;
		
	}

</script>

</head>
<body>

<div>
	<h2>Ajax 실습 - 산술연산</h2>
	<hr>
</div>

<div>
	<h3>페이지 내 다른 요소들</h3>
	연산 작성자 : <input type="text" placeholder="이름을 입력하세요"><br>
	작성자 성별 : <input type="radio" name="g">남성 <input type="radio" name="g">여성<br>
	작성자 취향 : <input type="checkbox">더하기 <input type="checkbox">빼기
				  <input type="checkbox">곱하기 <input type="checkbox">나누기<br><br>

</div>



<div>
	<input type="text" id="su1" class="txtBox" placeholder="정수 입력">
	<select id="oper" class="control">
		<option value="hap" class="control">더하기</option>
		<option value="sub" class="control">빼기</option>
		<option value="mul" class="control">곱하기</option>
		<option value="div" class="control">나누기</option>
	</select>
	<input type="text" id="su2" class="txtBox" placeholder="정수 입력">
	<input type="button" value=" = " class="control" onclick="sendIt();">
	<div id="result" style="display: none;"></div>
</div>




</body>
</html>






