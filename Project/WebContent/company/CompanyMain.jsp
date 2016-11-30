<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 메인화면</title>
<link href="<%=cp %>/css/hyuncss/bootstrap.css" rel="stylesheet">
<link href="<%=cp %>/css/hyunseokcss/usermain.css" rel="stylesheet">
<script type="text/javascript" src="<%=cp %>/js/company/jquery-1.12.3.min.js"></script>
<script src="<%=cp %>/js/mainjs/bootstrap.min.js"></script>
</head>
<body>
	<!-- GNB 영역 -->
	<c:import url="${cp }/main/mainGnb.jsp"/>
	
	<!-- 메인 메뉴영역 -->
    <c:import url="${cp }/main/mainMenu.jsp"/>
	
	<hr style="border: solid 1px red">
	
	<div class="containersection">
	
	<div class="container">
		<!-- 기업 메뉴영역 -->
		<c:import url="${cp }/company/CompanyMenu.jsp"></c:import>
		
		<h5>기업 메인 페이지</h5>
		
		<!-- ↑ 여기까지 공통으로 가져가야할 내용 -->
	
				<div id="section1">
					<div id="asisde_left">
						꾸밀게 없어서 아직 미정~~~ 삭제 염두 
						${name} 회원님 안녕하세요<br>
						경고누적 ${warCount}회
					</div>
					
					<div id="notice">
						<table>
						<c:forEach var="i" items="${noticeList }">
							<tr><td><a href="#">${i.sbjct }</a></td></tr>
						</c:forEach>
						</table>
					</div>
					
					<div id="aside_right">
						<div id="">
							예약<br>상담<br>상품평<br>
						</div>
						<div id="">
							<a href="#">${rsvtnCount}</a>건<br>
							<a href="#">${advCount}</a>건<br>
							<a href="#">${reviewCount}</a>건<br>
						</div>
					</div>
				</div>

				<div id="section2">
					<div id="contents1">
						<a href="#"><img src="${normalImg }" alt="logo"></a>
						<div id="">
							<div id="">
								방문자수<br>예약신청<br>상담신청<br>상품평등록<br>평점<br>
							</div>
							<div id="">
								<a href="#">${normalHitCount}</a>명<br>
								<a href="#">${normalRsvtnCount}</a>명<br>
								<a href="#">${normalAdvCount}</a>명<br>
								<a href="#">${normalReviewCount}</a>명<br>
								<a href="#">${normalScore}</a>명<br>
							</div>
						</div>
					</div>
				
					<div id="contents2">
						<a href="#"><img src="${discountImg}" alt="logo" /></a>
						<div id="">
							<div id="">
								방문자수<br>예약신청<br>상담신청<br>예상품평등록<br>평점
							</div>
							<div id="">
								<a href="#">${discountHitCount}</a>명<br>
								<a href="#">${discountRsvtnCount}</a>명<br>
								<a href="#">${discountAdvCount}</a>명<br>
								<a href="#">${discountReviewCount}</a>명<br>
								<a href="#">${discountScore}</a>점<br>
							</div>
						</div>
					</div>
					
					<div id="contents3">
						<a href="#"><img src="${advtImg}" alt="logo" /></a>
						<div id="">
							<div id="">
								방문자수<br>상담신청<br>예약신청<br>상품평등록<br>평점
							</div>
							<div id="">
								<a href="#">${normalHitCount}</a>명<br>
								<a href="#">${normalRsvtnCount}</a>명<br>
								<a href="#">${normalAdvCount}</a>명<br>
								<a href="#">${normalReviewCount}</a>명<br>
								<a href="#">${normalScore}</a>명<br>
							</div>
						</div>
				   </div>
				  </div>
			 </div>
		</div> <%-- 내용 --%>
	</div> 

<!-- 메인풋터 영역 -->
   <c:import url="${cp }/main/footer.jsp"/>

</body>
</html>