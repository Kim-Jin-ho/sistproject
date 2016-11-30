<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=cp %>/js/jquery-1.12.3.min.js"></script>
<style type="text/css">






</style>

</head>
<body>

<body>
<div id="error_content">
 	<div class="logo">
		<h1><img height=255px; width="255px" src="<%=cp%>/images/OneLogo.png"></h1>
	</div>
	<div class="content">
		<h2>페이지를 찾을 수 없습니다.</h2>
		<p>죄송합니다. 유효하지 않은 요청입니다.<br>해당 페이지가 없습니다.<br>주소를 확인해 주세요.</p>
		<ul>
			<li>홈으로</li>
		</ul>
	</div>
</div>



</body>

</body>
</html>