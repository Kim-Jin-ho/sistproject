<%@ page import="class3.com.user.UserDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String cp = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CmpnyQnaArticle.jsp</title>
<!-- 특정 QNA 글을 선택하게 되면 글의 내용을 출력해주는 페이지 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		$("#submitBtn").click(function()
		{
			// 삭제 버튼 클릭시 확인 받는 알림창 출력
			var f = confirm("정말로 삭제하시겠습니까?");;
			
			// 확인을 클릭하면 삭제 취소를 클릭하면 취소
			if(f==true)
				$("#qnaForm").submit();
			else
				return;
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
	 
	
	<div id="container">
		
		<div>
			<h5>글보기</h5>
		</div>
		
		<form action="<%=cp%>/CmpnyQnaDelete.love?cd=${cmpnyQnaArticle.cd }" id="qnaForm" name="qnaForm" method="post">
		
			<div>
				<ul>
					<li>글번호</li>
					<li>제목</li>
					<li>작성자</li>
					<li>작성시간</li>
					<li>조회수</li>
					<li>내용</li>
				</ul>
			</div>
			
			
			<div>
				<ul>
					<!-- CmpnyQnaArticleController.java 에서 받아온 cmpnyQnaArticle 값 출력 -->
					<li>${cmpnyQnaArticle.cd }</li>
					<li>${cmpnyQnaArticle.sbjct }</li>
					<li>${cmpnyQnaArticle.name }</li>
					<li>${cmpnyQnaArticle.dt }</li>
					<li>${cmpnyQnaArticle.cnt }</li>
					<li>${cmpnyQnaArticle.ctnt }</li>
				</ul>
			</div>
			
			<!-- 관리자가 답글을 달아주었으면 출력되고 아니면 출력이 안된 상태로 남아있음 -->
			<c:if test="${cmpnyQnaComment != null}">
				<div>
					<ul>
						<li>작성자</li>
						<li>답변</li>
						<li>작성일</li>
					</ul>
				</div>
				
				<div>
					<ul>
						<li>${cmpnyQnaComment.admin }</li>
						<li>${cmpnyQnaComment.ctnt }</li>
						<li>${cmpnyQnaComment.dt }</li>
					</ul>
				</div>
			</c:if>
			
			<div>
				<ul>
					<li><button type="button" onclick="javascript:location.href='<%=cp %>/CmpnyQnaUpdateSend.love?cd=${cmpnyQnaArticle.cd }'">수정하기</button></li>	
					<li><button type="button" id="submitBtn">삭제하기</button></li>
					<li><button type="button" onclick="javascript:location.href='<%=cp %>/CmpnyQnaList.love'">목록</button></li>
				</ul>
			</div>
		</form>
	</div>
	
	<!-- 메인풋터 영역 -->
    <c:import url="${cp }/main/footer.jsp"/>
</body>
</html>