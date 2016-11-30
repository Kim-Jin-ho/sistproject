<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업회원관리 - 예약관리 - 상세보기</title>
<style type="text/css">
	.section
	{
		border: 1px solid gray;
		width:512px;
		height:512px;
		background-image: url("<%=cp%>/images/watermark.png");
		background-repeat: no-repeat;
		background-position:center center;
		
	}

</style>
<script type="text/javascript" src="<%=cp %>/js/company/jquery-1.12.3.min.js"></script>
<script> 	
</script>
</head>
<body>
<div id="wrap"> <%-- 전체 틀 --%>

	<div id="header"> 

	</div>
	
	
	
	<div id="container"> <!-- div의 시작 -->
		<div class="section" id="section1">
			<div >
				<div class="title">
					문의사항
					<div>
						${dto.name } 작성일(글씨크기 매우작게)
					</div>
				</div>
				
				<div id="comment">
					${dto.inqy }
				</div>
			</div>
		</div>
		
		<div class="section" id="section2">
			<div>
				<div class="title">
					견적사항
					<div>
						${dto.name } 작성일(글씨크기 매우작게)
					</div>
				</div>
				
				<div id="estimate">
					${dto.prc}
				</div>
			</div>
		</div>
	</div> <!-- div의 종료 -->
		

	





</div> <%-- 전체 틀 --%>
</body>
</html>