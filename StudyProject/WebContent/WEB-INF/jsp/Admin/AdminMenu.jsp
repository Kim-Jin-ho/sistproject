<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>대분류 소분류 추가/제거</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	//선택한 리스트 위로 올리기
	function bigListUp()
	{
		var sb = document.getElementById("sel4");
		var index = sb.selectedIndex;
		var total = sb.options.length - 1;
		if (index == -1)
		{
			return false;
		}
		if (index == 0)
		{
			return false;
		}
		var items = new Array;
		var values = new Array;
		for (var i = total; i >= 0; i--)
		{
			items[i] = sb.options[i].text;
			values[i] = sb.options[i].value;
		}
		sb.length = 0;
		for (var i = 0; i <= total; i++)
		{
			if (i == index - 1)
			{
				sb.options[i] = new Option(items[index], values[index]);
				sb.options[i + 1] = new Option(items[i], values[i]);
				i++;
			} else
			{
				sb.options[i] = new Option(items[i], values[i]);
			}
		}
		sb.selectedIndex = index - 1;
	}
	
	// 선택한 리스트 아래로 내리기
	function bigListDown()
	{
		var sb = document.getElementById("sel4");
		var index = sb.selectedIndex;
		var total = sb.options.length - 1;
		if (index == -1)
		{
			return false;
		}
		if (index == total)
		{
			return false;
		}
		var items = new Array;
		var values = new Array;
		for (i = total; i >= 0; i--)
		{
			items[i] = sb.options[i].text;
			values[i] = sb.options[i].value;
		}
		sb.length = 0;
		for (var i = total; i >= 0; i--)
		{
			if (i == index + 1)
			{
				sb.options[i] = new Option(items[index], values[index]);
				sb.options[i - 1] = new Option(items[i], values[i]);
				i--;
			} else
			{
				sb.options[i] = new Option(items[i], values[i]);
			}
		}
		sb.selectedIndex = index + 1;
	}


	//선택한 리스트 위로 올리기
	function smallListUp()
	{
		var sb = document.getElementById("sel1");
		var index = sb.selectedIndex;
		var total = sb.options.length - 1;
		if (index == -1)
		{
			return false;
		}
		if (index == 0)
		{
			return false;
		}
		var items = new Array;
		var values = new Array;
		for (var i = total; i >= 0; i--)
		{
			items[i] = sb.options[i].text;
			values[i] = sb.options[i].value;
		}
		sb.length = 0;
		for (var i = 0; i <= total; i++)
		{
			if (i == index - 1)
			{
				sb.options[i] = new Option(items[index], values[index]);
				sb.options[i + 1] = new Option(items[i], values[i]);
				i++;
			} else
			{
				sb.options[i] = new Option(items[i], values[i]);
			}
		}
		sb.selectedIndex = index - 1;
	}
	
	// 선택한 리스트 아래로 내리기
	function smallListDown()
	{
		var sb = document.getElementById("sel1");
		var index = sb.selectedIndex;
		var total = sb.options.length - 1;
		if (index == -1)
		{
			return false;
		}
		if (index == total)
		{
			return false;
		}
		var items = new Array;
		var values = new Array;
		for (i = total; i >= 0; i--)
		{
			items[i] = sb.options[i].text;
			values[i] = sb.options[i].value;
		}
		sb.length = 0;
		for (var i = total; i >= 0; i--)
		{
			if (i == index + 1)
			{
				sb.options[i] = new Option(items[index], values[index]);
				sb.options[i - 1] = new Option(items[i], values[i]);
				i--;
			} else
			{
				sb.options[i] = new Option(items[i], values[i]);
			}
		}
		sb.selectedIndex = index + 1;
	}
	
	$(function()
	{
		// 대분류 제거
	    $("#btnMoveRight2").on("click",function()
   	    {
   	        $('#sel4 option:selected').each( function()
   	        {
   	            $(this).remove().appendTo('#sel3');
   	        });
   	    });
   		//대분류 추가
   	    $("#btnMoveLeft2").on("click",function()
   	    {
   	        $('#sel3 option:selected').each( function()
   	        {
   	        	//alert($(this).value);
   	            $(this).remove().appendTo('#sel4');
   	        });
   	    });
   		
	    // 소분류 제거	    
	    $("#btnMoveRight").on("click",function()
	    {
	        $('#sel1 option:selected').each( function()
	        {
	            $(this).remove().appendTo('#sel2');
	        });
	    });
	    
		// 소분류 추가
	    $("#btnMoveLeft").on("click",function()
	    {
	        $('#sel2 option:selected').each( function()
	        {
	            $(this).remove().appendTo('#sel1');
	        });
	    });
		
	    $("#btnAdd").on("click",function()
	    {
	        if($('#sel1').find("[value='"+$('#addOption').val().replace('"','\'')+"']").length == 0)
	        {
	            $('#sel1').append('<option value="'+$('#addOption').val().replace('"','\'')+'">'+$('#addOption').val()+"</option>");
	        }else{
	            alert("있어요.");
	        }
	    });
	
	    $("#btnAdd2").on("click",function()
	    {
	        if($('#sel2').find("[value='"+$('#addOption2').val().replace('"','\'')+"']").length == 0)
	        {
	            $('#sel2').append('<option value="'+$('#addOption2').val().replace('"','\'')+'">'+$('#addOption2').val()+"</option>");
	        }else{
	            alert("있어요.");
	        }
	    });
	});

	
	// 대분류 선택 시 소분류 불러오는 부분 Ajax 처리	
	function sub()
	{
		var x = f.sel.value;
		$.ajax(
		{
			type : "POST",
			url : "AdminMenuList.jsp",
			data : "region=" + x, //&a=xxx 식으로 뒤에 더 붙이면 됨
			success : result
		//function result 를 의미함
		});
	}
	function result(msg)
	{
		//sub()가 실행되면 결과 값을 가지고 와서 action 을 취해주는 callback 함수
		var sel = document.f.sel2;
		$("#sp1").html(msg); //innerHTML 을 이런 방식으로 사용함
		//id 는 $("#id")   name 의 경우 $("name") 으로 접근함
	}
