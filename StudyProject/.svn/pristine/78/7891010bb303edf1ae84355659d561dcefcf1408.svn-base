<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대,소 분류 추가 수정 삭제</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="<%=cp %>/ajax.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->
<script type="text/javascript"> 
	//대분류 추가, 수정, 삭제
/* 	function result(msg)
	{
		//sub()가 실행되면 결과 값을 가지고 와서 action 을 취해주는 callback 함수
		var sel = document.f.sel2;
		$("#sp1").html(msg); //innerHTML 을 이런 방식으로 사용함
		//id 는 $("#id")   name 의 경우 $("name") 으로 접근함
	} */
	
 	/*function ajaxRequest()
	{
	   $.post("AdminMenuList.action", { "region" : $("#sel").val() }, function(data)
	   {
	      $("#sel1").html(data);   
	   });
	}  */
	function insertValue(exp)
	{
		// select 박스 선택 시 text 박스에 값 넘겨주기
		document.getElementById("write_express").value = exp;
		document.getElementById("write_express_1").value = f.sel.options[f.sel.selectedIndex].text;
		document.getElementById("write_express").focus();
		
		// 대분류 선택에 따른 소분류 ajax 처리
	}
	
	function search() 
	{
		//alert("test");
		// 데이터 수집
		var search = document.getElementById("sel").value;
 		// URL
		var url = "<%=cp%>/AdminMenuList.action?search=" + search ;

		// HttpRequest 객체 생성
		ajax = createAjax();

		ajax.open("GET", url, true);

		ajax.onreadystatechange = function()
		{
			if (ajax.readyState == 4)
			{
				if (ajax.status == 200)
				{
					callBack();
				}
			}
		}
		ajax.send("");
	}

	// XML 목록으로 받아온 검색어들을 적당한 리스트로 생성해서 화면에 출력한다.
	function callBack()
	{
		// XML 문서 전체의 참조 객체, 흔히 XML 문서 객체라고 한다.
		var doc = ajax.responseXML;

		// XML 문서의 최상위 엘리먼트. 현재 문서에서는 <list> 태그
		var root = doc.documentElement;
		
		// 모든 <item> 태그를 반환받기
		var itemList = root.getElementsByTagName("item");
		//alert(itemList);
		
		// items 박스 초기화
		document.getElementById("sel1").innerHTML = "";
	
		for (var i = 0; i < itemList.length; i++) 
		{
			var word = itemList[i].firstChild.nodeValue;
			var word1 = itemList[i+1].firstChild.nodeValue;
			//alert(word1);

			// items 에 추가하기
			document.getElementById("sel1").innerHTML += "<option value='"+word+"'>"+word1+"</option> ";
			i++;
		}
		// 목록을 화면에 보이기
		document.getElementById("sel1").style.display = "block";
	}
	
	// 대분류 클릭 시 소분류 ajax 처리
	$(document).ready(function()
	{
		$("#sel").change(function()
		{
			//alert($("#sel").val());
			//alert("<%=cp%>");
			search();
			//ajaxRequest();
		});
	});

	
	// 소분류 추가, 수정, 삭제
	function insertValue2(exp)
	{
		// 소분류 selec 박스 선택 시 text 박스에 값 추가
		document.getElementById("write_express2").value = exp;
		document.getElementById("write_express2_1").value = f.sel1.options[f.sel1.selectedIndex].text;
		document.getElementById("write_express2").focus();
	}
	
	$(function()
	{
		$("#sel").change(function()
		{
			search();
		});
		
		
		//대분류 삭제 버튼 클릭 
	    $("#btnRemoveLeft").on("click",function()
	    {
	    	if (confirm("정말 삭제하시겠습니까?"))
			{
	    		$('#sel option:selected').each( function() 
		        {
	    			document.getElementById("write_express").value = "";	
		            $(this).remove();
		        });
			}
	    	else
			{
				return;	
			}
	    });
		
		// 소분류 삭제 버튼 클릭
	    $("#btnRemoveRight").on("click",function()
   	    {
   	    	if (confirm("정말 삭제하시겠습니까?"))
   			{
   	    		$('#sel1 option:selected').each( function() 
   		        {
   	    			document.getElementById("write_express2").value = "";	
   		            $(this).remove();
   		        });
   			}
   	    	else
   			{
   				return;	
   			}
   	    })
		// 소메뉴 중복확인 버튼 클릭 시 중복값 확인하기
		$("#smName1").blur(function(){
			var val = $(this).val();
			
			$("select#sel1 option").each(function(){
		       if($(this).text()==val)
		       { 
			       $("#smCheck1").text('이미 존재하는 데이터입니다.');
			       $("#smCheck1").css('color','red');
			       $('#sAddBtn').attr('disabled',true)
			       return false;
		       }
		       else if(val != "" && $(this).text()!=val)
		       {
			       $("#smCheck1").text('사용가능합니다.');
			       $("#smCheck1").css('color','red');
			       $('#sAddBtn').attr('disabled',false)
		       }
			});
		});
	});
	
	
</script>
</head>
<body>
	<!-- 상단 메뉴 구성 -->
	<div class="menuList">
		<Br>
		<button type="button" onclick="location.href='AdminMenu.jsp'">구성</button>
		<button type="button" onclick="location.href='AdminAddModifyDelete.jsp'">추가/수정/삭제</button>
	</div>
	
	<!-- 하단 컨텐츠 구성 -->
	<div>
		<h2>대분류</h2>
		<hr></hr>
	</div>
	<!-- select 박스 및 모달 팝업 구성 -->
	<form name="f">
		<select id="sel" name="sel" onchange="insertValue(this.value)" size="10">
		    <option value="1">프로그래밍</option>
		    <option value="2">언어</option>
		    <option value="3">공무원</option>
		</select>
		
		<!-- 대분류 추가 수정 삭제 -->
		value 값 :<input type="text" id="write_express" name="express" class="w_100" disabled="disabled">
		text 값 :<input type="text" id="write_express_1" name="express" class="w_100">
		<div class="">
		<!-- 버튼 -->
			<button type="button" class="" data-toggle="modal" data-target="#myModal" >
			  추가
			</button>
			<!-- 모달 팝업 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
							<h4 class="modal-title" id="myModalLabel">대분류 추가</h4>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="btnAdd" onclick="">추가</button>
							<button type="button" class="btn btn-default"  data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	    <input type="button" value="수정" id="btnModify">
	    <input type="button" value="삭제" id="btnRemoveLeft"/>
	    
	    <br><br>
	    
	    <h2>소분류</h2>
	    <hr></hr>
		    <select id="sel1" name="sel1" onchange="insertValue2(this.value)" size="10" multiple>
		    	<option>하연</option>
		    </select>
		
		<!-- 소분류 추가 삭제 부분 -->
		value 값 :<input type="text" id="write_express2" name="express2" class="w_100" disabled="disabled">
		text 값: <input type="text" id="write_express2_1" name="express2" class="w_100">
		<div class="">
		<!-- 버튼 -->
			<button type="button" class="" data-toggle="modal" data-target="#myModal1" >
			  추가
			</button>
			<!-- 모달 팝업 -->
			<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
							<h4 class="modal-title" id="myModalLabel">소분류 추가</h4>
						</div>
						<div class="modal-body">
					    	<input type="text" size="30" id="smName1" /> <span id="smCheck1"></span>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="sAddBtn" name="sAddBtn"  >추가</button>
							<button type="button" class="btn btn-default"  data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	    <input type="button" value="수정" id="btnModify2">
	    <input type="button" value="삭제" id="btnRemoveRight"/>
	</form>
</body>
</html>