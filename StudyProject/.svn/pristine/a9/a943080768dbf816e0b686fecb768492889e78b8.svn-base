<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디룸 추가</title>
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

$(document).ready(function()
{
	//저장버튼 클릭시 form 전송
	$("#add").click(function()
	{
	
	    // 데이터 검사(누락된 입력값 검사) 후 submit 액션
	    if($("#shopName").val()=='')            
	    {
	       //$("#errMsg").css("display","inline")
	       alert("방 이름을 입력해주세요.");
	       $("#shopName").focus();
	    }
	    else if($('#tel').val()=='')            
	    {
	       alert("전화번호를 입력해주세요.");
	       $("#tel").focus();
	    }
	    else if($("#hour").val()=='')            
	    {
	       alert("영업시간을 입력해주세요.");
	       $("#hour").focus();
	    }
	    else if($("#p_id").val()=='' || $("#t_id").val()=='')            
	    {
	       alert("위치를 입력해주세요.");
	    }
	    else if($("#holiday").val()=='')            
	    {
	       alert("휴무일을 입력해주세요.");
	       $("#holiday").focus();
	    }
	    else if($("#roomCount").val()=='')            
	    {
	       alert("방 개 수를 입력해주세요.");
	       $("#roomCount").focus();
	    }
	    else if($("#yesno1").val()=='0')            
	    {
	       alert("흡연실 유무를 입력해주세요.");
	       $("#yesno1").focus();
	    }
	    else if($("#yesno2").val()=='0')            
	    {
	       alert("프린트 유무를 입력해주세요.");
	       $("#yesno2").focus();
	    }
	    //저장버튼 클릭시 form 전송
	    else 
	    {
	        $("#frm").submit();
	    }
	    
	});  
	
});	
	


</script>
</head>
<body>
<div class="container">
<div class="row text-center">
   <div class="form-group col-sm-2"></div>
   <div class="form-group col-sm-8 form-group-sm">
   <form id="frm" action="ShopAdd.room" method="post">
            <div class="row">
					<br>            
					
               		<table class="table table-hover">
	               		<tr>
		                    <td><strong>스터디룸명</strong></td> 
							<td><input type="text" class="form-control" id="shopName" name="shopName" placeholder="예) 구름방"> </td>
	                    </tr>
	                    <tr>
	                    	<td><strong>전화번호</strong></td> 
							<td><input type="text" class="form-control" id="tel" name="tel" placeholder="예) 02-1111-1111"> </td>
	                    </tr>
	                    <tr>
	                    	<td><strong>영업시간</strong></td> 
							<td><input type="text" class="form-control" id="hour" name="hour" placeholder="예) 09:00~20:00"> </td>
	                    </tr>
	                    <tr>
	                    	<td><strong>위치</strong></td> 
							<td><button type="button" id="map" class="btn btn-info btn-sm " name="map" onclick="javascript:window.open('StudyRoomCreateMap.room','지도','width=400,height=550,left=500,top=120')">지도보기</button></td>
	                    </tr>
	                    <tr>
	                    	<td><strong>휴무일</strong></td> 
							<td><input type="text" class="form-control" id="holiday" name="holiday" placeholder="예) 매주 월요일"> </td>
	                    </tr>
	                    <tr>
	                    	<td><strong>방 개 수</strong></td> 
							<td><input type="text" class="form-control" id="roomCount" name="roomCount" placeholder="예) 10"> </td>
	                    </tr>
	                    <tr>
	                    	<td><strong>흡연실 유무</strong></td> 
							<td>
								<select name="yesno1" class="form-control">
									<option value="1">있음</option>
									<option value="2">없음</option>
								</select>
							</td>
	                    </tr>
	                    <tr>
	                    	<td><strong>프린트 유무</strong></td> 
							<td>
								<select name="yesno2" class="form-control">
									<option value="1">있음</option>
									<option value="2">없음</option>
									<option value="3">고장</option>
								</select>
							</td>
	                    </tr>
                     
         
         		  </table>
                  </div>
                  
           <div class="row">
               <div class="col-sm-12 text-center">
                  <button type="button" class="btn btn-success" id="add" name="add">확인</button>
						<button type="reset" class="btn btn-danger" onclick="window.close();">취소</button>
					</div>
            </div>
            
		   <!-- 좌표 찍는 값 -->
		   <input type="text" id="p_id" name="p_id" value="" hidden="" >
		   <input type="text" id="t_id" name="t_id" value="" hidden="">
		</form>        
         </div>
                     
   </div>
   
</div>
</body>
</html>