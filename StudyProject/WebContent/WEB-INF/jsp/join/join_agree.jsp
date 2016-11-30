<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript">
   
   $(document).ready(function()
   {
      $('#agree1').click(function()
      {
         if ($('input:checkbox[id="agree1"]').is(":checked")==true && $('input:checkbox[id="agree2"]').is(":checked")==true)
         {
            $('#allAgree').prop('checked', true);
            $('#errorMsg').hide();
         }
         else if ($('input:checkbox[id="agree1"]').is(":checked")==false || $('input:checkbox[id="agree2"]').is(":checked")==false)
         {
            $('#allAgree').prop('checked', false);
         }
      });         
      
      
      $('#agree2').click(function()
      {
         if ($('input:checkbox[id="agree1"]').is(":checked")==true && $('input:checkbox[id="agree2"]').is(":checked")==true)
         {
            $('#allAgree').prop('checked', true);
            $('#errorMsg').hide();
         }
         else if ($('input:checkbox[id="agree1"]').is(":checked")==false || $('input:checkbox[id="agree2"]').is(":checked")==false)
         {
            $('#allAgree').prop('checked', false);
         }
      });   
      
      
      $('#allAgree').click(function()
      {         
         $('#agree1').prop('checked', this.checked);
         $('#agree2').prop('checked', this.checked);   
         $('#errorMsg').hide();
      });
      
         
      
      $('#gogo').click(function()            
      {
         if ($('input:checkbox[id="agree1"]').is(":checked")==false || $('input:checkbox[id="agree2"]').is(":checked")==false)
         {            
            if( $('#errorMsg').css('display')=='none')
            {   
               $('#errorMsg').show();
            }
            else
            {   
               $('#errorMsg').hide();
            }            
         }      
         
         if ($('input:checkbox[id="agree1"]').is(":checked")==true && $('input:checkbox[id="agree2"]').is(":checked")==true)
         {
            $('#gotojoinform').submit();
         }
         
      });   
      
      
   });
      
   


</script>


</head>
<body>


<div class="row">
   <div class="form-group col-xs-12">
      <div class="">
         <c:import url="/WEB-INF/jsp/StudyRoom/StudyRoomTop.jsp"></c:import>
      </div>
   </div>
</div>
<br><br><br><br>



<div style="margin: 0 auto; width: 400px;">
<div>
   <h3>이용약관</h3>   
</div>

<form action="JoinForm.room" id="gotojoinform" method="post">   
   <!-- 사이트 이용약관 -->
   <div>
