<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
	String checknum = (String)session.getAttribute("checknum");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminUserQnaList.jsp</title>
<!-- QNA 전체 출력 페이지 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<link href="<%=cp %>/css/hyuncss/bootstrap.css" rel="stylesheet">
<link href="<%=cp %>/css/hyunseokcss/usermain.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="<%=cp %>/js/mainjs/bootstrap.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		$("#search").click(function()
		{
			if ($("#searchValue").val()=="")
			{
				// 검색어가 없는 상태에서 검색을 클릭하면 안내창을 출력
				alert("검색어를 입력해주세요.");
				return;
			}
			//submit 액션 처리
			$("#searchForm").submit();
		});
	});
	
</script>

</head>
<body>
	
	<!-- GNB 영역 -->
	<c:import url="${cp }/main/mainGnb.jsp"/>
	<!-- 메인 메뉴영역 -->
    <c:import url="${cp }/main/mainMenu.jsp"/>

	<hr style="border: solid 1px red">
	
	<div class="containersection">

	<div class="container">
		<c:import url="${cp }/admin/AdminMenu.jsp"/>

		<h5>QNA</h5>
		<!-- QNA 전체 출력 페이지에서 제목, 내용, 작성자 옵션 선택 후 검색어 입력하면 
		     그에 따른 검색 리스트 출력 -->
		<form action="<%=cp %>/AdminPriQnaList.love" id="searchForm" name="searchForm">
			<div class="col-sm-2">
				<select id="searchKey" name="searchKey" class="form-control">
					<option value="SBJCT" selected="selected">제목</option>
					<option value="CTNT">내용</option>
					<option value="NAME">작성자</option>
				</select>
			</div>
			<div class="col-sm-4">
				<input type="text" id="searchValue" name="searchValue" class="form-control"/>
			</div>
				<button type="button" id="search" class="btn col-sm-1">검색</button>
			
		</form><br>
		
		<div id="qna" class="col-sm-9" >
			<table class="table table-striped">
				<colgroup width="100%">
                      <col width="10%">
                      <col width="45%">
                      <col width="10%">
                      <col width="20%">
                      <col width="15%">
            </colgroup>
            <thead>
				<tr>
					<th scope="col" class="text-center">번호</th>
					<th scope="col" class="text-center">제목</th>
					<th scope="col" class="text-center">작성자</th>
					<th scope="col" class="text-center">작성일</th>
					<th scope="col" class="text-center">조회수</th>	
			</tr>
		</thead>
		
		<tbody>
		
			<!-- userQnaListController.java 에서 가져온 userQnaList 값 출력 -->
			<!-- ArrayList 형식으로 담겨져 있기 때문에 c:forEach 사용 -->
			<c:forEach var="dto" items="${userQnaList}">
			<tr>
				<td class="text-center">${dto.rnum }</td>
				<td><a href="<%=cp %>/AdminPriQnaArticle.love?cd=${dto.cd }">${dto.sbjct }</a></td>
				<td class="text-center">${dto.name }</td>
				<td class="text-center">${dto.dt }</td>
				<td class="text-center">${dto.cnt }</td>			
			</tr>
			</c:forEach>
			
		</tbody>
		
		</table>
		<div class="paging">
		${pageIndexList }
		</div>
		</div>
	
		
		</div>
		<div class="containersection">
		</div>
	</div>
	
	<!-- 메인풋터 영역 -->
    <c:import url="${cp }/main/footer.jsp"/>
</body>
</html>