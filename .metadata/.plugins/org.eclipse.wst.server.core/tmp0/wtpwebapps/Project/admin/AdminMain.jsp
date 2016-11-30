<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 메인화면(AdminMain.jsp)</title>
<link rel="stylesheet" type="text/css" href="css/AdminMain.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>


</head>
<body>

<div id="wrap"> <%-- 전체 틀 --%>

	<!-- 첫번째 헤더영역 -->
	<c:import url="${cp }/main/mainGnb.jsp"/>
	
	<div id="header"> 
		<c:import url="AdminMenu.jsp"></c:import> <%-- 매뉴 --%>
	</div>

	


	<div id="container"> <%-- 내용 --%>

		<div id="section1">
			<div id="notice">
				<b>공지사항</b><br>
				{list}
			</div>
			
			<div id="urgent">
				<b>긴급처리사항</b><br>
				<div id="">
					고객문의<br>광고비결제<br>
				</div>
				<div id="">
					{count}<br>{count}<br>
				</div>
			</div>
		</div>

		<div id="section2">
			<div id="today">	
				<div id="">
					<b>TODAY</b><br>
					방문자수<br>남<br>여<br>예약<br>상담<br>
				</div>
				<div id="">
					{count}명<br>{count}명<br>{count}명<br>{count}명<br>{count}점
				</div>
			</div>

			<div id="money">
				<b>정산현황</b><br>
				오늘 정산 내역<br>
				{money}원
			</div>
		</div>
		

	</div> <%-- 내용 --%>

	
	<!-- 메인풋터 영역 -->
    <c:import url="${cp }/main/footer.jsp"/>

</div> <%-- 전체 틀 --%>



</body>
</html>