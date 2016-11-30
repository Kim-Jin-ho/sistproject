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
<link href="<%=cp %>/css/hyunseokcss/usermain.css" rel="stylesheet">
<script src="<%=cp %>/js/mainjs/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function()
{	
	
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
			$('#cmpnypwcheck').submit();
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
		
		<!-- 메뉴영역이후 마진LEFT를주기위한 class추가 선언 -->
		<div class="magincontainer">
		<!-- 메뉴소주제설명 -->
		<h5  style="color:red;">기업정보수정</h5>
			<!-- PW 입력 -->
			<form action="<%=cp %>/cmpnypwcheck.love" class="form-horizontal" id="cmpnypwcheck">
			
			
			<div class="form-group">
			<label for="password" class="control-label">안전한 이용을위하여 비밀번호를 다시한번 입력해 주세요.</label>
			</div>
				
			<div class="form-group">
		    	<label for="text" class="col-sm-4 control-label">사업자번호</label>
		    	<div class="col-sm-8">
		      	<input type="text" class="form-control" name="cmpnyid" id="cmpnyid" value="<%=checkid %>" readonly="readonly">
		    	</div>
		 	</div>				
		    
			<div class="form-group">
			   	<label for="password" class="col-sm-4 control-label">PW 입력 : </label>
			    	<div class="col-sm-8">
			      	<input type="password" class="form-control" name="password" id="password" maxlength="16">
			    </div>
	  		</div>
		
			<div class="form-group">
		    	<label class="col-sm-4 control-label"></label>
		    	<div class="col-sm-1">
		      	<button type="button" id="submitbutton" class="btn btn-primary" value="${cmpnypwcheck }">정보 수정</button>
		    	</div>
	  		</div>	
			</form>
		</div>
	</div>		
			
	<!-- 메인풋터 영역 -->
    <c:import url="${cp }/main/footer.jsp"/>	
</body>
</html>