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
<link href="<%=cp %>/css/hyuncss/bootstrap.min.css" rel="stylesheet">
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
			$('#usermemberleave').submit();
			else
			return;
		}
	});		
});
</script>
</head>
<body>
	<!-- GNB 영역 -->
	<c:import url="${cp }/main/mainGnb.jsp"/>
	
	<!-- 메인 메뉴영역 -->
    <c:import url="${cp }/main/mainMenu.jsp"/>
	
	<hr style="border: solid 1px red">
	
	<div class="containersection">
	
	<div class="container">
		<c:import url="${cp }/user/UserMenu.jsp"/>
	
		<h5>정보 수정</h5>
		
	<!-- ↑ 여기까지 공통으로 가져가야할 내용 -->	

		<form action="<%=cp %>/usermemberleave.love" class="form-horizontal" id="usermemberleave">
			<div class="form-group">
			<label for="text" class="scontrol-label">안전한 회원 탈퇴를 위하여 비밀번호를 다시한번 입력해 주세요.</label>
			</div>
			
			<!--  사업자번호는 세션으로 받아올꺼임 준환이형 페이지연결되면 임시로 3333333333  -->	
			<div class="form-group">
		    	<label for="text" class="col-sm-4 control-label">아이디 : </label>
		    	<div class="col-sm-8">
		      	<input type="text" class="form-control" name="id" id="id" value="<%=checkid %>" readonly="readonly">
		    	</div>
		 	</div>				
		
			<!-- PW 입력 -->
			<div class="form-group">
			   	<label for="password" class="col-sm-4 control-label">PW 입력 : </label>
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
	<!-- 메인풋터 영역 -->
    <c:import url="${cp }/main/footer.jsp"/>	
</body>
</html>