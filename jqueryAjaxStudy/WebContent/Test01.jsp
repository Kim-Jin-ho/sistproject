<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test01.jsp</title>
<link rel="stylesheet" href="main.css">
<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript">
	
	function sum()
	{
		// 데이터 수집
		var n1 = document.getElementById("num1").value;
		var n2 = document.getElementById("num2").value;
		
		// URL
		var url = "/jqueryAjaxStudy/Test01.do?n1="+n1+"&n2="+n2;

		//HttpRequest 객체 생성
		ajax = createAjax();
		
		//○ opne()
		//"GET" : 요청 방식
		// url : Ajax 요청 페이지 ( 위에서 정의한 url 값) 데이터 수신 및 응답 페이지
		// true(bollean) : true(비동기), false(동기) ... false(동기) 는 사용안함
		// ==> 실제 서버와의 연결이 아니고 일종의 환경 설정 부분이다.
		//     (연결은 나중에...)
		ajax.open("GET",url,true);
		
		// ajax 객체의 readyState 속성은 각 단계별로 변화되며
		// 0부터... 4까지... 순차적으로 증가한다.
		// 그 때 마다 다음과 같은 이벤트가 발생한다.
		ajax.onreadystatechange = function()
		{
			// 0 부터 4까지의 상태 값중..
			// 4가 되는 순간이 요청했던 서버로부터 데이터가 응답 완료 시점이기 때문에
			// 4일 경우 업무를 진행 한다.
			if(ajax.readyState == 4)
			{
				// 서버로부터 응답완료!! 되었을 때 진입
				
				// 서버로부터 응답이 왼료되었더라도
				// 그 안의 데이터가 올바른 것인지 에러인지를 알 수 없기 때문에
				// 서버로부터 응답 코드를 확인할 후 진행한다.
				// - 200 : 올바른 응답
				// - 404 : 페이지 못찾음
				// - 50X : 서버측 에러
				if(ajax.status == 200)
				{
					// 업무 코드 기술
					//-- 수행해야 할 업무를 외부로 추출
					callBack();
				}
			}
		}
		// 실제 서버에게 Ajax 요청을 한다. (이 부분이 진짜 연결 작업이다.)
		// GET 방식으로 데이터를 전송하는 경우 인자값이 『""』
		// POST 방식으로 데이터를 전송하는 경우 인자값에 해당 데이터를 넣는다.
		// 지금 우리가 하고자 하는 방식은 GET 방식이다 (※ 주의 : 비워두지 말것~!)
		ajax.send("");
	}
	
	//Ajax 요청이 완료된 후 호출되는 최.종 함수
	function callBack()
	{
		// 아래의 두 가지 방법 중 하나로 데이터를 가져온다.
		
		// 1. 서버에서 응답한 데이터가 텍스트일 경우(단일 데이터)
		var data = ajax.responseText;
		
		// 2. 서버에서 응답한 데이터가 XML 일 경우 (다량 데이터)
		//var data1 = ajax.reponseXML;
		
		// 받아온 데이터를 업무에 적용한다.
		document.getElementById("result").value = data;
		
	}
	
	
</script>
</head>
<body>
	<!-- 
		 간단하게 Ajax 특성을 보는 예제.
		 기본적으로 웹은 서버에 페이지를 요청하게 되면(데이터를 전송하게 되면)
		 새로운 페이지를 다시 브라우저에게 출력하기 때문에
		 사용자의 입장에서는 화면이 바뀌거나 새로고침이 되는 현상으로 목격된다.
		 
		 그런데 Ajax 는 백그라운드에서 Javascript Sorket(HttpRequest)을 가지고
		 서버와 따로 개별적인 통신이 이루어지기 떄문에
		 화면에 출력되는 페이지에는 영향을 주지 않고 페이지를 요청한다.(데이터를 전송한다.)
		 
		 그래서 아래 구성한 페이지의 구성 요소 중 『=』 버튼을 눌러서
		 서버와 통신이 이루어지더라도 이 페이지 안에 구성된 다른 요소들의 데이터는
		 그대로 유지되는 것을 확인할 수 있게 되는 것이다.
		 
		  -->

	<h3>기본 예제</h3>
	<input type="text" id="num1" class="defTest">
	+
	<input type="text" id="num2" class="defTest">
	<input type="button" class="control" value="=" onclick="sum();">
	<input type="text" id="result" class="defTest">
	
	<br><br>
	<h3>같은 페이지에 존재하는 기타 다른 요소들</h3>
	<input type="text"><br>
	<input type="radio" name="test">t1
	<input type="radio" name="test">t2<br>
	<input type="checkbox" name="ex">e1
	<input type="checkbox" name="ex">e2
	<input type="checkbox" name="ex">e3
</body>
</html>