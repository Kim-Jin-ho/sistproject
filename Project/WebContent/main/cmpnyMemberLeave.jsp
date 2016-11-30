<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
	String checkid = (String)session.getAttribute("checkid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=cp %>/css/hyuncss/bootstrap.css" rel="stylesheet">
<link href="<%=cp %>/css/font-awesome.min.css" rel="stylesheet">
<link href="<%=cp %>/css/hyuncss/main.css" rel="stylesheet">
<script src="<%=cp %>/js/mainjs/jquery.js"></script>
<script src="<%=cp %>/js/mainjs/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function()
{	
	if($('#submitbutton').val()=="1")
	{
		alert("회원탈퇴가 완료되었습니다.");
		//완료후 세션삭제 logoutcontroller.love 액션처리하기
	}
	if($('#submitbutton').val()=="0")
	{
		alert("비밀번호가 올바르지 않습니다.");
	}
	 
	$('#submitbutton').click(function() //정보수정 버튼을 눌렀을 경우에
	{
		if($("#password").val()==""){ //비밀번호가 공백일 경우엔
			$('#password_pw').html("※ 비밀번호를 입력해주세요.").css("color","red");
			return;	
		}	
		else
		{
			var checkcheck = confirm("정말 회원탈퇴를 하시겠습니까?");
			if(checkcheck==true)
				$('#cmpnymemberleave').submit();
			else
				return;
		}
	});		
});
</script>
</head>
<body>
	<!-- GNB 영역 -->
	<c:import url="${cp }/main/mainGnb.jsp"></c:import>
	
	<!-- 전체 폼 영역의 시작 -->		
	<div id="contents_wr" class="cmpnysesction"> 
		
		<!-- 기업메뉴영역 -->
		<c:import url="${cp }/company/CompanyMenu.jsp"></c:import>
		
		<!-- 부트스트랩 컨테이너 css 영역 -->
		<div class="container">
		
			<!-- 메뉴영역이후 마진LEFT를주기위한 class추가 선언 -->
			<div class="magincontainer">
			
			<!-- 메뉴소주제설명 -->
			<h5 style="color:red;">기업 회원 탈퇴</h5>
			<!-- PW 입력 -->
				<form action="<%=cp %>/cmpnymemberleave.love" class="form-horizontal" id="cmpnymemberleave">
					<h5>안전한 회원 탈퇴를 위하여 비밀번호를 다시한번 입력해 주세요.</h5>
					
					
					<!--  사업자번호는 세션으로 받아올꺼임 준환이형 페이지연결되면 임시로 3333333333  -->	
					<div class="form-group">
				    	<label for="text" class="col-md-3 control-label">사업자번호</label>
				    	<div class="col-md-8">
				      	<input type="text" class="form-control" name="cmpnyid" id="cmpnyid" value="<%=checkid %>" readonly="readonly">
				    	</div>
				    	<label class="control-label"><span id ="cmpnyid_id" class="check_css"></span></label>
				 	</div>				
				
					<!-- PW 입력 -->
					<div class="form-group">
					   	<label for="password" class="col-md-3 control-label">PASSWORD</label>
					    	<div class="col-sm-8">
					      	<input type="password" class="form-control" name="password" id="password" maxlength="16">
					    </div>
					    <label class="control-label"><span id = "password_pw" class="check_css"></span></label>
			  		</div>
				
					<div class="form-group">
				    	<label class="col-sm-4 control-label"></label>
				    	<div class="col-sm-1">
				      	<button type="button" id="submitbutton" class="btn btn-primary" value="${membercheck }">회원 탈퇴</button>
				    	</div>
			  		</div>	
				</form>
			</div>
		</div>
	</div>
	<!-- 메인풋터 영역 -->
    <c:import url="${cp }/main/footer.jsp"/>		
</body>
</html>