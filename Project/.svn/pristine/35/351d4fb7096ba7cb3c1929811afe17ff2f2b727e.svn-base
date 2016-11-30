
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String cp = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoticeArticle.jsp</title>
<!-- 특정 QNA 글을 선택하게 되면 글의 내용을 출력해주는 페이지 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		$("#submitBtn").click(function()
		{
			// 삭제 버튼 클릭시 확인 받는 알림창 출력
			var f = confirm("정말로 삭제하시겠습니까?");
			
			// 확인을 클릭하면 삭제 취소를 클릭하면 취소
			if(f==true)
				$("#noticeForm").submit();
			else
				return;
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
	<c:import url="${cp }/admin/AdminMenu.jsp"></c:import>
		
		<form action="<%=cp%>/NoticeDelete.love?cd=${noticeArticle.cd }" id="noticeForm" name="noticeForm" method="post">
			<div class="col-sm-9">
				<table class="table table-striped">
				<colgroup width="100%">
                      <col width="10%">
                      <col width="70%">
                      <col width="10%">
            	</colgroup>			
				<tr>
					<th class="text-center">글번호</th>
					<td colspan="2">${noticeArticle.cd }</td>
				</tr>
				
				<tr>
					<th class="text-center">제목</th>
					<td colspan="2">${noticeArticle.sbjct }</td>
				</tr>	
				<tr>
					<th class="text-center">작성시간</th>
					<td colspan="2">${noticeArticle.dt }</td>
				</tr>
				
				<tr>
					<th class="text-center">조회수</th>
					<td colspan="2">${noticeArticle.cnt }</td>
				</tr>
			
				<tr>
					<th class="text-center">내용</th>
					<td colspan="2">${noticeArticle.ctnt }</td>
				</tr>
			
			
	
			</table>
			</div>
				
					<button type="button" class="btn col-sm-offset-7" onclick="javascript:location.href='<%=cp %>/NoticeUpdateSend.love?cd=${noticeArticle.cd }'">수정</button>	
					<button type="button" class="btn id="submitBtn">삭제</button>
					<button type="button" class="btn" onclick="javascript:location.href='<%=cp %>/NoticeList.love'">목록</button>
					<div class="containersection">
				</div>
			</form>
	</div>
	</div>

	
	
	<!-- 메인풋터 영역 -->
    <c:import url="${cp }/main/footer.jsp"/>
    
    
</body>
</html>