<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CmpnyQnaCreate.jsp</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<script type="text/javascript">

	$(document).ready(function()
	{
		$("#submitBtn").click(function()
		{
			// 데이터 검사(누락된 입력값 검사) 후 submit 액션
			if ($("#subject").val()==""|| $("#content").val()=="")
			{
				alert("입력누락된 항목이 존재합니다.");
				return;
			}
			//submit 액션 처리
			$("#qnaForm").submit();
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
		<div>
			<h5>질문하기</h5>
		</div>
		
		<form action="<%=cp%>/CmpnyQnaCreate.love" id="qnaForm" name="qnaForm" method="post">
			<div>
				<div>
					<ul>
						<li>제&nbsp;&nbsp;&nbsp;&nbsp;목</li>
						<li>
							<input type="text" id="subject" name="subject" maxlength="100" size="50">
						</li>
					</ul>
				</div>	
				
				<div>
					<ul>
						<li>내 용</li>
						<li>
							<textarea id="content" name="content" rows="10" cols="60" ></textarea>
						</li>
					</ul>
				</div>
						
			</div>
			
			<div id="">
				<button type="button" class="btn" id="submitBtn">등록하기</button>
				<button type="reset"  class="btn" onclick="document.qnaForm.subject.focus();">다시 입력</button>
				<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/CmpnyQnaList.love';" >작성취소</button>
			</div>
		</form>
	</div>
	
	<!-- 메인풋터 영역 -->
    <c:import url="${cp }/main/footer.jsp"/>
</body>
</html>