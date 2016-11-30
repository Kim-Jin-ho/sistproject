<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoticeUpdate.jsp</title>
<!-- 공지사항 수정 페이지 -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<script type="text/javascript">

	$(document).ready(function()
	{
		$("#submitBtn").click(function()
		{
			// 데이터 검사(누락된 입력값 검사) 후 submit 액션
			if ($("#subject").val()==""|| $("#name").val=="")
			{
				alert("입력누락된 항목이 존재합니다.");
				return;
			}
			//submit 액션 처리
			$("#noticeForm").submit();
		});
	});
</script>
</head>
<body>

	
	<!-- GNB 영역 -->
	<c:import url="${cp }/main/mainGnb.jsp"/>
	
	<!-- 메뉴 -->
	<c:import url="${cp }/admin/AdminMenu.jsp"></c:import>
	
	
	<div>
		<div>
			<h5>수정하기</h5>
		</div>
		<!-- 최종 수정값을 넘겨 등록함 -->
		<form action="<%=cp %>/NoticeUpdate.love?cd=${noticeUpdateSend.cd }" id="noticeForm" name="noticeForm" method="post">
		
			<div>
				<div>
					<!-- 공지사항 수정하는 페이지이기 때문에 기존에 존재했던 값을 출력 -->
					<ul>
						<li>제&nbsp;&nbsp;&nbsp;&nbsp;목</li>
						<li>
							<input type="text" id="subject" name="subject" class="boxTF"
							 value="${noticeUpdateSend.sbjct }" maxlength="100" size="50">
						</li>
					</ul>
				</div>	
				
				<div>
					<ul>
						<li>내 용</li>
						<li>
							<textarea id="content" name="content" rows="10" cols="60">${noticeUpdateSend.ctnt }</textarea>
						</li>
					</ul>
				</div>
						
			</div>
			
			<div>
				<button type="button" class="btn" id="submitBtn">수정완료</button>
				<button type="reset"  class="btn" onclick="document.qnaForm.subject.focus();">다시 입력</button>
				<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/NoticeList.love'" >작성취소</button>
			</div>
		</form>
	</div>
	
	
		<!-- 메인풋터 영역 -->
	    <c:import url="${cp }/main/footer.jsp"/>
		


</body>
</html>