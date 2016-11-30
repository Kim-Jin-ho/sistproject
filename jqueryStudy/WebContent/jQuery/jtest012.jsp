<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jtest011.jsp</title>
<script type="text/javascript" src="<%=cp %>/data/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function()
	{
		$("#allCheck").click(function()
		{
				//alert($(this).attr("checked"));	//-- (X)
				//alert($(this).prop("checked"));	//-- 속성 확인
				//alert(this.checked);				//-- 속성 확인
				//alert($(this).is(""));			//-- 속성 확인	
				
				// 전체 체크 하기 
				//$("div > input:checkbox").prop('checked', true);
				//$(".checkbox").attr('checked', true);
				//$("div > input:checkbox").prop('checked', this.checked);
				
				// children -> 자식 자손의 의미를 가지고 있으며
				// 아래 코드의 해석은
				// div 안에 checked 속성의 값을 this.checked 를 통하여
				// 체크, 언체크를 컨트롤 할 수 있다.
				$("div").children().prop('checked', this.checked);	
				
		});
	});
</script>
</head>
<body>
<input type="checkbox" id="allCheck"><label for="allCheck">모두 선택</label>
<hr>
<div>
	<input type="checkbox" id="check1"><label for="check1">첫 번째 항목</label><br>
	<input type="checkbox" id="check2"><label for="check2">두 번째 항목</label><br>
	<input type="checkbox" id="check3"><label for="check3">세 번째 항목</label><br>
	<input type="checkbox" id="check4"><label for="check4">네 번째 항목</label><br>
	<input type="checkbox" id="check5"><label for="check5">다섯 번째 항목</label><br>
</div>
</body>
</html>