<textarea rows="8" cols="50" style="resize:none; overflow-y:scroll" class="form-control" >제 1조 (목적) 
본 약관은 (주)"STUDYROOM"(이하 "회사"라 칭함)이 제공하는 모든 서비스 
(이하 "서비스"라 칭함)의 이용조건, 절차, 회원과 회사의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
제 2조 (약관의 효력과 변경)
1. 회사는 회원이 본 약관에 동의하는 조건으로 회원에게 서비스를 제공할 것이며, 회원이 본 약관의 내용에 동의하는 경우, 회사의 서비스 제공 행위 및 회원의 서비스 사용 행위에는 본 약관이 우선적으로 적용됩니다.
2. 회사는 본 약관을 사전 고지 없이 변경할 수 있으며, 변경된 약관은 회사 사이트 내에 게시하여 회원이 직접 확인 할 수 있도록 하고, 회원이 변경된 약관에 동의하지 아니하는 경우, 회원은 본인의 회원등록을 취소(회원탈퇴)할 수 있습니다.
계속 사용의 경우는 약관 변경에 대한 동의로 간주됩니다.
변경된 약관은 회사 사이트에 게시함과 동시에 그 효력이 발생됩니다. 
제 3조 (약관 외 준칙)
1. 본 약관은 회사가 제공하는 서비스에 관한 이용규정 및 별도 약관과 함께 적용됩니다. 
2. 본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신 윤리위원회 심의규정, 정보통신 윤리강령, 프로그램 보호법 및 기타관련 법령의 규정에 의합니다. 
제 4조 (이용 계약의 성립)
1. 이용계약은 신청자가 온라인으로 회사 소정의 가입신청 양식에서 요구하는 사항을 기록하여 가입을 완료 하는 것으로 성립됩니다. 
2. 회사는 다음 각 호에 해당하는 이용계약에 대하여는 가입을 취소할 수 있습니다. 
1) 이용 계약 신청서의 내용을 허위로 기재하였거나 허위서류를 첨부하여 신청하였을 때? 
2) 사회의 안녕 질서 혹은 미풍양속을 저해할 목적으로 신청하거나 그러한 행위를 하였을 때? 
3) 다른 사람의 회사서비스 이용을 방해하거나 그 정보를 도용하는 등의 행위를 하였을 때? 
4) 전기통신기본법, 전기통신사업법, 정보통신 윤리위원회 심의규정, 정보통신 윤리 강령, 프로그램 보호법 및 기타관련 법령과 본 약관이 금지하는 행위를 하는 경우? 
제 5조 (회원정보 사용에 대한 동의) 
1. 회원의 개인정보에 대해서는 회사의 개인정보 보호정책이 적용됩니다. 
2. 회사의 회원 정보는 다음과 같이 수집, 사용, 관리, 보호됩니다. 
1) 개인정보의 수집 : 회사는 회원의 회사 서비스 가입 시 회원이 제공하는 정보, 커뮤니티 활동을 위하여 회원이 제공하는 정보, 각종 이벤트 참가를 위하여 회원이 제공하는 정보, 광고나 경품의 취득을 위하여 회원이 제공하는 정보 등을 통하여 귀하에 관한 정보를 수집합니다. 
2) 개인정보의 사용 : 회사는 회사 서비스 제공과 관련해서 수집된 회원의 신상정보를 본인의 승락 없이 제3자에게 누설, 배포하지 않습니다. 단, 아래 경우에는 그러하지 않습니다. 
① 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우? 
② 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우 
③ 회원이 회사에 제공한 개인정보를 스스로 공개한 경우? 
3) 개인정보의 관리 : 회원은 개인정보의 보호 및 관리를 위하여 서비스의 개인정보관리에서 수시로 회원의 개인정보를 수정/삭제할 수 있습니다. 수신되는 정보 중 불필요하다고 생각되는 부분도 변경/조정할 수 있습니다. 
4) 개인정보의 보호 : 회원의 개인정보는 오직 귀하만이 열람/수정/삭제 할 수 있으며,? 이는 전적으로 회원의 ID와 비밀번호에 의해 관리되고 있습니다. 따라서 타인에게 본인의 ID와 비밀번호를 알려주어서는 아니 되며, 작업 종료 시에는 반드시 로그아웃 해 주시고, 웹 브라우저의 창을 닫아 주시기 바랍니다. 
제 6조 (사용자의 정보 보안)
1. 가입 신청자가 회사 서비스 가입 절차를 완료하는 순간부터 회원은 입력한 정보의 비밀을 유지할 책임이 있으며, 회원의 ID와 비밀번호를 사용하여 발생하는 모든 결과에 대한 책임은 회원본인에게 있습니다. 
2. 회원ID와 비밀번호에 관한 모든 관리의 책임은 회원에게 있으며, 회원의 회원ID나 비밀 번호가 부정하게 사용되었다는 사실을 발견한 경우에는 즉시 회사에 신고하여야 합니다. 신고를 하지 않음으로 인한 모든 책임은 회원 본인에게 있습니다. 
3. 회원은 회사 서비스의 사용 종료 시 마다 정확히 접속을 종료하도록 해야 하며, 정확히 종료하지 아니함으로써 제3자가 귀하에 관한 정보를 이용하게 되는 등의 결과로 인해 발생하는 손해 및 손실에 대하여 회사는 책임을 부담하지 아니합니다. 
제 7조 (서비스의 변경 및 해지)
1. 회사는 회원이 서비스를 이용하여 기대하는 손익이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않으며, 회원이 본 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다. 
2. 회사는 서비스 이용과 관련하여 가입자에게 발생한 손해 중 가입자의 고의, 과실에 의한 손해에 대하여 책임을 부담하지 아니합니다. 
제 8조 (회사에 제출된 게시물의 저작권)
1. 회원이 게시한 게시물의 내용에 대한 권리와 책임은 회원에게 있습니다. 
2. 회사는 게시된 내용을 사전 통지 없이 편집, 이동 할 수 있는 권리를 보유하며, 다음의 경우 사전 통지 없이 삭제 할 수 있습니다. 
1) 본 서비스 약관에 위배되거나 상용 또는 불법, 음란, 저속하다고 판단되는 게시물을 게시한 경우? 
2) 다른 회원 또는 제 3자를 비방하거나 중상 모략으로 명예를 손상시키는 내용인 경우 
3) 공공질서 및 미풍양속에 위반되는 내용인 경우? 
4) 범죄적 행위에 결부된다고 인정되는 내용일 경우? 
5) 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우? 
6) 기타 관계 법령에 위배되는 경우? 
3. 회원의 게시물이 타인의 저작권을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 회원이 부담하여야 합니다. 
제 9조 (정보 제공 및 광고의 게재)
1. 회사는 서비스의 운영 및 정보제공과 관련하여 서비스 되는 각종 페이지들에 영리목적의 광고 등을 게재할 수 있습니다. 
2. 회사는 앞 항의 내용에 따라 게재된 광고 판촉활동에 회원이 참여하거나 거래의 결과로서 발생하는 모든 손실 또는 손해에 대해 책임을 지지 않습니다.
</textarea>
   </div>   
      
   <!-- 사이트 이용약관 동의 체크박스 -->
   <div>
      <input type="checkbox" class="chk" id="agree1" name="agree1" onclick="">
         <label for="agree1">사이트 이용약관 동의</label>      
   </div>
   
   
   <!-- 개인정보 수집 및 이용애 대한 안내 -->
   <div>
