<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp = request.getContextPath();
	String UserId = (String)session.getAttribute("checkid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정산관리(AdminPaymentManagement.jsp)</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="jquery-ui.min.js"></script>
<link rel="stylesheet" href="jquery-ui.min.css">
<script type="text/javascript">




</script>
</head>
<body>

<div id="wrap"> <%-- 전체 틀 --%>

	<!-- GNB 영역 -->
	<c:import url="${cp }/main/mainGnb.jsp"/>
	<!-- 메뉴 -->
	<c:import url="${cp }/admin/AdminMenu.jsp"></c:import>
	
	<div id="container"> <%-- 내용 --%>
	

	
	<div> <!-- 테이블 -->
	<table>
		<tr>
			<th>사업자번호</th>
			<th>결제일</th>
			<th>금액</th>
			<th>결제수단</th>
		</tr>
				
		<c:forEach var="payment" items="${list }">
			<tr>
				<td>${payment.cmpny_id }</td>
				<td>${payment.date }</td>
				<td><fmt:formatNumber value="${payment.cash }" groupingUsed="true"/></td>
				<td>${payment.payType }</td>
			</tr>		
		</c:forEach> 



	</table>

	
	
	
	
	</div>
	
	
	
	
	
	</div>
	
	

<!-- 메인풋터 영역 -->
    <c:import url="${cp }/main/footer.jsp"/>
	

</div>

</body>
</html>