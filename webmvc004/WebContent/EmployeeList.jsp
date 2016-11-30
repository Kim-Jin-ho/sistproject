<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하잇!</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>

<div>
	<div class="mainmenu">
		<!-- 주 메뉴 영역 -->
		<a href="">[직원 관리]</a>
		<a href="">[지역 관리]</a>
		<a href="">[부서 관리]</a>
		<a href="">[직위 관리]</a>
	</div>
	
	<div class="content">
		<!-- 콘텐츠 영역 -->
		<h2>[직원 관리]</h2>
		<div class="submenu">
			<a href="employeelist.do"><button type="button" style="width: 160px">[직원 정보 출력]</button></a>
			<a href="employeeinsertform.do"><button type="button" style="width: 160px">[직원 정보 입력]</button></a>
		</div>
		<div>
			<table>
				<tr>
					<th>직원정보</th>
	            	<th>이름</th>
		            <th>주민번호</th>
		            <th>생년월일</th>
		            <th>양음력</th>
		            <th>전화번호</th>
		            <th>부서</th>
		            <th>직위</th>
		            <th>지역</th>
		            <th>기본급</th>
		            <th>수당</th>
		            <th>급여</th>
		            <th>삭제</th>
		           </tr>  
				<c:forEach var="dto" items="${list }">
	               <tr>
		               <td style="text-align: center;">${dto.employeeId }</td>
		               <td>${dto.name }</td>
		               <td>${fn:substring(dto.ssn,0,6)}-${fn:substring(dto.ssn,6,13)}</td>
		               <td>${dto.birthday }</td>   
		               <td>${dto.lunarName }</td>   
		               <td>${dto.telephone }</td>
		               <td>${dto.departmentName }</td>
		               <td>${dto.positionName }</td>
		               <td>${dto.regionName }</td>
		               <td><fmt:formatNumber value="${dto.basicPay }" groupingUsed="true"></fmt:formatNumber></td>
		               <td><fmt:formatNumber value="${dto.extraPay }" groupingUsed="true"></fmt:formatNumber></td>
		               <td><fmt:formatNumber value="${dto.pay }" groupingUsed="true"></fmt:formatNumber> </td>
		               <td><button type="button">삭제</button></td>
	               </tr>
	            </c:forEach> 
			</table>
			
		</div>
	</div>
</div>
</body>
</html>