<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
	// 확인
	//System.out.println(cp);
%>
<!DOCTYPE html>
<html>
<head>
<title>스터디룸 정보</title>
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

/* 	function result(msg)
	{
		//sub()가 실행되면 결과 값을 가지고 와서 action 을 취해주는 callback 함수
		var sel = document.f.sel2;
		$("#sp1").html(msg); //innerHTML 을 이런 방식으로 사용함
		//id 는 $("#id")   name 의 경우 $("name") 으로 접근함
	} */
	$(document).ready(function()
	{
		$("#searchKey").change(function()
		{
			/* alert($("#searchKey").val()); */
			ajaxRequest1();
		})
	})
 	function ajaxRequest1()
	{
	   $.post("StudyRoomList.jsp", { "searchKey" : $("#searchKey").val() }, function(data)
	   {
	      $("#searchValue").html(data);   
	   });
	}  
/* 	
	function ajaxRequest()
	{
	   $.post("searchForm.room"	, { regionId : $("#region").val() }, function(data)
	   {
	      $("#submain").html(data);   
	   });
	}
	 */
	function sendIt()
	{
		var f = document.searchForm;
		var searchKey = $("#searchKey").val();
		
		var searchValue = $("#searchValue").val();
		if (searchKey=="")
		{
			f.action="StudyRoomMain.room"
		}
		else
		{
			f.action = "StudyRoomMain.room?searchKey="+searchKey+"&searchValue="+searchValue;	
		}
		
		f.submit();
	}
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
<%-- <div class="row">
	<div class="form-group col-xs-12">
	   <div class="">
	      <c:import url="navibar_nomember.jsp"></c:import>
	   </div>
	</div>
</div> --%>

<div class="row">
	<!-- 상위글 목록 부분 -->
	<div class="form-group col-sm-2"></div>
	<div class="form-group col-sm-8" >
		<div>
		<h3>상위 추천순</h3>
		<table class="table">
				<tr>
					<th style="text-align: center;" >글번호</th>
					<th style="text-align: center;">지역</th>
					<th style="text-align: center;">업체명</th>
					<th style="text-align: center; width: 300px;">방이름</th>
					<th style="text-align: center;">수용인원</th>
					<th style="text-align: center;">시간/일</th>
					<th style="text-align: center;">가격</th>
					<th style="text-align: center;">추천수</th>
					<th style="text-align: center;">닉네임</th>
					<th style="text-align: center;">조회</th>
					<th style="text-align: center;">작성일</th>
				</tr>
			<c:forEach var="SreBoard1" items="${studyApplyList1}">
				<tr style="text-align: center;">
					<td style="text-align: center;">${SreBoard1.rNum }</td>
					<td style="text-align: center;">${SreBoard1.locaTion }</td>
					<td style="text-align: center;">${SreBoard1.shopName }</td>
					<td style="text-align: center;"><a href="StudyRoomView.room?SRID=${SreBoard1.srId }">${SreBoard1.shopNo }</a></td>
					<td style="text-align: center;">${SreBoard1.inWon }</td>
					<td style="text-align: center;">${SreBoard1.dayHours } 당</td>
					<td style="text-align: center;">${SreBoard1.pricE2 } 원</td>
					<td style="text-align: center;">${SreBoard1.hnCount }</td>
					<td style="text-align: center;">${SreBoard1.hnHit }</td>
					<td style="text-align: center;">${SreBoard1.memBer }</td>
					<td style="text-align: center;">${SreBoard1.hnwDate }</td>
					<%-- 
					<td>${SreBoard.souNd }</td>
					<td>${SreBoard.yesNo }</td>
					<td>${SreBoard.wiFi }</td>
					<td>${SreBoard.conSent } 개</td>
					<td>${SreBoard.detailCon }</td>
					<td>${SreBoard.minTime }</td>
					 --%>
				</tr>
			</c:forEach>
		</table>
		</div>
	</div>
	<div class="form-group col-sm-2	"></div>
</div>

	<!--  -->
<div class="row">
	<div class="form-group col-xs-2" ></div>
	<div class="form-group col-xs-8">
		<div class="">		
			<!-- 스터디룸 목록 -->
			<table id="StudyRoomMain" class="table" >
				<tr style="text-align: center;">
					<th style="text-align: center;" >글번호</th>
					<th style="text-align: center;">지역</th>
					<th style="text-align: center;">업체명</th>
					<th style="text-align: center; width: 300px;">방이름</th>
					<th style="text-align: center;">수용인원</th>
					<th style="text-align: center;">시간/일</th>
					<th style="text-align: center;">가격</th>
					<th style="text-align: center;">추천수</th>
					<th style="text-align: center;">닉네임</th>
					<th style="text-align: center;">조회</th>
					<th style="text-align: center;">작성일</th>
					<!-- 	
					<th>방음</th>			
					<th>냉난방기유무</th>
					<th>wifi상태</th>
					<th>콘센트갯수</th>
					<th>상세내용</th>
					<th>최소이용시간</th>
					 -->
				</tr>
				<c:forEach var="SreBoard" items="${studyApplyList}">
					<tr style="text-align: center;">
						<td style="text-align: center;">${SreBoard.rNum }</td>
						<td style="text-align: center;">${SreBoard.locaTion }</td>
						<td style="text-align: center;">${SreBoard.shopName }</td>
						<td style="text-align: center;"><a href="StudyRoomView.room?SRID=${SreBoard.srId }">${SreBoard.shopNo }</a></td>
						<td style="text-align: center;">${SreBoard.inWon }</td>
						<td style="text-align: center;">${SreBoard.dayHours } 당</td>
						<td style="text-align: center;">${SreBoard.pricE2 } 원</td>
						<td style="text-align: center;">${SreBoard.hnCount }</td>
						<td style="text-align: center;">${SreBoard.hnHit }</td>
						<td style="text-align: center;">${SreBoard.memBer }</td>
						<td style="text-align: center;">${SreBoard.hnwDate }</td>
						<%-- 
						<td>${SreBoard.souNd }</td>
						<td>${SreBoard.yesNo }</td>
						<td>${SreBoard.wiFi }</td>
						<td>${SreBoard.conSent } 개</td>
						<td>${SreBoard.detailCon }</td>
						<td>${SreBoard.minTime }</td>
						 --%>
					</tr>
				</c:forEach>

			</table>
		</div>
	</div>
	<div class="form-group col-sm-3"></div>
</div>

<div class="row">
	<!-- 페이징 처리 부분 -->
	<div class="form-group col-sm-6"></div>
	<div class="form-group col-sm-3">
			<ul  class="pagination pagination-sm">
				${pageIndexList }
			</ul>
	</div>
	<div class="form-group col-sm-3"></div>
</div>	
	<div id="bbsList_header" class="form-group col-sm-6">
</div>

<footer>
    <div class="container">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <div class="footer_logo   wow fadeInUp animated">
                        <img src="images/logo.png" alt="">
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center   wow fadeInUp animated">
                    <div class="social">
                        <h2>Follow Me on Here</h2>
                        <ul class="icon_list">
                            <li><a href="http://www.facebook.com/abdullah.noman99"target="_blank"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="http://www.twitter.com/absconderm"target="_blank"><i class="fa fa-twitter"></i></a></li>
                            <li><a href=""><i class="fa fa-google-plus"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <div class="copyright_text   wow fadeInUp animated">
                        <p>&copy; brandy 2015.All Right Reserved By <a href="http://www.themeforest.net/user/thecodecafe"target="_blank">Code Cafe Team</a></p>
                        <p>Made with love for creative people.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
</body>
</html>