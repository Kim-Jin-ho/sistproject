<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminProductManagement.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<link href="<%=cp %>/css/hyuncss/bootstrap.css" rel="stylesheet">
<link href="<%=cp %>/css/hyunseokcss/usermain.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="<%=cp %>/js/mainjs/bootstrap.min.js"></script>
<script type="text/javascript">

	var test = "";
	var a="";
	
	/* AllCheck */
	$(document).ready(function(){
	    //최상단 체크박스 클릭
	    $("#checkall").click(function(){
	        //클릭되었으면
	        if($("#checkall").prop("checked")){
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[name=chk]").prop("checked",true);
	            //클릭이 안되있으면
	        }else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=chk]").prop("checked",false);
	        }
	    })
	});
	
	$(".checkbox").click(function()
	{
		if (confirm("현재 선택한 데이터를 삭제하시겠습니까?")) 
		{
			$(location).attr("href", "EmployeeDelete.action?employeeId="+$(this).val());
			
		}
				
	});
	
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
	



	 
	 
		/* checkTest */
		$(document).ready(function(){
		    $(".checkbox").click(function(){
		        if($(".checkbox").is(":checked")){
		            
		            //아이디
	 				test=$(this).val();				
	 				//등록상태
		            a = $(this).attr('data-a');
	 				//alert("체크 선택");
					//alert(test);		
					//alert(a);
		        	
	/* 	        	var a = $(this).attr('data-a');
					alert("=======================");
					alert("badCnt_"+a);
					var badCnt = $("#badCnt_"+a).val();
					alert(a + " / " + badCnt);
	 */				
	 


		        }else{
		            alert("체크박스 체크 해제!");
		        }
		    });
		});
		
		
		$(document).ready(function()
		{
			$("#delProduct").click(function()
			{	
				
		
	 				if (confirm("상품을 블라인드하시겠습니까?") == true) 
					{
						$(location).attr("href", ("DelProduct.love?cmpny_id="+test));			    	
					}
					else
					{   //취소
						return;
					}
					
			})			
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
		
		<h5>상품관리</h5>
	
		<div id="prodManagement" class="col-sm-9"> <!-- 테이블 -->
		선택상품 <button type="button" class="btn" id="delProduct">블라인드</button>
	
		<table class="table table-striped">
				<colgroup width="100%">
					<col width="5%">
                      <col width="10%">
                      <col width="20%">
                      <col width="35%">
                      <col width="10%">
                      <col width="10%">
                      <col width="10%">
                </colgroup>
                <thead>
		
					<tr>
						<th></th>
						<th scope="col" class="text-center">상품번호</th>
						<th scope="col" class="text-center">카테고리</th>
						<th scope="col" class="text-center">상품명</th>
						<th scope="col" class="text-center">최소가격</th>	
						<th scope="col" class="text-center">최대가격</th>	
						<th scope="col" class="text-center">게시상태</th>	
					</tr>
					</thead>
					
					<tbody>
					
						<c:forEach var="product" items="${list }">
						<tr>
							<td class="text-center"><c:if test="${product.post_cd=='2' }"><input type="checkbox" class="checkbox" name="chk" value="${product.cmpny_id }" data-a="${product.post_cd}"></c:if>
								<c:if test="${product.post_cd!='2' }"><input type="checkbox" class="checkbox" name="chk" value="${product.cmpny_id }" data-a="${product.post_cd}" disabled="disabled"></c:if></td>
							<td class="text-center">${product.cmpny_id }</td>
							<td class="text-center">${product.ctgy }</td>
							<td>${product.prodName }</td>
							<td class="text-center"><fmt:formatNumber value="${product.min }" groupingUsed="true"/></td>
							<td class="text-center"><fmt:formatNumber value="${product.max }" groupingUsed="true"/></td>
							<%-- <td>${product.post_cd }</td> --%>
				 			<td class="text-center" id="post"><input type="hidden" id="badCnt_${product.post_cd}"  name="badCnt_${product.post_cd}" value="${product.post_cd }"/>
				 			<c:if test="${product.post_cd=='1' }">
							미작성
							</c:if>
							<c:if test="${product.post_cd=='2' }">
							등록
							</c:if>
							<c:if test="${product.post_cd=='3' }">
							미등록
							</c:if>
							</td>			
						</tr>
		</c:forEach>
		
		</tbody>
	</table>
	
	
		<div class="containersection">
		</div>
	
	
	
	</div>
	</div>
	

	
	

<!-- 메인풋터 영역 -->
    <c:import url="${cp }/main/footer.jsp"/>
	

</div>

</body>
</html>