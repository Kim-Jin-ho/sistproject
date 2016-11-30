<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserWarning.jsp</title>
</head>
<body>
	<!-- GNB 영역 -->
	<c:import url="${cp }/main/mainGnb.jsp"/>
	
	<!-- 메인 메뉴영역 -->
    <c:import url="${cp }/main/mainMenu.jsp"/>
	
	<hr style="border: solid 1px red">
	
	<div class="containersection">
	
	<div class="container">
		<c:import url="${cp }/user/UserMenu.jsp"/>
	
		<h5>경고</h5>
			
			<c:if test="${userWar1 != 'null'}">
			<div>
				<ul>
					<li>1차 경고 내용</li>
					<li>${userWar1 }</li>
				</ul>
			</div>
			</c:if>
			
			<c:if test="${userWar2 != 'null'}">
			<div>
				<ul>
					<li>2차 경고 내용</li>
					<li>${userWar2 }</li>
				</ul>
			</div>
			</c:if>
			
			<c:if test="${userWar3 != 'null'}">
			<div>
				<ul>
					<li>3차 경고 내용</li>
					<li>${userWar3 }</li>
				</ul>
			</div>
			</c:if>
			
		</div>
	</div>
	
	<!-- 메인풋터 영역 -->
    <c:import url="${cp }/main/footer.jsp"/>
</body>
</html>