<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>

<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>예약하기양식불러오기</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/css/youngjin/MenuStyle.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/youngjin/TableStyle.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/youngjin/MainStyle.css">

<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="ajax.js"></script>

<script type="text/javascript" src="<%=cp %>/js/youngjin/jquery-ui.min.js"></script>
<link rel="stylesheet" href="<%=cp %>/js/youngjin/jquery-ui.min.css">


<!-- 예약원하는 날짜 달력 -->
<script type="text/javascript">
	
	$(function()
	{
		$("#datepicker").datepicker(
		{
			dataFormat: "yy-mm-dd",
		});
	});

</script>



<!-- 견적낸정보 사용하기 버튼 누를시 이벤트 -->
<script type="text/javascript">

	$(function()
	{
		$("#estimate").hide();
		
		$("#estimateChk").click(function()
		{
			$("#estimate").toggle();
			// 해당정보의 체크여부를 확인해서 보여줄고 숨기고
			if($("#estimateChk").is(":checked"))
			{
				$("#estimate").show();
			}
			else
			{
				$("#estimate").hide();
			}
		});
	});
</script>




<!-- 예약신청완료 -->
<script type="text/javascript">

	$(function()
	{
		$("#reserveOk").click(function()
		{
			alert("예약신청이완료되었습니다.");
			// 예약된 정보를 기업에게 보내준다.
			var f = document.getElementById("reserveIdCm");
			
			f.submit();
			
			/* 창 닫힘/ onclick="window.close(); 를 주면 경고창없이 바로 닫힘  */
			window.close();
		});
	});
	
	$(function()
	{
		$("#reserveNo").click(function()
		{
			var i = confirm("예약신청을 취소하셨습니다.현페이지를 닫겠습니까?");
			
			if(i == true)
			{
				//alert("페이지닫음");
				window.close();
			}
			
		});
	});

</script>

</head>

<body>
	고객님의 중요한 결혼준비를 your my sunshine에 문의해주셔서 감사합니다
	<br><br>
	
	<div>
	<form action="무슨무슨ok페이지.love" method="post" name="reserveCm" id="reserveIdCm"> 
		<table border="1">
			<tr>
				<td rowspan="9">고객님정보</td>
				<td>아이디(*)</td>
				<th>
					<input name="usrId" type="text" value="${usrId }">
				</th>
			</tr>
			
			<tr>
				<td>이름(*)</td>
				<th>
					<input name="usrName" type="text" value="${usrName }">
				</th>
			</tr>
			<tr>
				<td>휴대폰번호(*)</td>
				<th>
					<input name="usrTel"  type="text" value="${usrTel}">
				</th>
			</tr>
			<tr>
				<td>예약원하는날짜</td>
				<th>
					
					<!-- <input type="date"> -->
					<input name="usrdata"  type="text" id="datepicker" placeholder="원하는 날짜를 선택하세요">
				</th>
			</tr>
			<tr>
				<td>예약원하는시간</td>
				<th>
					예약원하는시간보여주기select
					<select name="usrTime" >
						<option value="time10">10시</option>
						<option value="time11">11시</option>
						<option value="time12">12시</option>
						<option value="time14">14시</option>
						<option value="time15">15시</option>
						<option value="time16">16시</option>
						<option value="time17">17시</option>
						<option value="time18">18시</option>
					</select>
				</th>
			</tr>
			<tr>
				<td>이메일(*)</td>
				<th>
					<input name="usrEmail" type="text" value="${usrEmail }">
				</th>
			</tr>
			<tr>
				<td>성별(*)</td>
				<th>
					<input name="gndr"  type="text" value="${gndr }">
				</th>
			</tr>
			<tr>
				<td rowspan="2">답변방법</td>
				<th>방문</th>
			</tr>
			<tr>
				<th>가입해주신 정보는 본인확인....</th>
			</tr>
			
			<tr>
				<td>예약신청정보</td>
				<td>상품명</td>
				<th>
					선택한상품명불러오기(고정값변경불가)
				</th>
			</tr>
			
			<tr>
				<td>기타문의사항</td>
				<th colspan="2">
				<textarea rows="10" cols="80%" placeholder="기타문의사항을 입력하세요."></textarea>
				</th>
			</tr>		
		</table>
		<br>
	</form>
	
		견적낸정보를 사용하시겠습니까?
		<input type="checkbox" id="estimateChk"><br>
		
		<div id="estimate">
			<table border="1">
				<tr>
					<th>요일</th>
					<th>형태/시설구분</th>
					<th>인원</th>
				</tr>
				<tr>
					<td>월~일</td>
					<td>동시/일반홀</td>
					<td>착석:100명, 최대:200명</td>
				</tr>
				
				<tr>
					<th>요일</th>
					<td>
						월요일(사용자선택값)
					</td>
				</tr>
				<tr>
					<th>홀이름</th>
					<td>
						웨딩홀1-10원(사용자선택값)
					</td>
				</tr>
				<tr>
					<th>식사메뉴</th>
					<td>
						한식-10원(사용자선택값)
					</td>
				</tr>
			</table>
			총계 : 	10000원 (선택한값 + 해서 가져오기)
		</div>
		<br>
		
		<button id="reserveOk" type="button">예약신청완료</button>
		<button id="reserveNo" type="button">취소</button>
		<br>
		
	</div>
	<br>


</body>
</html>
















