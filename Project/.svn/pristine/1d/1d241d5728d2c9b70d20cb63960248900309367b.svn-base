<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CmpnyQnaList.jsp</title>
<!-- QNA 전체 출력 페이지 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

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
	
	<!-- 기업페이지 메뉴 -->
	
	<%-- 기업페이지 메뉴 url 넣어야해 
	<c:import url=""></c:import>
	 --%>
	 
	 
	<div>
		<h5>QNA 게시판</h5>
	</div>
	<div>
		<!-- QNA 전체 출력 페이지에서 제목, 내용, 작성자 옵션 선택 후 검색어 입력하면 
		     그에 따른 검색 리스트 출력 -->
		<form action="<%=cp %>/CmpnyQnaList.love" id="searchForm" name="searchForm">
			<div>
				<select id="searchKey" name="searchKey">
					<option value="SBJCT" selected="selected">제목</option>
					<option value="CTNT">내용</option>
					<option value="NAME">작성자</option>
				</select>
				<input type="text" id="searchValue" name="searchValue"/>
				<button type="button" id="search">검색</button>
			</div>
		</form>
		
		<div>
			<ul>
				<li>번호</li>
				<li>제목</li>
				<li>작성자</li>
				<li>작성일</li>
				<li>조회수</li>	
			</ul>
		</div>
		
		<div>
			<!-- cmpnyQnaListController.java 에서 가져온 cmpnyQnaList 값 출력 -->
			<!-- ArrayList 형식으로 담겨져 있기 때문에 c:forEach 사용 -->
			<c:forEach var="dto" items="${cmpnyQnaList}">
			<ul>
				<li>${dto.rnum }</li>
				<li><a href="<%=cp %>/CmpnyQnaArticle.love?cd=${dto.cd }">${dto.sbjct }</a></li>
				<li>${dto.name }</li>
				<li>${dto.dt }</li>
				<li>${dto.cnt }</li>			
			</ul>
			</c:forEach>
		</div>
		
		<div>
			${pageIndexList }
		</div>
		
		<!-- 질문 사항을 등록할 수 있는 페이지로 이동 -->
		<button type="button" onclick="location.href='<%=cp %>/cmpny/CmpnyQnaCreate.jsp'">질문하기</button>
	
	</div>
	<!-- 메인풋터 영역 -->
    <c:import url="${cp }/main/footer.jsp"/>
</body>
</html>