<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserReservationList.jsp</title>
<!-- 회원 예약 리스트 출력 페이지 -->
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
	
		<h5>전체예약내역</h5>
		
	<!-- ↑ 여기까지 공통으로 가져가야할 내용 -->	
	<div id="qna" class="col-sm-9" >
			<table class="table table-striped">
				<colgroup width="100%">
                      <col width="10%">
                      <col width="25%">
                      <col width="30%">
                      <col width="10%">
                      <col width="15%">
                      <col width="10%">
           		 </colgroup>	
			 <thead>
				 <tr>
					 <th scope="col">번호</th>
					 <th scope="col">상품 이미지</th>
					 <th scope="col">예약 상품 제목</th>
					 <th scope="col">견적</th>
					 <th scope="col">시간</th>	
					 <th scope="col">취소</th>
				 </tr>
			</thead>
		
			<tbody>
			<c:forEach var="dto" items="${userReservationList }">
			<tr>
				<td>${dto.rnum }</td>
				<td><a href="">${dto.img }</a></td>
				<td><a href="">${dto.name }</a></td>
				<td>${dto.prc }</td>
				<td>${dto.dt }</td>
				<td><button type="button" onclick="location.href='<%=cp %>/UserReservationDelete.love?cd=${dto.cd}'">취소</button></td>
			</tr>
			</c:forEach>
			</tbody>
			
			</table>
			
			</div>
		</div>
	</div>
	<!-- 메인풋터 영역 -->
    <c:import url="${cp }/main/footer.jsp"/>
</body>
</html>