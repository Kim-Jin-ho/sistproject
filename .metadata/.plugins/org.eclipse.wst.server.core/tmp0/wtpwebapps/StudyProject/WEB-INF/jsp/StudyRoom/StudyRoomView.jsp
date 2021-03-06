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
   <link rel="stylesheet" href="<%=cp%>/css/StudyRoomView.css">
   
   
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
       
       // 게시글 추천 버튼 클릭시
       $("#recommend").click(function() 
       {
          // 로그인 상태가 아니라면 로그인 페이지로 이동
         if ($("#hidden1").val() == "")
            jQuery(location).attr("href","login_form.room");
         // 이미 추천한 게시물 이라면
         else if($("#hidden3").val() >= 1)
            alert("추천한 게시물 입니다.");
         // 작성자와 같은 유저라면
         else if($("#hidden1").val() == $("#hidden2").val())
             alert("작성자는 추천 및 신고를 할 수 없습니다.");
         // 작성자가 아니라면
          else
          {
             $.post("StudyRoomViewRecommendAjax.room", {num : <%=srId %>, recommendList : $("#recommendList").val()}, function(data) 
             {
                 $("#recommend").html(data);
                });   
               document.getElementById("hidden3").value = $("#hidden3").val() + 1;
               alert("추천 하였습니다.");
          }
      });
       
       // 신고 버튼 클릭시
       $("#report").click(function() 
       {
          // 로그인 상태가 아니라면 로그인 페이지로 이동
         if ($("#hidden1").val() == "")
            jQuery(location).attr("href","login_form.room");
         // 이미 신고한 게시물 이라면
         else if($("#hidden4").val() >= 1)
            alert("신고한 게시물 입니다.");
          // 작성자와 같은 유저라면
         else if($("#hidden1").val() == $("#hidden2").val())
             alert("작성자는 추천 및 신고를 할 수 없습니다.");
          // 작성자가 아니라면
          else
          {
             $.post("StudyRoomViewReportAjax.room", {num : <%=srId %>}, function(data) 
            {
                  $("#report").html(data);
               });   
             document.getElementById("hidden4").value = $("#hidden4").val() + 1;
             alert("신고 하였습니다.");
          }
      });
       
       // 댓글 등록 이벤트
       $("#insert").click(function() 
       {
         // 로그인 상태가 아니라면 로그인 페이지로 이동
         if ($("#hidden1").val() == "")
            jQuery(location).attr("href","login_form.room");
         else if ($("#srcontent").val() != "")
         {
            $("#form").attr("action", "StudyRoomViewInsert.room");
            var f = document.getElementById("form");
            f.submit();
         }
         else if ($("#srcontent").val() == "")
         {
            alert("댓글 내용을 입력하지 않았습니다.");
         }
      });
       
       // 댓글 삭제 이벤트
       $(".delete").click(function() 
       {
          $("#hidden6").attr("value", $(this).attr("data-scid"));
          //document.getElementById("hidden6").value = $("#delete").attr("data-scid");
         $("#form").attr("action", "StudyRoomViewDelete.room");
         var f = document.getElementById("form");
         f.submit();
      });
       
       // 댓글 수정 이벤트
       $(".update").click(function() 
       {
          $.post("StudyRoomViewUpdateAjax.room", {num : <%=srId %>, scId : $(this).attr("data-scid")}, function(data) 
         {
              $("#reple").html(data);
         });   
      });
       
       // Ajax 처리 후 이벤트처리
       $(document).on("click", ".updateBtn",function() 
       {
          $("#hidden6").attr("value", $(this).attr("data-scid"));
          $("#form").attr("action", "StudyRoomViewUpdate.room");
          var f = document.getElementById("form");
         f.submit();
      });
       
      // 리플 추천 버튼 클릭시
       $(".recommendBtn").click(function() 
       {
          // 로그인 상태가 아니라면 로그인 페이지로 이동
         if ($("#hidden1").val() == "")
            jQuery(location).attr("href","login_form.room");
         // 작성자와 같은 유저라면
         else if($("#hidden1").val() == $(this).attr("data-user"))
             alert("작성자는 추천을 할 수 없습니다.");
         // 작성자가 아니라면
          else
          {
             var id = $(this).attr("id");
             
             $("#hidden6").attr("value", $(this).attr("id"));
             $.post("StudyRoomViewRepleRecommendAjax.room", {scid : $("#hidden6").val()}, function(data) 
             {
                 $("#" + id).html(data);
                });   
               alert("추천 하였습니다.");
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
      <form class="form-group" method="post" id="form" name="form">
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
               <td class="text-left active" colspan="3   ">${viewList.shopNo }</td>
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
         
         <%-- 추천 영역 --%>
         <div id="centerButton">
            <!-- 접속자, 작성자, 추천여부, 신고여부, srid, scid -->
            <input type="hidden" id="hidden1" value="${nickname }">
            <input type="hidden" id="hidden2" value="${viewList.memBer}">
            <input type="hidden" id="hidden3" value="${recommendCheck}">
            <input type="hidden" id="hidden4" value="${reportCheck}">
            <input type="hidden" id="hidden5" name="srId" value="<%=srId%>">
            <input type="hidden" id="hidden6" name="scId">

            <select id="recommendList" name="recommendList">
               <c:set var="i" value="0"></c:set>
               <c:forEach var="list" items="${recommendList}">
                  <option value="${i + 1 }">${list }</option>
                  <c:set var="i" value="${i = i + 1 }"></c:set>
               </c:forEach>
            </select>
				<button type="button" id="recommend" class="btn btn-sm btn-primary">추천 ${recommend}</button>
				<button type="button" id="report" class="btn btn-sm btn-danger">신고 ${report}</button>
         </div>
         <%-- 추천 영역 --%>
         <hr>
         <%-- 리플 영역 --%>
         <div class="row" id="reple">
            <%-- 뷰 영역 --%>
               
               <c:forEach var="dto" items="${reList }">
                  <div>
                     <div class="col-xs-8">
                        ${dto.srwid} ${dto.srwdate } 
                     </div>
                     
                     <div class="col-xs-4" id="rightBtn">
                        <c:if test="${nickname == dto.srwid }">
                           <button type="button" class="update btn btn-sm btn-primary"" data-scid="${dto.scid }">수정</button>
                           <button type="button" class="delete btn btn-sm btn-danger" data-scid="${dto.scid }">삭제</button>
                        </c:if>
                        <button type="button" id="${dto.scid }" class="recommendBtn btn btn-sm btn-primary" data-user="${dto.srwid}">추천 ${dto.srscore }</button>
                     </div>
                     <div class="col-xs-12">
                        ${dto.srcontent}
                        <hr>
                     </div>
                     
                  </div>   
               </c:forEach>               
            
            <%-- 뷰 영역 --%>
            
            <%-- 작성 영역 --%>
               <div class="col-xs-11" id="write">
                  <span class="input-group-btn">
                     <textarea class="col-xs-10 form-control"  rows="5" placeholder="comment" id="srcontent" name="srcontent"></textarea>
                     <button id="insert" class="btn btn-success " style="height: 114px;" type="button">등록</button><i class="fa fa-edit spaceLeft"></i>
                  </span>
               </div>
            <%-- 작성 영역 --%>
         </div>
         <br><br>
         <%-- 리플 영역 --%>
               <c:if test="${nickname == viewList.memBer }">
                  <div class="text-center">
                     <button type="button" class="btn btn-primary cs-btn" onclick="location.href='StudyRoomModifyForm.room?SRID='+<%=srId%>">수정</button>
                     <button type="button" class="btn btn-default cs-btn" id="deleteBtn">삭제</button>
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
<!--       <dl>
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