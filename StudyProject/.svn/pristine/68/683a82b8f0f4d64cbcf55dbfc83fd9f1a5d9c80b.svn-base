<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> 


<!-- <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->
<link href="<%=cp%>/css/FAQ.css" rel="stylesheet">
<script type="text/javascript" src="<%=cp%>/js/FAQ.js"></script>
</head>
<body>

<c:choose>
    <c:when test="${nickname eq null}">
		<div class="row">
			<div class="form-group col-xs-12">
			   <div class="">
			      <c:import url="/WEB-INF/jsp/StudyRoom/StudyRoomTop.jsp"></c:import>
			   </div>
			</div>
		</div>
    </c:when>
    <c:when test="${nickname ne null}">
	<div class="row">
		<div class="form-group col-xs-12">
		   <div class="">
		      <c:import url="/WEB-INF/jsp/StudyRoom/StudyRoomTop_member.jsp"></c:import>
		   </div>
		</div>
	</div>
	</c:when>
</c:choose>
	<br><br><br>
	<!-- 전체 div -->
	<div id="warp" class="container">
		

		<!-- 검색영역 -->
		<div id="section1" class="text-center">
			<form action="FAQ.room" method="post" class="form-inline"
				id="searchForm">
				<label for="faq">FAQ</label> <select class="form-control"
					name="searchKey">
					<option value="FAQNAME">질문</option>
					<option value="FAQDAP">답변</option>
				</select> <input type="text" class="form-control" size="20" name="searchValue"
					id="searchValue">
				<button type="button" class="btn btn-default" id="searchButton">검색</button>
			</form>
		</div>
		<!-- div 경계선 -->	
		<hr>
		

		<!-- FAQ 리스트 영역 -->
		<div id="section2">
			<form action="FAQ.room" method="post" id="listForm">
				<div class="panel-group" id="accordion">
					<c:forEach var="dto" items="${list }" varStatus="i">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title col-md-10">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse${i.count }">${dto.rnum} ${dto.faqname}</a>
								</h4>
								<c:if test="${admin == 'admin' }">
								<div id="rightButton">
									
										<button type="button" class="update" id="update${dto.faqid}">수정</button>
										<button type="button" class="delete" id="delete${dto.faqid}"
											name="delete${dto.faqid }">삭제</button>
									
								</div>
								</c:if>
								<c:if test="${admin != 'admin' }">
									<button style="visibility:hidden" >.</button>
								</c:if>
							</div>
							<div id="collapse${i.count }" class="panel-collapse collapse">
								<div class="panel-body">${dto.faqdap}</div>
							</div>
						</div>
					</c:forEach>
					<input type="hidden" name="hidden" id="hidden">
				</div>
			</form>
		</div>
		
		
		<div id="section3">
			<ul  class="pagination pagination-sm">
				${pageIndexList }
			</ul>
		</div>
		
		
		<!-- div 경계선 -->
		<hr>
		

		<!-- 페이지 영역 -->
		<div class="row" id="section4">
			<div class="col-md-12 form-group">
			<c:if test="${admin == 'admin' }">
				<a href="FAQInputForm.room">
					<button class="btn btn-default pull-right" type="button">등록</button>
				</a>
			</c:if>
			</div>
		</div>





		


	</div>
	<!-- 전체 div -->
	
	<c:import url="/WEB-INF/jsp/import/copyright.jsp"></c:import>


</body>
</html>