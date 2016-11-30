<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디룸 선택</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <!-- Google Font -->
    <link href='http://fonts.googleapis.com/css?family=Dosis:300,400,500,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

    <!-- Icon Font-->
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/owl.theme.default.css">
    <!-- Animate CSS-->
    <link rel="stylesheet" href="css/animate.css">

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript" src="<%=cp %>/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">

var shopId ="";

	//라디오 선택값
	$(document).ready(function()
	{
		$("#select").click(function()
		{
			

			if ($("input[type=radio][name=chk]:checked").val()==undefined) 
			{
				alert("스터디룸을 선택하세요.");
				
			}
			else if($("input[type=radio][name=chk]:checked"))
			{
				shopId=$("input[type=radio][name=chk]:checked").val();
				//alert(shopId);
				
				var url = "StudyRoomCreate.room?shopId="+shopId;
				$(location).attr('href',url);
			
			}
			

		});
	});

	
	//업체추가
	$(document).ready(function()
	{
		$("#shopAdd").click(function()
		{
			window.open('ShopAddForm.room', 'CLIENT_WINDOW','resizable=yes scrollbars=yes, width=400,height=500,left=400,top=150');
			
		});
	});

</script>
</head>
<body>
<c:choose>
    <c:when test="${nickname eq null}">
      <div class="row">
         <div class="form-group col-xs-12">
            <div class="">
               <c:import url="StudyRoomTop.jsp"></c:import>
            </div>
         </div>
      </div>
    </c:when>
    <c:when test="${nickname ne null}">
   <div class="row">
      <div class="form-group col-xs-12">
         <div class="">
            <c:import url="StudyRoomTop_member.jsp"></c:import>
         </div>
      </div>
   </div>
   </c:when>
</c:choose>

<br><br><br>
<div class="container">
<div class="row text-center">

   <div class="form-group col-sm-2"></div>
   <div class="form-group col-sm-8 form-group-sm">
            <div class="row">
					<br>            
               		<table class="table table-hover">
	               		<tr>
	               			<td></td>
		                    <td><strong>스터디룸명</strong></td> 
		                    <td><strong>전화번호</strong></td> 
		                    <td><strong>영업시간</strong></td> 
		                    <td><strong>위치</strong></td> 
		                    <td><strong>휴무일</strong></td> 
		                    <td><strong>방 개 수</strong></td> 
		                    <td><strong>흡연실 유무</strong></td>
		                    <td><strong>프린트 유무</strong></td>
	                    <tr>
	                    <c:forEach var="shop" items="${list}">
	                    <tr>
	                    	<td><input type="radio" name="chk" id="${shop.shopId }" value="${shop.shopId }"></td>
							<td><label for="${shop.shopId }">${shop.shopName}</label></td>
							<td>${shop.tel}</td>
                            <td>${shop.hour}</td>
                            <td><button type="button" id="map" class="btn btn-info btn-sm " name="map" onclick="javascript:window.open('StudyRoomViewMap.room?dongkyung=${shop.dongkyung}&bukwi=${shop.bukwi}&shopName=${shop.shopName}','지도','width=400,height=330,left=150,top=150')">지도보기</button></td>
                            <td>${shop.holiday}</td>
	                        <td>${shop.roomCount}</td>
                            <td><c:if test="${shop.yesno1=='1'}">있음</c:if><c:if test="${shop.yesno1=='2'}">없음</c:if></td>
                            <td><c:if test="${shop.yesno2=='1'}">있음</c:if><c:if test="${shop.yesno2=='2'}">없음</c:if><c:if test="${shop.yesno2=='3'}">고장</c:if></td>
	                    
	                    </tr>
                     </c:forEach>
                     
                     
                     
         
         
         		  </table>
                  </div>
                  
           <div class="row">
               <div class="col-sm-12 text-center">
               <br>
                  <button type="button" class="btn btn-primary" id="select">선택</button>
						<button type="reset" class="btn btn-default" id="shopAdd">스터디룸 추가</button>
					</div>
            </div>
            
         </div>
   </div>
      <div class="col-sm-2"></div>
</div>


<div class="row">
   <div class="col-md-9"></div>
   <div class="form-group col-md-3">
      <button type="button" class="btn btn-default cs-btn"  onclick="location.href='StudyRoomMain.room'">목록으로</button>
   </div>
   <!-- 좌표 찍는 값 -->
   <input type="hidden" id="p_id" name="bukwi" value="" >
   <input type="hidden" id="t_id" name="dong" value="">
</div>



<div class="row">
   <div><c:import url="/WEB-INF/jsp/import/copyright.jsp"></c:import></div>
</div>
</body>
</html>