<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test03.jsp</title>
<link rel="stylesheet" href="main.css">
<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript">
	
	function sendIt()
	{
		// 입력 받을 수 받아내기
		var n1 = document.getElementById("su1").value;
		var n2 = document.getElementById("su2").value;
		
		// 선택한 연산자 받아내기
		var oper = document.getElementById("oper").value;
		
		// 연산자 테스트
		//alert(oper);
		
		// url 지정
		var url = "/jqueryAjaxStudy/Test03.do?n1="+n1+"&n2="+n2+"&oper="+oper;
		
		// url 로 값 전달되는지 확인
		//alert(url);
		
		// HTTPRequest - ajax 객체 생성
		ajax = createAjax();
		
		ajax.open("GET",url,true);
		
		ajax.onreadystatechange = function()
		{
			if (ajax.readyState == 4)
			{
				if (ajax.status ==200)
				{
					callBack();
				}
			}
		}
		
		ajax.send("");
	}
	
	function callBack()
	{
		// 서버로부터 데이터 가져오기
		var data = ajax.responseText;
		// div style 지정 해주기
		// div display 값 inline 으로 바꿔 주기
		document.getElementById("result").style.display = "inline";
		document.getElementById("result").style.color="hotpink";
		
		// 서버로부터 가져온 값(데이터) innerHTML을 사용해서 
		// result 에 넣어주기
		document.getElementById("result").innerHTML ="<a>" + data + "</a>";
		
		// 넘겨 받은값  innerHTML 로 태그 작성 하기
		//var div = document.getElementById("result");
		//div.innerHTML = "<a>"+gap +"</a>";
	}
</script>
</head>
<body>

<div>
	<input type="text" id="su1" class="txtBox">
	<select id="oper" class="control">
		<option value="hap">더하기</option>
		<option value="sub">빼기</option>
		<option value="mul">곱하기</option>
		<option value="div">나누기</option>
	</select>
	
	<input type="text" id="su2" class="txtBox">
	<input type="button" value=" = " onclick="sendIt();"><br>
	<div id="result" style="display: none;"></div>
		
</div>
</body>
</html>