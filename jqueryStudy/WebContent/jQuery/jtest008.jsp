<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=cp %>/data/js/jquery-1.12.3.min.js"></script>
</head>
<body>
<div id="tracking"></div>
<script type="text/javascript">
	// 이벤트 처리 함수
	//-- 이벤트 처리함수 내부에서
	//	 · pageX / Y : 이벤트가 발생 했을 때의 마우스 커 서 위치(좌표값)
	//	 · type : 이벤트 종류
	//	 ·which : 클릭된 맏우스 버튼이나 키보드 키와 같은 속성들을
	//			   사용하는 것이 가능
	$(document).mousemove(function(e)
	{
		$("#tracking").text("X축 : " + e.pageX + ", Y축 : " + e.pageY);
		
	});
</script>
</body>
</html>