<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserAdviceList.jsp</title>
<link href="<%=cp %>/css/hyuncss/bootstrap.css" rel="stylesheet">
<link href="<%=cp %>/css/hyunseokcss/usermain.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="<%=cp %>/js/mainjs/bootstrap.min.js"></script>
<!-- 회원 상담 출력 페이지 -->
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
	
		<h5>전체 상담 내역</h5>
		
	<!-- ↑ 여기까지 공통으로 가져가야할 내용 -->	
		<div id="qna" class="col-sm-9" >
			<table class="table table-striped">
				<colgroup width="100%">
                      <col width="10%">
                      <col width="25%">
                      <col width="10%">
                      <col width="30%">
                      <col width="15%">
                      <col width="10%">
           		 </colgroup>	
			 <thead>
				 <tr>
                      <th scope="col">번호</th>
                      <th scope="col">이미지</th>
                      <th scope="col">작성자</th>
                      <th scope="col">내용</th>
                      <th scope="col">작성일</th>
                      <th scope="col">결과</th>
                  </tr>
              </thead>
                    
              <tbody>
	          <c:forEach var="dto" items="${userAdviceList }">
			  <tr>
				 <td>${dto.rnum }</td>
				 <td>${dto.img }</td>
				 <td>${dto.name }</td>
				 <td>${dto.ctnt }</td>
				 <td>${dto.dt }</td>
				 <td>${dto.result }</td>
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