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
<title>UserQnaList.jsp</title>
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
		<c:import url="${cp }/user/UserMenu.jsp"/>
	
		<h5>QNA 게시판</h5>
		
	<!-- ↑ 여기까지 공통으로 가져가야할 내용 -->	
		
		<!-- QNA 전체 출력 페이지에서 제목, 내용, 작성자 옵션 선택 후 검색어 입력하면 
			 그에 따른 검색 리스트 출력 -->
		<form action="<%=cp %>/UserQnaList.love" id="searchForm" name="searchForm">
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
				<button type="button" id="search" class="btn col-sm-1">검색 </button>
			<span class="col-sm-1"></span>
				<button type="button" id="search" class="btn col-sm-1" onclick="location.href='<%=cp %>/user/UserQnaCreate.jsp'">질문하기</button>
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
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
							<th scope="col">조회수</th>	
						</tr>
					</thead>
                    
				<tbody>
				<c:forEach var="dto" items="${userQnaList}">
				<tr>
					<td>${dto.rnum }</td>
					<td><a href="<%=cp %>/UserQnaArticle.love?cd=${dto.cd }">${dto.sbjct }</a>
					<td>${dto.name }</td>
					<td>${dto.dt }</td>
					<td>${dto.cnt }</td>
				</tr>
				</c:forEach>
				</tbody>
                    
				</table>
				<div class="paging">
				${pageIndexList }
				</div>
				</div>
			</div>
	</div>
	
	<!-- 메인풋터 영역 -->
    <c:import url="${cp }/main/footer.jsp"/>
</body>
</html>