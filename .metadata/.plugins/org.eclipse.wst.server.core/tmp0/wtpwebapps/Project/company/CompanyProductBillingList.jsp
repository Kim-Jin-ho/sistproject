<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 상품관리 - 결제내역</title>

<script type="text/javascript" src="<%=cp %>/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>

<script type="text/javascript">
	
	$(document).ready(function() {
		// Ajax 요청 및 응답 처리
		//ajaxRequest();
	
		// jQuery 캘린더 처리
		// jQuery 캘린더를 불러오는 함수
		$("#dayStart").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : "yy-mm-dd",				
			yearRange: "c0:c+10",
			monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"], // Names of months for drop-down and formatting
			monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"], // For formatting
			dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"], // For formatting
			dayNamesShort: ["일","월","화","수","목","금","토"], // For formatting
			dayNamesMin: ["일","월","화","수","목","금","토"],
		});
		
		$("#dayEnd").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : "yy-mm-dd",
			yearRange: "c0:c+10",
			monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"], // Names of months for drop-down and formatting
			monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"], // For formatting
			dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"], // For formatting
			dayNamesShort: ["일","월","화","수","목","금","토"], // For formatting
			dayNamesMin: ["일","월","화","수","목","금","토"],
		});
		
		

	});

</script>

</head>
<body>

<div id="wrap"> <%-- 전체 틀 --%>

	<div id="header"> 
		<c:import url="EnterpriseTitle.jsp"></c:import> <%-- 타이틀, gnb --%>
		<c:import url="EnterpriseMenu.jsp"></c:import> <%-- 매뉴 --%>
		<ul>
			<li><a href="<%=cp %>/EnterpriseMerchandiseControl.jsp">상품 관리</a></li>
			<li><a href="<%=cp %>/EnterpriseProductBilling.jsp">결제 내역</a></li>
		</ul>
	</div>

	

	<div id="container"> <%-- 내용 --%>

		<div id="section1">
			<form>
				<select>
					<option selected="selected">결제일</option>
					<option>광고 시작일</option>
					<option>광고 종료일</option>
				</select>
				
				<button type="button" id="today">오늘</button>
				<button type="button" id="threeDays">3일</button>
				<button type="button" id="sevenDays">1주일</button>
				<button type="button" id="month">1개월</button>
				<button type="button" id="threeMonth">3개월</button>
				|
				<input type="text" id="dayStart" value="오늘날짜">-
				<input type="text" id="dayEnd" value="오늘날짜">
			</form>
		</div>

		<div id="section2">
			<table>
				<tr>
					<th>순서</th>
					<th>제목</th>
					<th>결제일</th>
					<th>광고시작일</th>
					<th>광고종료일</th>
					<th>금액</th>
					<th>결제수단</th>
				</tr>
				<c:forEach var="dto" items="">
					<tr>
						<td>{}</td>
						<td>{}</td>
						<td>{}</td>
						<td>{}</td>
						<td>{}</td>
						<td>{}</td>
						<td>{}</td>
					</tr>
				</c:forEach>
			</table>
		</div>

	</div> <%-- 내용 --%>

	


	<c:import url="EnterpriseFooter.jsp"></c:import>


</div> <%-- 전체 틀 --%>



</body>
</html>