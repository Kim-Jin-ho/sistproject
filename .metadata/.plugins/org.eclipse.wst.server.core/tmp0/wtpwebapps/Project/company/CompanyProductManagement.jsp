<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 상품관리</title>
<script type="text/javascript" src="<%=cp %>/js/company/jquery-1.12.3.min.js"></script>
<script type="text/javascript">
	$(function() 
	{
		$("#contents2").click(function() 
		{
			alert("준비중입니다.");
		});
		
		$("#contents3").click(function() 
		{
			alert("준비중입니다.");
		});
	});

</script>
</head>
<body>

<div id="wrap"> <%-- 전체 틀 --%>

	<div id="header"> 
<%-- 		<c:import url="EnterpriseTitle.jsp"></c:import> 타이틀, gnb
		<c:import url="EnterpriseMenu.jsp"></c:import> 매뉴 --%>

	</div>

	

	<div id="container"> <%-- 내용 --%>

		<div id="section1">
			<a href="CompanyProductInsert.love"><div id="contents1">
			<c:forEach var="i" items="${nomarList }">
				<img src="${i.img}" alt="logo">
				
				<div id="">
					${i.name}
				</div>
					
				<div>
					${i.stt}
				</div>
			</c:forEach>
			</div></a>
			
			<a href="#"><div id="contents2">
			<c:forEach var="i" items="${discountList }">
				<img src="${i.img}" alt="logo">
				
				<div id="">
					${i.name}
				</div>
					
				<div>
					${i.stt}
				</div>
			</c:forEach>
			</div></a>

			<a href="#"><div id="contents3">
				<c:forEach var="i" items="${advtList }">
				<img src="${i.img}" alt="logo">
				
				<div id="">
					${i.sbjct}
				</div>
					
				<div>
					${i.stt}
				</div>
			</c:forEach>
			</div>	</a>			
	</div> <%-- 내용 --%>

	


	<%-- <c:import url="EnterpriseFooter.jsp"></c:import> --%>


</div> <%-- 전체 틀 --%>



</body>
</html>