<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 회원관리 - 상담 관리</title>
<link href="<%=cp %>/css/hyuncss/bootstrap.css" rel="stylesheet">
<link href="<%=cp %>/css/hyunseokcss/usermain.css" rel="stylesheet">

<script type="text/javascript" src="<%=cp %>/js/company/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/company/jquery-ui.js"></script>
<script src="<%=cp %>/js/mainjs/bootstrap.min.js"></script>
<script type="text/javascript">
	var n = 1;
	
	$(function() 
	{
		var str = "";	
		str = "<c:forEach var='i' items='${list }'> " +
		 "<tr> " +
			"<td><input type='radio' class='radio' name='select' id='radio" + n +"' data-name='${i.name}' data-cd='${i.adv_cd}'></td>" +
			"<td>${i.list}</td>" +
			"<td>${i.name}</td>" +
			"<td>${i.gctnt}</td>" +
			"<td>${i.dt}</td>" +
			"<td>${i.ctnt}</td>" +
			"<c:if test = '${i.rctnt == \"대기\"}'>" +
			"<td><select class='select' id='select"+ n++ + "' data-cd='${i.adv_cd}'><option selected='selected'>대기</option><option>취소</option><option>완료</option></select></td>" +
			"</c:if>" +
			"<c:if test = '${i.rctnt == \"취소\"}'>" +
				"<td><select class='select' id='select"+ n++ + "' data-cd='${i.adv_cd}'><option>대기</option><option selected='selected'>취소</option><option>완료</option></select></td>" +
			"</c:if>" +
			"<c:if test = '${i.rctnt == \"완료\"}'>" +
				"<td><select class='select' id='select"+ n++ + "' data-cd='${i.adv_cd}'><option>대기</option><option>취소</option><option selected='selected'>완료</option></select></td>" +	
			"</c:if>" + 
			"</tr>" +
			"</c:forEach>" +
			"<tr><td></td>	<td></td>	<td></td>	<td></td>	<td></td>	<td></td>"+
			"<td><button type='button' id='popup'>보기</button></td></tr>";
			
		$("#add").append(str);
	});

	$(function() 
	{
		$("#popup").click(function() 
		{
			for(var i=0; i<n; i++)
			{
				if ($("#radio" + i).is(":checked"))
				{
					alert("메렁");
					return;
					// 팝업의 값을 보내야한다.
					/* var name = $('#radio' + i).attr('data-name')
					alert(name);
					var tel = $('#radio' + i).attr('data-tel')
					alert(tel);
					
					window.open("CompanyMembershipReservationsPopup.love?name="+name+"&tel="+tel);
					break; */
				}
				if (i == n-1)
				{
					alert("회원을 선택해주세요");
				}
			}
		});
		
		$(".select").change(function() 
		{
			$.post("CompanyMembershipConsultingAjax.love", {cd : $(this).attr("data-cd"), text : $(this).val()}, function(data) 
			{
				
			});
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
		<c:import url="${cp }/company/CompanyMenu.jsp"/>
	
		<h5><a href="<%=cp %>/company/CompanyMembershipReservations.love">예약 관리</a>&nbsp;┃&nbsp;
			<a href="<%=cp %>/company/CompanyMembershipConsulting.love"  style="color:red;">상담 관리</a>&nbsp;┃&nbsp;
			<a href="<%=cp %>/company/CompanyMembershipReviews.love">상품평 관리</a></h5>
			
	<!-- ↑ 여기까지 공통으로 가져가야할 내용 -->	
			<div id="qna" class="col-sm-9" >
			<table id ="add" class="table table-striped">
				<colgroup width="100%">
                      <col width="10%">
                      <col width="10%">
                      <col width="10%">
                      <col width="10%">
                      <col width="25%">
                      <col width="20%">
                      <col width="15%">
           		 </colgroup>
				 <thead>
                      <tr>
                          <th scope="col">선택</th>
						  <th scope="col">카테고리</th>
						  <th scope="col">이름</th>
						  <th scope="col">성별</th>
						  <th scope="col">작성일</th>
						  <th scope="col">문의사항</th>
						  <th scope="col">결과</th>
                      </tr>
                  </thead>
			  </table>
			  </div>
		</div>

	</div> <%-- 내용 --%>

	<!-- 메인풋터 영역 -->
    <c:import url="${cp }/main/footer.jsp"/>


</body>
</html>