<textarea rows="8" cols="50" style="resize:none; overflow-y:scroll" class="form-control" >제 1조 (회원정보 사용에 대한 동의) 
1. 회원의 개인정보에 대해서는 회사의 개인정보 보호정책이 적용됩니다. 
2. 회사의 회원 정보는 다음과 같이 수집, 사용, 관리, 보호됩니다. 
1) 개인정보의 수집 : 회사는 회원의 회사 서비스 가입 시 회원이 제공하는 정보, 커뮤니티 활동을 위하여 회원이 제공하는 정보, 각종 이벤트 참가를 위하여 회원이 제공하는 정보, 광고나 경품의 취득을 위하여 회원이 제공하는 정보 등을 통하여 귀하에 관한 정보를 수집합니다. 
2) 개인정보의 사용 : 회사는 회사 서비스 제공과 관련해서 수집된 회원의 신상정보를 본인의 승락 없이 제3자에게 누설, 배포하지 않습니다. 단, 아래 경우에는 그러하지 않습니다. 
① 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우? 
② 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우 
③ 회원이 회사에 제공한 개인정보를 스스로 공개한 경우? 
3) 개인정보의 관리 : 회원은 개인정보의 보호 및 관리를 위하여 서비스의 개인정보관리에서 수시로 회원의 개인정보를 수정/삭제할 수 있습니다. 수신되는 정보 중 불필요하다고 생각되는 부분도 변경/조정할 수 있습니다. 
4) 개인정보의 보호 : 회원의 개인정보는 오직 귀하만이 열람/수정/삭제 할 수 있으며,? 이는 전적으로 회원의 ID와 비밀번호에 의해 관리되고 있습니다. 따라서 타인에게 본인의 ID와 비밀번호를 알려주어서는 아니 되며, 작업 종료 시에는 반드시 로그아웃 해 주시고, 웹 브라우저의 창을 닫아 주시기 바랍니다. 
제 2조 (사용자의 정보 보안)
1. 가입 신청자가 회사 서비스 가입 절차를 완료하는 순간부터 회원은 입력한 정보의 비밀을 유지할 책임이 있으며, 회원의 ID와 비밀번호를 사용하여 발생하는 모든 결과에 대한 책임은 회원본인에게 있습니다. 
2. 회원ID와 비밀번호에 관한 모든 관리의 책임은 회원에게 있으며, 회원의 회원ID나 비밀 번호가 부정하게 사용되었다는 사실을 발견한 경우에는 즉시 회사에 신고하여야 합니다. 신고를 하지 않음으로 인한 모든 책임은 회원 본인에게 있습니다. 
3. 회원은 회사 서비스의 사용 종료 시 마다 정확히 접속을 종료하도록 해야 하며, 정확히 종료하지 아니함으로써 제3자가 귀하에 관한 정보를 이용하게 되는 등의 결과로 인해 발생하는 손해 및 손실에 대하여 회사는 책임을 부담하지 아니합니다. 
제 3조 (서비스의 변경 및 해지)
1. 회사는 회원이 서비스를 이용하여 기대하는 손익이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않으며, 회원이 본 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다. 
2. 회사는 서비스 이용과 관련하여 가입자에게 발생한 손해 중 가입자의 고의, 과실에 의한 손해에 대하여 책임을 부담하지 아니합니다. 
제 4조 (회사에 제출된 게시물의 저작권)
1. 회원이 게시한 게시물의 내용에 대한 권리와 책임은 회원에게 있습니다. 
2. 회사는 게시된 내용을 사전 통지 없이 편집, 이동 할 수 있는 권리를 보유하며, 다음의 경우 사전 통지 없이 삭제 할 수 있습니다. 
1) 본 서비스 약관에 위배되거나 상용 또는 불법, 음란, 저속하다고 판단되는 게시물을 게시한 경우? 
2) 다른 회원 또는 제 3자를 비방하거나 중상 모략으로 명예를 손상시키는 내용인 경우 
3) 공공질서 및 미풍양속에 위반되는 내용인 경우? 
4) 범죄적 행위에 결부된다고 인정되는 내용일 경우? 
5) 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우? 
6) 기타 관계 법령에 위배되는 경우? 
3. 회원의 게시물이 타인의 저작권을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 회원이 부담하여야 합니다. 
제 9조 (정보 제공 및 광고의 게재)
1. 회사는 서비스의 운영 및 정보제공과 관련하여 서비스 되는 각종 페이지들에 영리목적의 광고 등을 게재할 수 있습니다. 
2. 회사는 앞 항의 내용에 따라 게재된 광고 판촉활동에 회원이 참여하거나 거래의 결과로서 발생하는 모든 손실 또는 손해에 대해 책임을 지지 않습니다.
</textarea>
   </div>
   
   
   <!-- 개인정보 수집 동의 체크박스 -->
   <div>
      <input type="checkbox" class="chk" id="agree2" name="agree2" onclick="">
         <label for="agree2">사이트 이용약관 동의</label>      
   </div>
   
   
   
   <!-- 사이트이용약관, 개인정보수집 모두 동의 -->
   
      <div>
         <input type="checkbox" class="chk" id="allAgree" name="allAgree" onclick="" value="1">
         <label for="agree3">모두 동의</label>
      </div>   
   
   
   <!-- span tag -->
   <br>
   <span id="errorMsg" class="error" style="display:none; color: red"> [사이트 이용약관]과 [개인정보 수집 및 이용에 대한 안내] 모두 동의해주세요. </span>
   
   
   <!-- 동의, 취소 버튼 -->
   <div class="aTags text-center">
      <button type="button" id="gogo" class="btn btn-primary ">동의</button>
      <button type="button" id="gogo" class="btn btn-default">취소</button>
   </div>
</form>
</div>


<br><br><br><br><br><br><br><br><br><br><br><br><br>


<c:import url="/WEB-INF/jsp/import/copyright.jsp"></c:import>


</body>
</html>