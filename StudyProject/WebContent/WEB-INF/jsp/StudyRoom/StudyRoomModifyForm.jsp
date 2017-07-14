<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
	// 확인
	//System.out.println(cp);
	String srId = request.getParameter("SRID");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<!-- <link rel="stylesheet" href="http://bootswatch.com/paper/bootstrap.min.css" >
<link rel="stylesheet" href="http://bootswatch.com/paper/bootstrap.css" > -->
    <!-- Google Font -->
    <link href='http://fonts.googleapis.com/css?family=Dosis:300,400,500,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

     <!-- Preloader -->
<!--     <link rel="stylesheet" href="css/preloader.css" type="text/css" media="screen, print"/> -->

    <!-- Icon Font-->
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/owl.theme.default.css">
    <!-- Animate CSS-->
    <link rel="stylesheet" href="css/animate.css">

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript" src="ajax.js"></script>

<script type="text/javascript">

	$(document).ready(function()
	{
		$("#submitBtn").click(function()
		{
		   // 데이터 검사(누락된 입력값 검사) 후 submit 액션
		   if($("#subject").val()==""|| $("#main").val()=="")            
		   {
		      $("#errMsg").css("display","inline")
		      //alert("입력 누락된 항목이 존재합니다.");
		      return;
		   }
		   		   // submit 액션 처리
		   $("#createForm").submit();
		});
		$("#map").click(function()
		{
			winObj = window.open('StudyRoomCreateMap.room','지도','width=400,height=550,left=150,top=150');
			alert(winObj.document.forms.map1.latlng.value = latlng);
			winObj.document.forms.map1.latlng.value = latlng;
			
		})
	});



	$(function()
			{

	      $("#save").click(function()
	      {
	          oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	          $("#frm").submit();
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
<div class="row">
	<div class="form-group col-sm-2"></div>
	<div class="form-group col-sm-8 form-group-sm">
				
		<form id="frm" action="StudyRoomModify.room?SRID=<%=srId %>" method="post" >
			<div class="form-group"></div>
			<div class="form-group">
				<div class="row">
            		   <input class="form-control" size="20" type="hidden" name="SRID" value="<%= srId%>" disabled="disabled">
		               <label class="col-sm-2 text-right">방이름</label> 
		               <div class="col-sm-9">
		                  <c:forEach var="dao" items="${lists }">
		                     <input type="text" id="title" name="title" class="form-control" value="${dao.shopNo }" placeholder="방 이름을 입력하세요" disabled="disabled"/>
		                   </c:forEach>	
		               </div>
				</div>
				
		
				<div class="row">
					<label class="col-sm-2 text-right">지역</label> 
					<div class="col-sm-9">	
						<select name="location" class="form-control" disabled="disabled">
						<c:forEach var="dao" items="${lists }">
							<option value="1" <c:if test="${dao.locaTion eq 1}">selected="selected"</c:if>>서울</option>
							<option value="2" <c:if test="${dao.locaTion eq 2}">selected="selected"</c:if>>경기</option>
							<option value="3" <c:if test="${dao.locaTion eq 3}">selected="selected"</c:if>>인천</option>
							<option value="4" <c:if test="${dao.locaTion eq 4}">selected="selected"</c:if>>충청북도</option>
							<option value="5" <c:if test="${dao.locaTion eq 5}">selected="selected"</c:if>>충청남도</option>
							<option value="6" <c:if test="${dao.locaTion eq 6}">selected="selected"</c:if>>전라북도</option>
							<option value="7" <c:if test="${dao.locaTion eq 7}">selected="selected"</c:if>>전라남도</option>
							<option value="8" <c:if test="${dao.locaTion eq 8}">selected="selected"</c:if>>강원도</option>
							<option value="9" <c:if test="${dao.locaTion eq 9}">selected="selected"</c:if>>경상남도</option>
							<option value="10" <c:if test="${dao.locaTion eq 10}">selected="selected"</c:if>>경상북도</option>
							<option value="11" <c:if test="${dao.locaTion eq 11}">selected="selected"</c:if>>제주도</option>
						</c:forEach>	
						</select>
					</div>
				</div>
				<div class="row">
					<label class="col-sm-2 text-right">업체명</label>
					<div class="col-sm-9">	
										
						<select name="shopId" class="form-control shopName" disabled="disabled"	>
						<c:forEach var="dao" items="${lists }">
						<c:forEach var="shop" items="${list }">
							<option value="${shop.shopId}" <c:if test="${dao.shopId eq shop.shopId}">selected="selected"</c:if>>${shop.shopName}</option>
						</c:forEach>
						</c:forEach>							
						</select>						
					</div>
				</div> 
				<div class="row">

					<label class="col-sm-2 text-right">시간/일</label>
					
					<div class="col-sm-3 text-right">
						<c:forEach var="dao" items="${lists }">
						<input type="radio" value="2" name="timeCheck" <c:if test="${dao.dayHours eq 2}">checked="checked"</c:if>>시간
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" value="1" name="timeCheck" <c:if test="${dao.dayHours eq 1}">checked="checked"</c:if>>일
						</c:forEach>
					</div>
					<label class="col-sm-3 text-right">가&nbsp;격</label>
					<c:forEach var="dao" items="${lists }">
					<div class="col-sm-3 text-right"><input type="text" name="price" class="form-control" value="${dao.pricE2 }" onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;" maxlength=10 value="0">
					</div>
					</c:forEach>
				</div>
				<div class="row">
					<label class="col-sm-2 text-right">수용인원</label>
					<c:forEach var="dao" items="${lists }">
					<div class="col-sm-9"><input type="text" name="inwon" class="form-control" value="${dao.inWon }"></div>				
					</c:forEach>
				</div>
				<div class="row">
					<label class="col-sm-2 text-right">최소이용시간</label>
					
					<div class="col-sm-9"><select name="minTime" class="form-control">
					<c:forEach var="dao" items="${lists }">
							<option value="1" <c:if test="${dao.minTime eq 1}">selected="selected"</c:if>>1시간</option>
							<option value="2" <c:if test="${dao.minTime eq 2}">selected="selected"</c:if>>2시간</option>
							<option value="3" <c:if test="${dao.minTime eq 3}">selected="selected"</c:if>>3시간</option>
							<option value="4" <c:if test="${dao.minTime eq 4}">selected="selected"</c:if>>4시간</option>
							<option value="5" <c:if test="${dao.minTime eq 5}">selected="selected"</c:if>>5시간</option>
							<option value="6" <c:if test="${dao.minTime eq 6}">selected="selected"</c:if>>6시간</option>
							<option value="7" <c:if test="${dao.minTime eq 7}">selected="selected"</c:if>>7시간</option>
							<option value="8" <c:if test="${dao.minTime eq 8}">selected="selected"</c:if>>8시간</option>
							<option value="9" <c:if test="${dao.minTime eq 9}">selected="selected"</c:if>>9시간</option>
							<option value="10" <c:if test="${dao.minTime eq 10}">selected="selected"</c:if>>10시간</option>
							<option value="11" <c:if test="${dao.minTime eq 11}">selected="selected"</c:if>>영업시간동안</option>
					</c:forEach>
					</select>
					</div>
				</div>
				<div class="row">
					<label class="col-sm-2 text-right">콘센트</label>
			
					<div class="col-sm-9"><select name="consent" class="form-control">
					<c:forEach var="dao" items="${lists }">
							<option value="9" <c:if test="${dao.conSent eq 9}">selected="selected"</c:if>>없음</option>
							<option value="1" <c:if test="${dao.conSent eq 1}">selected="selected"</c:if>>1개</option>
							<option value="2" <c:if test="${dao.conSent eq 2}">selected="selected"</c:if>>2개</option>
							<option value="3" <c:if test="${dao.conSent eq 3}">selected="selected"</c:if>>3개</option>
							<option value="4" <c:if test="${dao.conSent eq 4}">selected="selected"</c:if>>4개</option>
							<option value="5" <c:if test="${dao.conSent eq 5}">selected="selected"</c:if>>5개</option>
							<option value="6" <c:if test="${dao.conSent eq 6}">selected="selected"</c:if>>6개</option>
							<option value="7" <c:if test="${dao.conSent eq 7}">selected="selected"</c:if>>7개</option>
							<option value="8" <c:if test="${dao.conSent eq 8}">selected="selected"</c:if>>8개</option>
					</c:forEach>	
					</select>
					</div>
				</div>
				<div class="row">
					<label class="col-sm-2 text-right">방음상태</label>
					<div class="col-sm-9"> 
						<div class="row">
						<c:forEach var="dao" items="${lists }">
						<div class="col-sm-4"><input type="radio" value="1" name="noiseCheck" <c:if test="${dao.souNd eq 1}">checked="checked"</c:if>>안들림</div>
						<div class="col-sm-4"><input type="radio" value="2" name="noiseCheck" <c:if test="${dao.souNd eq 2}">checked="checked"</c:if>>속삭이는 정도</div>
						<div class="col-sm-4"><input type="radio" value="3" name="noiseCheck" <c:if test="${dao.souNd eq 3}">checked="checked"</c:if>>정확히 들림</div>
						</c:forEach>
						</div>
						
					</div>
				</div>
				<div class="row">
					<label class="col-sm-2 text-right">WIFI</label>
					<div class="col-sm-9">
						<div class="row">
						<c:forEach var="dao" items="${lists }">
						<div class="col-sm-2"><input type="radio" value="1" name="wifiCheck" <c:if test="${dao.wiFi eq 1}">checked="checked"</c:if>>최상</div>
						<div class="col-sm-2"><input type="radio" value="2" name="wifiCheck" <c:if test="${dao.wiFi eq 2}">checked="checked"</c:if>>좋음</div>
						<div class="col-sm-2"><input type="radio" value="3" name="wifiCheck" <c:if test="${dao.wiFi eq 3}">checked="checked"</c:if>>보통</div>
						<div class="col-sm-2"><input type="radio" value="4" name="wifiCheck" <c:if test="${dao.wiFi eq 4}">checked="checked"</c:if>>나쁨</div>
						<div class="col-sm-2"><input type="radio" value="5" name="wifiCheck" <c:if test="${dao.wiFi eq 5}">checked="checked"</c:if>>없음</div>
						<div class="col-sm-2"></div>
						</c:forEach>
						</div>
					</div>
					<div class="col-sm-3"></div>
					<div class="col-sm-3"></div>
				</div>
				<div class="row">
					<label class="col-sm-2 text-right">냉난방기 유무</label>
					<div class="col-sm-9">
						<div class="row">
						<c:forEach var="dao" items="${lists }">
						<div class="col-sm-4"><input type="radio" value="1" name="yesnoCheck" <c:if test="${dao.yesNo eq 1}">checked="checked"</c:if>>있음</div>
						<div class="col-sm-4"><input type="radio" value="2" name="yesnoCheck" <c:if test="${dao.yesNo eq 2}">checked="checked"</c:if>>없음</div>
						<div class="col-sm-4"><input type="radio" value="3" name="yesnoCheck" <c:if test="${dao.yesNo eq 3}">checked="checked"</c:if>>고장</div>
						</c:forEach>
						</div>
					</div>		
				</div>
				<div class="row">
					
					<div class="col-sm-12">
					<hr>
						<c:forEach var="dao" items="${lists }">
						<textarea rows="10" id="ir1" name="content" style="width:720px; height:350px; ">${dao.detailCon }</textarea>	
						</c:forEach>				
					</div>
					
				</div>
				
				<div class="row">
					<div class="col-sm-12 text-center">
						<button type="button" class="btn btn-primary" id="save">수정</button>
						<button type="reset" class="btn btn-default">취소</button>
					</div>
				</div>
				
			</div>
		
		</form>
	
	</div>

	<div class="col-sm-2"></div>
</div>
</div>




<div class="row">
	<div class="form-group col-sm-8"></div>
	<div class="form-group col-sm-4">
		<button type="button" class="btn btn-default"  onclick="location.href='StudyRoomMain.room'">목록으로</button>
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