<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판 글 작성</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://bootswatch.com/paper/bootstrap.min.css" >
<link rel="stylesheet" href="http://bootswatch.com/paper/bootstrap.css" >
<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript">
	$(document).ready(function()
	{
		$("#1").css('color','gray')
		$("#1").css('text-decoration','underline')
	
		$("#createBtn").click(function()
		{
			if ($("#OpenTitle").val() =="")
			{
				alert("제목입력해라");
			}
			else if($("#contents").val() =="")
			{
				alert("내용입력해라");	
			}
		})
		$("#content").focus(function()
		{
			$("#content").val="";
		})
	});
	
	function Change(target,type)
	{
	 if (target.value == target.defaultValue && type==0) target.value = "";
	 if (!target.value && type==1) target.value = target.defaultValue;
	}
</script>
<script type="text/javascript">

var oEditors = [];
$(function()
		{

      	nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
          sSkinURI: "/StudyProject/SE2/SmartEditor2Skin.html",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             

              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     

              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
              }
          }, 
          fOnAppLoad : function()
          {
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              //oEditors.getById["ir1"].exec("PASTE_HTML", ["내용을 입력하세요. <br>(내용을 지우고 입력하시기 바랍니다.)"]);
          },
          fCreator: "createSEditor2"
      });      

      //저장버튼 클릭시 form 전송
      $("#save").click(function()
      {
          oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
          $("#frm").submit();
      });  
});
</script>
</head>
<body>
	<!-- 소메뉴 불러오기 -->
	<div class="smallMenu" style="margin: 10px;">
		<c:import url="SmallMenu.jsp"></c:import>
	</div>
	<br>
	
	<!-- 대메뉴 불러오기 -->
	<div class="mainMenu" style="margin: 10px;">
		<c:import url="MainMenu.jsp"></c:import>
	</div>
	<br>
	
	<!-- 왼쪽 메뉴 불러오기 -->
	<div style="float:left; width: 20%; padding: 20px;">
		<c:import url="OpenStudyMenu.jsp"></c:import>
	</div>
	
	<!-- 글작성 페이지 -->
	<!-- 스마트 에디터 부분 -->
	<div style="float:left; width: 80%;">
		<form id="frm" action="insert.jsp" method="post" >
			<div>
				<hr>
				<dl>
					<dt>
						제목 : 
						<input type="text" id="title" name="title" style="width:650px"/>
					</dt>
				</dl>
				<dl>
					<dt>
						내용 : <textarea rows="10" cols="30" id="ir1" name="content" style="width:650px; height:350px; "></textarea>					
					</dt>
				</dl>
				
				<dl style="float: left: ; ">
					<dd>
						<input type="button" id="save" value="글쓰기"/>
						<input type="button" value="취소"/>
					</dd>
				</dl>
			</div>
		</form>
	</div>
</body>
</html>