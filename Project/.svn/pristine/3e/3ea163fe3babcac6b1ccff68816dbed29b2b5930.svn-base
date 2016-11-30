<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminCoMemberList.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<link href="<%=cp %>/css/hyuncss/bootstrap.css" rel="stylesheet">
<link href="<%=cp %>/css/hyunseokcss/usermain.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="<%=cp %>/js/mainjs/bootstrap.min.js"></script>
<script type="text/javascript">

	var test="";
	var a="";
	
	
	/* 다중선택 막음 */
	$(document).ready(function() {
	    //라디오 요소처럼 동작시킬 체크박스 그룹 셀렉터
	    $('input[type="checkbox"][name="chk"]').click(function(){
	        //클릭 이벤트 발생한 요소가 체크 상태인 경우
	        if ($(this).prop('checked')) {
	            //체크박스 그룹의 요소 전체를 체크 해제후 클릭한 요소 체크 상태지정
	            $('input[type="checkbox"][name="chk"]').prop('checked', false);
	            $(this).prop('checked', true);
	        }
	    });
	});
	


	/* 경고횟수(warningNum)이 1이상이면 클릭했을 때 checkWarning 팝업 */
 	$(document).ready(function(){
	    $(".warncount").click(function(){
	    	
		test=$(this).val();				
		//alert("버튼선택");
		//alert(test);			
			
   		
		//$(location).attr("href", ("CheckWarning.love?cmpny_id="+test));
		//window.open('CheckWarning.love?cmpny_id='+test, 'CLIENT_WINDOW','resizable=yes scrollbars=yes width=300 height=150');
		
		window.open('CheckWarning.love?cmpny_id='+test, 'CLIENT_WINDOW','resizable=yes scrollbars=yes width=300 height=150');	
 		
	    });
 
 	}); 

	
	/* checkTest */
	$(document).ready(function(){
	    $(".checkbox").click(function(){
	        if($(".checkbox").is(":checked")){
	        	//사업자번호
 				test=$(this).val();				
 				//경고횟수
	        	a = $(this).attr('data-a');
	        	//alert("체크 선택");
				//alert(test);		
				//alert(a);
	        	
	        
	        }else{
	            alert("체크박스 체크 해제!");
	        }
	    });
	});
	
	
	$(document).ready(function()
	{
		$("#addWarning").click(function() 
		{
			if (a > 2) 
			{
				alert("경고횟수가 3회 이상입니다.");
				return;
			}	
			
			window.open("AddWarningInsertForm.love?cmpny_id="+test+"&warncount="+a, 'CLIENT_WINDOW','resizable=yes scrollbars=yes width=300 height=150');
			
		});
		
		 $("#minWarning").click(function()
		{
			if (a < 1) 
			{
				alert("누적된 경고가 없습니다.");
				return;
			}	
				if (confirm("경고를 차감하시겠습니까?") == true) 
				{
					$(location).attr("href", ("MinWarning.love?cmpny_id="+test+"&warncount="+a));			    	
				}
				else
				{   //취소
					return;
				}
				    	 		
		});
		
		
	});
	
	
	
	// select box
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
		<c:import url="${cp }/admin/AdminMenu.jsp"/>

		<h5>기업회원관리</h5>
		<div id="adminCoMemberList" class="col-sm-9">
		선택회원 <button type="button" class="btn" id="addWarning">경고추가</button>
				 <button type="button" class="btn" id="minWarning">경고차감</button>

		<!-- 테이블 -->

			<table class="table table-striped text-center">
				<colgroup width="100%">
					  <col width="5%">
                      <col width="15%">
                      <col width="20%">
                      <col width="15%">
                      <col width="35%">
                      <col width="10%">
                </colgroup>			
			
				<thead>
					<tr>
						<th></th>
						<th scope="col" class="text-center">사업자번호</th>
						<th scope="col" class="text-center">업체명</th>
						<th scope="col" class="text-center">전화번호</th>
						<th scope="col" class="text-center">지역</th>
						<th scope="col" class="text-center">경고</th>
					</tr>
				</thead>
	
			<tbody>
				<c:forEach var="cmpny" items="${list }">
				<tr>
					<td>
					<input type="checkbox" class="checkbox" name="chk" value="${cmpny.cmpny_Id}" data-a="${cmpny.warncount}">
					</td>
					<td id="cmpny_Id">${cmpny.cmpny_Id }</td>
					<td>${cmpny.name }</td>
					<td>${cmpny.tel }</td>
					<td>${cmpny.addr1 }</td>
					<td id="warncount" ><input type="hidden" id="badCnt_${cmpny.cmpny_Id}"  name="badCnt_${cmpny.cmpny_Id}" value="${cmpny.cmpny_Id }"/>
					<c:if test="${cmpny.warncount >= 1 }">
					<button type="button" class="warncount btn btn-xs" name="chk" value="${cmpny.cmpny_Id}">${cmpny.warncount }</button></c:if>
					<c:if test="${cmpny.warncount < 1 }">
					<button type="button" class="warncount btn btn-xs" name="chk" value="${cmpny.cmpny_Id}" disabled>${cmpny.warncount }</button></c:if>
					</td>
				</tr>
				
				</c:forEach>
			</tbody>	
			
			</table>
			
		<div class="containersection">
		</div>
			
	
		
		</div>
		</div>
	</div>
</div>


	<!-- 메인풋터 영역 -->
    <c:import url="${cp }/main/footer.jsp"/>


</body>
</html>