<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
   // 확인
   //System.out.println(cp);
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



    <!-- Style -->

    <!-- Responsive CSS -->
    <!-- <link href="css/responsive.css" rel="stylesheet"> -->
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="js/lte-ie7.js"></script>
     <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
     <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
   <![endif]-->
<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript" src="<%=cp %>/js/HuskyEZCreator.js" charset="utf-8"></script>

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

      
      //저장버튼 클릭시 form 전송
      $("#save").click(function()
      {
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
            
      <form id="frm" action="StudyRoomInsert.room" method="post" >
         <div class="form-group">
            <div class="row">
               <div class="form-group">
            
                     <label class="col-sm-2 text-right">방이름</label> 
                     <div class="col-sm-9">
                        <div class="form-group">
                           <input type="text" id="title" name="title" class="form-control" placeholder="방 제목을 입력하세요"/>
                           <!-- 지도 좌표 찍기
                                아래 text 박스 안에 지도 클릭 시 좌표가 나옴, hidden 속성 없에야 보임.   
                            -->   
                           <!-- <span class="input-group-btn">
                              <button class="btn btn-success btn-sm" type="button" id="map">주소 검색<i class="fa fa-edit spaceLeft"></i>
                              </button>
                           </span> -->
                        </div>
                     </div>
                  </div>
            </div>
            
      
            <div class="row">
               <label class="col-sm-2 text-right">지역</label> 
               <div class="col-sm-9">   
                  <select name="location" class="form-control">
                     <option value="1">서울</option>
                     <option value="2">경기</option>
                     <option value="3">인천</option>
                     <option value="4">충청북도</option>
                     <option value="5">충청남도</option>
                     <option value="6">전라북도</option>
                     <option value="7">전라남도</option>
                     <option value="8">강원도</option>
                     <option value="9">경상남도</option>
                     <option value="10">경상북도</option>
                     <option value="11">제주도</option>   
                  </select>
               </div>
            </div>
            <div class="row">
               <label class="col-sm-2 text-right">업체명</label>
               <div class="col-sm-9">   
                  <select name="shopId" class="form-control">
                  <c:forEach var="shop" items="${list }">
                     <option value="${shop.shopId}">${shop.shopName}</option>
                  </c:forEach>                     
                  </select>                  
               </div>
            </div> 
            
            <div class="row">
               <label class="col-sm-2 text-right">시간/일</label>
               <div class="col-sm-3 text-right">
                  <input type="radio" value="2" name="timeCheck" checked="checked">시간
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="radio" value="1" name="timeCheck">일
               </div>
               <label class="col-sm-3 text-right">가&nbsp;격</label>
               <div class="col-sm-3 text-right">
                  <input type="text" name="price" class="form-control"onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;" maxlength=10 value="0">
               </div>
            </div>
            <div class="row">
               <label class="col-sm-2 text-right">수용인원</label>
               <div class="col-sm-9">
                  <input type="text" name="inwon" placeholder="0" value="0" class="form-control"></div>            
               </div>
            <div class="row">
               <label class="col-sm-2 text-right">최소이용시간</label>
               
               <div class="col-sm-9"><select name="minTime" class="form-control">
                     <option value="1">1시간</option>
                     <option value="2">2시간</option>
                     <option value="3">3시간</option>
                     <option value="4">4시간</option>
                     <option value="5">5시간</option>
                     <option value="6">6시간</option>
                     <option value="7">7시간</option>
                     <option value="8">8시간</option>
                     <option value="9">9시간</option>
                     <option value="10">10시간</option>
                     <option value="11">영업시간동안</option>
                  </select>
               </div>
            </div>
            <div class="row">
               <label class="col-sm-2 text-right">콘센트</label>
         
               <div class="col-sm-9"><select name="consent" class="form-control">
                     <option value="9">없음</option>
                     <option value="1">1개</option>
                     <option value="2">2개</option>
                     <option value="3">3개</option>
                     <option value="4">4개</option>
                     <option value="5">5개</option>
                     <option value="6">6개</option>
                     <option value="7">7개</option>
                     <option value="8">8개</option>
                     
                  </select>
               </div>
            </div>
            <div class="row">
               <label class="col-sm-2 text-right">방음상태</label>
               <div class="col-sm-9"> 
                  <div class="row">
                  <div class="col-sm-4"><input type="radio" value="1" name="noiseCheck" checked="checked">안들림</div>
                  <div class="col-sm-4"><input type="radio" value="2" name="noiseCheck">속삭이는 정도</div>
                  <div class="col-sm-4"><input type="radio" value="3" name="noiseCheck">정확히 들림</div>
                  </div>
                  
               </div>
            </div>
            <div class="row">
               <label class="col-sm-2 text-right">WIFI</label>
               <div class="col-sm-9">
                  <div class="row">
                  <div class="col-sm-2"><input type="radio" value="1" name="wifiCheck" checked="checked">최상</div>
                  <div class="col-sm-2"><input type="radio" value="2" name="wifiCheck">좋음</div>
                  <div class="col-sm-2"><input type="radio" value="3" name="wifiCheck">보통</div>
                  <div class="col-sm-2"><input type="radio" value="4" name="wifiCheck">나쁨</div>
                  <div class="col-sm-2"><input type="radio" value="5" name="wifiCheck">없음</div>
                  <div class="col-sm-2"></div>
                   </div>
               </div>
               <div class="col-sm-3"></div>
               <div class="col-sm-3"></div>
            </div>
            <div class="row">
               <label class="col-sm-2 text-right">냉난방기 유무</label>
               <div class="col-sm-9">
                  <div class="row">
                  <div class="col-sm-4"><input type="radio" value="1" name="yesnoCheck" checked="checked">있음</div>
                  <div class="col-sm-4"><input type="radio" value="2" name="yesnoCheck">없음</div>
                  <div class="col-sm-4"><input type="radio" value="3" name="yesnoCheck">고장</div>
                  </div>
               </div>      
            </div>
            <div class="row">
               
               <div class="col-sm-12">
               <br>
                  <textarea rows="10" id="ir1" name="content" style="width:720px; height:350px; "></textarea>               
               </div>
               
            </div>
            
            <div class="row">
               <div class="col-sm-12 text-center">
                  <button type="button" class="btn btn-primary" id="save">글쓰기</button>
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