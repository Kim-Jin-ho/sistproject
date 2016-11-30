<%@ page import="class3.com.admin.QnaDAO"%>
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
<link href="<%=cp %>/css/hyuncss/bootstrap.css" rel="stylesheet">
<link href="<%=cp %>/css/hyunseokcss/usermain.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="<%=cp %>/js/mainjs/bootstrap.min.js"></script>
<script type="text/javascript">

$(document).ready(function()
	{
		$("#cmtInsert").click(function()
		{
			var f = confirm("입력하시겠습니까?");
			
			if(f==true)
			{
				
				var a = $("#adminCmt").val();
				if ($("#adminCmt").val()=="") {
					
					alert("내용을 입력하세요.");
				}
				else
				{
				//alert(a);
				$(location).attr("href", ('AddCmt2.love?cd=${cmpnyQnaArticle.cd }&adminCmt='+a));
				}
			}	
			else
				return;
		});
	});


$(document).ready(function()
	{
		$("#cmtDelete").click(function()
		{
			// 삭제 버튼 클릭시 확인 받는 알림창 출력
			var f = confirm("정말로 삭제하시겠습니까?");
			
			// 확인을 클릭하면 삭제 취소를 클릭하면 취소
			if(f==true)
			{
				
				//var a = $("#cmtDelete").val();
				//alert(a);
				alert('DelCmt2.love?cd=${cmpnyQnaComment.cd }&userCmtCd=${cmpnyQnaArticle.cd }');
				$(location).attr("href", ('DelCmt2.love?cd=${cmpnyQnaComment.cd }&userCmtCd=${cmpnyQnaArticle.cd }'));
				
			}
			else
				return;
		});
	});

</script>
</head>
<body>
	<!-- GNB 영역 -->
	<c:import url="${cp }/main/mainGnb.jsp"/>
	<!-- 메뉴 -->
	<c:import url="${cp }/main/mainMenu.jsp"></c:import>

	<hr style="border: solid 1px red">
		
	<div class="containersection">
	
	<div class="container">
	<c:import url="${cp }/admin/AdminMenu.jsp"></c:import>	
		
		<form action="<%=cp%>/CmpnyQnaDelete.love?cd=${cmpnyQnaArticle.cd }" id="qnaForm" name="qnaForm" method="post">
			<div class="col-sm-9">
				<table class="table table-striped">
				<colgroup width="100%">
                      <col width="10%">
                      <col width="70%">
                      <col width="10%">
            	</colgroup>
				<tr>
					<th class="text-center">글번호</th>
					<td colspan="2">${cmpnyQnaArticle.cd }</td>
				</tr>
				
				<tr>
					<th class="text-center">제목</th>
					<td colspan="2">${cmpnyQnaArticle.sbjct }</td>
				</tr>	
				<tr>
					<th class="text-center">작성자</th>
					<td colspan="2">${cmpnyQnaArticle.name }</td>
				</tr>
				<tr>
					<th class="text-center">작성시간</th>
					<td colspan="2">${cmpnyQnaArticle.dt }</td>
				</tr>
				
				<tr>
					<th class="text-center">조회수</th>
					<td colspan="2">${cmpnyQnaArticle.cnt }</td>
				</tr>
			
				<tr>
					<th class="text-center">내용</th>
					<td colspan="2">${cmpnyQnaArticle.ctnt }</td>
				</tr>
				
			<!-- 관리자가 답글을 달아주었으면 출력되고 아니면 출력이 안된 상태로 남아있음 -->
			<c:if test="${cmpnyQnaComment != null}">
				<tr>
					<th class="text-center">작성자</th>
					<td colspan="2">${cmpnyQnaComment.admin }</td>	
				</tr>		
				<tr>
					<th class="text-center">답변</th>
					<td colspan="2">${cmpnyQnaComment.ctnt }</td>	
				</tr>
				<tr>
					<th class="text-center">작성일</th>
					<td colspan="2">${cmpnyQnaComment.dt }</td>	
				</tr>	
				<tr>
					<th></th>
					<td><button type="button" id="cmtDelete" value="${cmpnyQnaComment.cd }">삭제</button></td>	
				</tr>	
								
			</c:if>
				<tr>
			 		<th class="text-center">관리자</th>
			 		<td><textarea rows="5" cols="80" name="adminCmt" id="adminCmt" class="form-control" style="resize:none;"></textarea></td>
					<td class="text-center"><button type="button" class="btn" id="cmtInsert">입력</button></td>
				</tr>

			</table>
			
			</div>
					<button type="button" class="btn col-sm-offset-11"  onclick="javascript:location.href='<%=cp %>/CmpnyQnaList2.love'">목록</button>
					<div class="containersection">
			</div>
		</form>
	</div>
	</div>
	
	<!-- 메인풋터 영역 -->
    <c:import url="${cp }/main/footer.jsp"/>
</body>
</html>