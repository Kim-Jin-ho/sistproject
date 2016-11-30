<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

   String today = formatter.format(new Date());
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표 게시판 만들기</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function()
	{
		$("#studyStartDate").change(function()
		{
		    $("input[name='studyEndDate']").attr("min", ($("input[name='studyStartDate']").val()));
		});
		
        var counter = 3;
		
        $("#addButton").click(function () {
    				
    	if(counter>10){
                alert("10개 이하여야만 합니다.");
                return false;
    	}   
    		
	    	var newTextBoxDiv = $(document.createElement('div')).attr("id", 'TextBoxDiv' + counter);
	                    
	    	newTextBoxDiv.after().html('<label>선택사항 '+ counter + '번  : </label>' +
	    	      '<input type="text" name="' + counter + '" id="textbox' + counter + '" value="" ><br>');
	                
	    	newTextBoxDiv.appendTo("#TextBoxesGroup");
	    				
	    	counter++;
         });

        $("#removeButton").click(function () {
	    	if(counter<=3)
	    	{
	              alert("2개 이하는 안됩니다.");
	              return false;
	           }   
	            
	    	counter--;
	    			
	            $("#TextBoxDiv" + counter).remove();
    			
         });
    		
         $("#getButtonValue").click(function () {
    		
	    	var msg = '';
	    	for(i=1; i<counter; i++)
	    	{
	       	  msg += "\n 선택사항 " + i + "번 : " + $('#textbox' + i).val();
	    	}
	        	  alert(msg);
         });
	})
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
	<div style="float:left; width: 120px; padding: 10px;">
		<c:import url="OpenStudyMenu.jsp"></c:import>
	</div>
	
	<!-- 뷰 구성 -->
	<div style="padding:10px; width: 70%; float:left; margin: 20px;">
		<select>
			<option>자유게시판</option>
			<option>투표게시판</option>
		</select>
		<hr>
		<dl>
			<dd>&nbsp;&nbsp;&nbsp;&nbsp;제목 : &nbsp;&nbsp; <input type="text" style="width: 500px;" maxlength="50"></dd>
			<dd style="background-color: hotpink; width: 60px; float: left;">투표기간</dd>
			<dd style="float: left;">&nbsp;&nbsp;시작일 : &nbsp;</dd>
			<dd style="float: left;"><input type="date" name="studyStartDate" id="studyStartDate" value="<%=today %>" ></dd>
			<dd style="float: left;">&nbsp;&nbsp;종료일 : &nbsp;</dd>
			<dd style="float: left;"><input type="date" name="studyEndDate" id="studyEndDate" ></dd>
		</dl>
		<dl>
			<dd>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" value="1" name="twins"> &nbsp;중복 허용 &nbsp;
			</dd>
		</dl>
		<dl style="float: left;">
			<dd style="background-color: hotpink; width: 60px; height:200px; text-align:center;"><br><br><br><br>선택사항</dd>
		</dl>
		<div id='TextBoxesGroup' style="float: left; width: 70%">
			<div id="TextBoxDiv1">
				<label>선택사항 1번 :</label><input type="text" id="textbox1" ><br>
				<label>선택사항 2번 : </label><input type="text" id='textbox2' ><br>
			</div>
		</div>
		<dl></dl>
		<div style="float: left; width: 70%">
			<dl>
				<dd>
					<input type='button' value='추가' id='addButton'>
					<input type='button' value='삭제' id='removeButton'>
					<input type='button' value='값 확인' id='getButtonValue'>
				</dd>
			</dl>
		</div>
	</div>
</body>
</html>