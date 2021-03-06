<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
	String srId = request.getParameter("SRID");
	int srId1 = Integer.parseInt(srId) - 1;
	int srId2 = Integer.parseInt(srId) + 1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:forEach var="viewList" items="${viewList }">
<title>${viewList.shopNo }</title>
</c:forEach>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
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



    <!-- Style -->
    <link href="css/style.css" rel="stylesheet">

    <!-- Responsive CSS -->
    <!-- <link href="css/responsive.css" rel="stylesheet"> -->
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="js/lte-ie7.js"></script>
	  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
<script type="text/javascript" src="../OpenStudy/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="ajax.js"></script>

<script type="text/javascript">


	$(document).ready(function(){
	    $("#deleteBtn").click(function(){
	    	
	    	
	    	if (confirm("삭제하시겠습니까?")) 
	    	{

	            // Yes click
	    		location.href='StudyRoomDelete.room?SRID='+<%=srId %>;
	            
	        } 
	    	else 
	    	{
	           // no click
			}			

	    	
	    });
	}); 

</script>
</head>
<body>
<!-- 상단 메뉴 로그인 했을 경우와 로그인 안됬을 경우  -->
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
<div class="row">
	<div class="col-xs-2"></div>
	<div class="view col-xs-8"   style="border-width: medium;">
		<form class="form-group">
			<c:forEach var="viewList" items="${viewList }">
			<table class="table form-group" style="">
				<tr style="text-align: right;">
					<th class="text-left active" style="width: 150px; text-align: right;" >글번호&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<td style="text-align: left;"><%=srId %></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th class="text-left active" style="text-align: right; font-weight: bold;">방이름&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<td class="text-left active" colspan="3	">${viewList.shopNo }</td>
				</tr>
				<tr>
					<th class="text-left active" style="text-align: right;">지역&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<td>${viewList.locaTion }</td>
					<th class="text-left active" style="text-align: right;">조회&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<td>${viewList.hnHit }</td>	
				</tr>
				<tr>
					<th class="text-left active" style="text-align: right;">업체명&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<td>${viewList.shopName }</td>
					<th class="text-left active" style="text-align: right;">시간/일(가격)&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<td>${viewList.dayHours } 당 (${viewList.pricE2 }원)</td>
				</tr>
				<tr>
					<th class="text-left active" style="text-align: right;">수용인원&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<td>${viewList.inWon }</td>
					<th class="text-left active" style="text-align: right;">최소이용시간&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<td>${viewList.minTime }</td>
				</tr>
				<tr>
					<th class="text-left active" style="text-align: right;">콘센트&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<td>${viewList.conSent }</td>
					<th class="text-left active" style="text-align: right;">방음상태&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<td>${viewList.souNd }</td>
				</tr>
				<tr>
					<th class="text-left active" style="text-align: right;">WIFI&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<td>${viewList.wiFi }</td>
					<th class="text-left active" style="text-align: right;">냉난방기 유무&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<td>${viewList.yesNo }</td>
				</tr>
				<tr>
					<th class="text-left active" style="text-align: right;">작성일&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<td>${viewList.hnwDate }</td>
					<th class="text-left active" style="text-align: right;">위치보기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<th><button type="button" id="map" class="btn btn-default cs-btn" name="map" onclick="javascript:window.open('StudyRoomViewMap.room?dongkyung=${viewList.dongkyung}&bukwi=${viewList.bukwi}&shopName=${viewList.shopName}','지도','width=400,height=400,left=150,top=150')">지도보기</button></th>
					<td hidden=""><p>${viewList.dongkyung}</p></td>
					<td hidden=""><p>${viewList.bukwi}</p></td>
					<td hidden="">${viewList.shopName}</td>
				</tr>
				<tr>	
					<th  class="text-left active"  style="text-align: right;">
						내용&nbsp;&nbsp;&nbsp;&nbsp;
					</th>
					<td colspan="3" style="text-align: left;">
						${viewList.detailCon}
					</td>
				</tr>
			</table>
					<c:if test="${nickname == viewList.memBer }">
						<div class="text-center">
	
							<button type="button" class="btn btn-primary cs-btn" onclick="location.href='StudyRoomModifyForm.room?SRID='+<%=srId%>">수정</button>
							<button type="button"  class="btn btn-default cs-btn" id="deleteBtn">삭제</button>
						</div>
					</c:if>
			</c:forEach>
		</form>
	</div>	
	<div class="col-xs-2"></div>
</div>
<div class="row">
	<div class="col-xs-2"></div>
	<div class="col-xs-7">
<!-- 		<dl>
			<dt>댓글</dt>
			<dd><textarea rows="5" cols="60"></textarea></dd>
			<dd><button class="btn btn-primary cs-btn">댓글남기기</button></dd>
		</dl> -->
	</div>
	<div class="col-xs-2">
	<div class="list">
	<button type="button" class="btn btn-primary cs-btn" onclick="location.href='StudyRoomMain.room'">목록으로</button>
</div>
	</div>
</div>
<br><br><br>
<%-- <div class="paging">
	<span>
		<a href="StudyRoomView.room?SRID=<%=srId1%>">다음글</a><br>
		<strong>현재글 : 으아아아아악</strong><br>
		<a href="StudyRoomView.room?SRID=<%=srId2%>">이전글</a><br>
	</span>	
</div> --%>


<c:import url="/WEB-INF/jsp/import/copyright.jsp"></c:import>



</body>
</html>