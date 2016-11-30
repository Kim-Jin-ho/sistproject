<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
	// String checknum = (String)session.getAttribute("checknum");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminNoticeList.jsp</title>
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
<style type="text/css">

</style>


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
		
		<h5>공지사항</h5>
		<!-- 전체 출력 페이지에서 제목, 내용, 작성자 옵션 선택 후 검색어 입력하면 
		     그에 따른 검색 리스트 출력 -->
		<form action="<%=cp %>/NoticeList.love" id="searchForm" name="searchForm">
			<div class="col-sm-2">
				<select id="searchKey" name="searchKey" class="form-control">
					<option value="SBJCT" selected="selected">제목</option>
					<option value="CTNT">내용</option>
				</select>
			</div>
			<div class="col-sm-4">
				<input type="text" id="searchValue" name="searchValue" class="form-control"/>
			</div>
				<button type="button" id="search" class="btn col-sm-1">검색</button>
	
		</form><br><br>
		
		<div id="notice" class="col-sm-9">
			<table class="table table-striped">
				<colgroup width="100%">
                      <col width="10%">
                      <col width="60%">
                      <col width="20%">
                      <col width="10%">
                </colgroup>
                <thead>
                
					<tr>
						<th scope="col" class="text-center">번호</th>
						<th scope="col" class="text-center">제목</th>
						<th scope="col" class="text-center">작성일</th>
						<th scope="col" class="text-center">조회수</th>	
					</tr>
				</thead>

				<tbody>

					<c:forEach var="dto" items="${noticeList}">
					<tr>
						<td>${dto.rnum }</td>
						<td><a href="<%=cp %>/NoticeArticle.love?cd=${dto.cd }">${dto.sbjct }</a></td>
						<td>${dto.dt }</td>
						<td>${dto.cnt }</td>			
					</tr>
					</c:forEach>
			</tbody>
					
			</table>
			<div class="paging">
			${pageIndexList }
			
			</div>
			<button type="button" class="btn col-sm-offset-11" onclick="location.href='<%=cp %>/admin/NoticeCreate.jsp'">글쓰기</button>
			</div>
		
		
		
			
		
		</div>
	</div>
	
	<!-- 메인풋터 영역 -->
    <c:import url="${cp }/main/footer.jsp"/>
    
</body>
</html>