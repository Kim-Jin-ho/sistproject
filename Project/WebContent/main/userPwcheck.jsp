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
$(document).ready(function(){
	 if($('#submitbutton').val()=="1")
	{
	 alert("패스워드를 확인해 주세요.");
	}	
	$('#submitbutton').click(function() //정보수정 버튼을 눌렀을 경우에
	{
		if($('#password').val()==null||$('#password').val()=="")
		{
			alert ("비밀번호를 입력해주세요");
			return;
		}
		else
		{
			$('#userpwcheck').submit();
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

	<!-- PW 입력 -->
		<form action="<%=cp %>/userpwcheck.love" class="form-horizontal" id="userpwcheck">
			<div class="form-group">
			<label for="password" class="control-label">안전한 이용을위하여 비밀번호를 다시한번 입력해 주세요.</label>
			</div>
				
			<div class="form-group">
		    	<label for="text" class="col-sm-4 control-label">아이디</label>
		    	<div class="col-sm-8">
		      	<input type="text" class="form-control" name="id" id="id" value="<%=checkid %>">
		    	</div>
		 	</div>				
		
			<!-- PW 입력 -->
			<div class="form-group">
			   	<label for="password" class="col-sm-4 control-label">PW 입력 : </label>
			    	<div class="col-sm-8">
			      	<input type="password" class="form-control" name="password" id="password" maxlength="16">
			    </div>
	  		</div>
		
			<div class="form-group">
		    	<label class="col-sm-4 control-label"></label>
		    	<div class="col-sm-1">
		      	<button type="button" id="submitbutton" class="btn btn-primary" value="${userpwcheck }">정보 수정</button>
		    	</div>
	  		</div>	
		</form>
	</div>
</div>
	<!-- 메인풋터 영역 -->
    <c:import url="${cp }/main/footer.jsp"/>	
	
</body>
</html>