</script>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
</head>
<body>
<form action="" name="f">
	<h2>대분류</h2>
	<select name="sel4" id="sel4" size="5">
			<option>대분류1</option>
			<option>대분류2</option>
			<option>대분류3</option>
	</select>
	
		
	<!-- 대분류 올리고 내리기 -->
	<input type="button" value="올리기" onclick="bigListUp();" />
	<input type="button" value="내리기" onclick="bigListDown();" />
	
	
	<!-- 값 넘겨주고 받기 -->
	<div>
		<dl>
			<dt><input type="button" value="추가" id="btnMoveLeft2"/></dt>
			<dt><input type="button" value="제거" id="btnMoveRight2"/></dt>
		</dl> 
	</div>

	
	<!-- 2번째 select -->
	<select id="sel3" name="sel3" style="width: 150px;" size="5">
		<option>대분류</option>
		<option>대분류2</option>
		<option>대분류3</option>
	</select>
	
	<!-- 
	<input type="text" id="addOption2"  style="width:183px;"/>
	<input type="button" value="Add" id="btnAdd3"/>
	 -->
	<br><br>
	<h2>소분류</h2>
	<!-- 1번째 select -->
	<select name="sel" onchange="sub();" size="5" >
		<option value="programing">프로그래밍</option>
		<option value="language">언어</option>
		<option value="official">공무원</option>
	</select>
	<span id="sp1">
	<select name="sel1" id="sel1" size="5">
			<option>대분류를 선택하세요</option>
	</select>
	</span>
	
	<div class="updown2">
		<!-- 소분류 올리고 내리기 -->
		<input type="button" value="올리기" onclick="smallListUp();" />
		<input type="button" value="내리기" onclick="smallListDown();" />
	</div>
	
	<!-- 값 넘겨주고 받기 -->
	<div class="insertdelete">
		<dl>
			<dt><input type="button" value="추가" id="btnMoveLeft"/></dt>
			<dt><input type="button" value="제거" id="btnMoveRight"/></dt>
		</dl> 
	</div>

	
	<!-- 2번째 select -->
	<select id="sel2" name="sel2" style="width: 150px;" size="5" >
		<option value="hi">하잇</option>
	</select>
	<!-- 
	<input type="text" id="addOption2"  style="width:183px;"/>
	<input type="button" value="Add" id="btnAdd2"/>
	 -->
</form>
</body>
</html>