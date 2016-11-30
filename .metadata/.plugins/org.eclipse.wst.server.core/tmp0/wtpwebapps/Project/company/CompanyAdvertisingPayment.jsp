<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업_상품관리2(EnterprisePayment.jsp)</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/company/jquery.countdownTimer.js"></script>

<script type="text/javascript">

	var randomA;

	
	/* 휴대폰번호 숫자만 입력가능하게 */
	function showKeyCode(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;

		if( ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 ) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9)
		{
			return;
		}
		else
		{
			return false;
		}
	}

	
	/* 인증번호 */
	   /* 인증번호 */
   $(document).ready(function(){
       $("#randomNum").click(function(){
          

         
          if ($("#phoneNum1").val()!="" && $("#phoneNum2").val()!="") 
         {
            /* 인증번호 난수발생 */
            randomA = Math.floor(Math.random()*1000000)+100000;
            if(randomA > 1000000)
               randomA = randomA - 100000;
            
            alert(randomA); //test   
             
            $("#ms_timer").countdowntimer({
               minutes : 3,
                 /* seconds : 10, */
               size : "lg",
                 timeUp : timeIsUp 
            }); 
            
         }
          
          else 
          {
             alert("휴대폰번호를 입력해주세요.");
          }
          
       });
   });
	
	
	
	

	/* 인증번호가 일치하고(O) agree1, agree2 모두 체크 시 결제 완료 */
	$(document).ready(function(){
	    $("#test").click(function(){
	        //alert($("#inputNum").val());	
	        //alert(randomA);
	        

        
        if ($("#inputNum").val()==randomA && $('input:checkbox[name=chk1]').is(':checked') && $('input:checkbox[name=chk2]').is(':checked')) 
        {
        	location.href="payFinish.jsp";
		}
        else if ($("#inputNum").val()!=randomA) 
        {
        	alert("인증번호가 일치하지 않습니다.");
		}
        else 
        {
        	alert("약관동의가 필요합니다.");
		}
	
    
	    	
	    	
	    });
	});

	
	
	/* 상세보기팝업창 이동 */
	function goPopup() 
	{ 
		 window.open('CompanyPay_agree.jsp', 'CLIENT_WINDOW2','resizable=yes scrollbars=yes width=424 height=404');
	} 
	
	
	

	
	
	function timeIsUp(){
		 alert('인증시간이 만료되었습니다.');
		 randomA = "";
	}
	
	

</script>
</head>
<body>

	<div id="wrap">
		<%-- 전체 틀 --%>

		<div id="container">
			<%-- 내용 --%>

			<div>
				결제상품 [ ]<br> 결제금액 [15000]원<br> 결제일시 [2016-05-18]<br> <br>
			</div>

			<div>
				휴대폰번호 <select>
					<option>010</option>
					<option>011</option>
					<option>016</option>
					<option>017</option>
					<option>018</option>
					<option>019</option>
				</select> - <input type="text" id="phoneNum1" onkeydown="return showKeyCode(event)" maxlength="4" style="width: 50px;"> 
				- 
				<input type="text" id="phoneNum2" onkeydown="return showKeyCode(event)" maxlength="4" style="width: 50px;">
				<button type="button" id="randomNum">인증번호요청</button><br>
				인증번호 입력 <input type="text" id="inputNum" onkeydown="return showKeyCode(event)">

				<!-- 인증번호 카운트다운 -->
				<span id="ms_timer"></span>
			</div>

			<input type="checkbox" id="agree1" name="chk1">개인정보 수집 및 제공 동의하기<button type="button" onclick="goPopup();">상세보기</button><br> 
			<input type="checkbox" id="agree2" name="chk2">위 상품의 구매조건을 확인했고, 결제진행에 동의합니다.<br>

			<button type="button" id="test">결제</button>
			<button type="button" onclick="window.close();">취소</button>

		</div>


	</div>


</body>
</html>