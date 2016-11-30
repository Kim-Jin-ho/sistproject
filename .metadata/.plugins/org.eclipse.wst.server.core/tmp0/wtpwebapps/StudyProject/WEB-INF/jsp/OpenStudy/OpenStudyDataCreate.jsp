<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA_dataInsert.jsp</title>
<style type="text/css">

	.file_size .size_bar
	{
	    float: left;
	    width: 340px;
	    height: 9px;
	    margin-top: 5px;
	    background-color: #f4f4f4;
    }

	.file_size .inner_bar 
	{
	    display: block;
	    height: 9px;
	    background-color: #bdbdbd;
	}


	/* 파일 업로드 버튼 CSS */
	.filebox label , .filedel
	{
		display: inline-block;
		padding: .5em .75em;
		color: #fff;
		font-size: inherit;
		line-height: normal;
		vertical-align: middle;
		background-color: #337ab7;
		cursor: pointer;
		border: 1px solid #2e6da4;
		border-bottom-color: #e2e2e2;
		border-radius: .25em;
	}


	/* 파일 필드 숨기기 */
	.filebox input[type="file"]
	{
		position: absolute;
		width: 1px;
		height: 1px;
		padding: 0;
		margin: -1px;
		overflow: hidden;
		clip:rect(0,0,0,0);
		border: 0;
	}
	
	/* 파일 이름을 담을 input 박스 CSS */
	.filebox .upload-name 
	{
		display: inline-block;
		padding: .5em .75em;  /* label의 패딩값과 일치 */
		font-size: inherit;
		font-family: inherit;
		line-height: normal;
		vertical-align: middle;
		background-color: #f5f5f5;
		border: 1px solid #ebebeb;
		border-bottom-color: #e2e2e2;
		border-radius: .25em;
		-webkit-appearance: none; /* 네이티브 외형 감추기 */
		-moz-appearance: none;
		appearance: none;
	}

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">

	var fileSizeMB = 0;		//-- 관리자 파일 용량 확인 변수

	$(document).ready(function()
	{		
		var fileTarget = $('.filebox .upload-hidden');		//-- 파일 obj
		var filename = "";		//-- 파일 이름 변수
		
		
		// 파일 업로드 시 파일크기, 파일명 알아서 값 보여주기
		fileTarget.on('change', function()	// 값이 변경되면(파일이 첨부되면)
		{
			//alert("파일 이름 및 용량 확인 함수 호출");
			//alert($(this).val());		//--> 경로+파일명 출력됨
			
			// 파일용량 최대값 담을 변수
			var maxFileSize = (25*1024*1024);
			//alert(typeof maxFileSize);	//--> number 타입
			
			var fileSize = $(this)[0].files[0].size;
			//alert(fileSize);			//--> 파일 크기(KB)
			//alert(typeof fileSize);	//--> number 타입
			
			fileSizeMB = (fileSize/(1024*1024)).toFixed(2); //--> 파일 크기(MB) 소수점 둘째자리까지 표현
			alert(fileSizeMB);
			
			$(".emph_over").empty();	//-- 파일 용량 초과 msg 지우기
			$(".txt_size").empty();		//-- 파일 size 표시 msg 지우기
			
			
			//alert($(this).val());
			
			
			if(window.FileReader)	// modern browser
			{
				filename = $(this)[0].files[0].name;
			}
			else	// old IE
			{
				filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
			}
			
			//-- 파일이름 변수타입 출력 테스트
			//alert(typeof filename);		//-- string
			
			// 추출한 파일명 삽입
		    $(this).siblings('.upload-name').val(filename);
			
		    $(".inner_bar").attr("style","width:"+(fileSizeMB*100/5)+"%;");	//-- 파일크기 만큼 넓이 설정값 넣어주기
			$(".txt_size").html(fileSizeMB+" MB");			//-- 파일 크기 값 넣어주기
			
			if(fileSize > maxFileSize)
			{
				alert("첨부파일 최대용량 초과! 다시 첨부해주세요.");
				$(".emph_over").html("제한된 파일 크기 초과!");
				return;
			}
		}); //-- end fileTarget.on('change', function()
				
		// 입력 글자 수 최대값 변수 선언
		var maxContentChar = 5000;		//-- 내용
		var update = function()
		{
			var nowContent = $("#data_content").val().length;
			if( nowContent > maxContentChar )
			{
				alert("내용의 글자 입력수가 초과하였습니다.");
				
				var strContent = $("#data_content").val();
				
				// 최대 입력 가능한 글자수만 남기기
				$("#data_content").val(strContent.substr(0, maxContentChar));
			}
		} // end var update = function()
		
		$("#data_content").bind('input keyup paste', function()
		{
			//alert($("#content").val().length);
			//alert(typeof countChar);
			setTimeout(update, 0);
		});
				
		// 폼 전송테스트 (text, file)
		$("#update_Qdata").click(function()
		{
			$("#data_insertForm").attr("action", "OpenStudyData_ok.jsp");
			
			//내용 값 확인
			//alert($("#data_content").val());
			
			if(fileSizeMB > 25)
			{
				alert("첨부 파일의 용량을 확인해주세요.");
				return;
			}
			
			// 제목 및 내용 공백 자르기
			var content = $("#data_content").val().trim();
			//alert("공백자르기확인:"+subject+":");
			
			$("#data_content").val(content);
			//-- 필수 입력사항(분류, id, 제목, 내용) 중 하나라도 누락되었으면...
			if($("#data_content").val() == "")
			{
				alert("필수 입력사항이 누락되었습니다. 확인해주세요.");
				return;
			}
			$("#data_insertForm").submit();
		}); //-- end $(".btn_submit").click(function()
				
		// 파일 삭제
		$(".filedel").click(function()
		{
			//-- 파일 제거 함수 호출
			removeFile();
		}); //-- end $(".filedel").click(function()
	});	//-- end $(document).ready(function()
			
		
	//-- 첨부파일 제거 함수
	function removeFile()
	{
		alert($("#file").val());
		$("#file").val(null);		//-- file 의 name 속성 null 로 만들어주기
		alert($("#file").val());
		
		//-- 신규 파일태그 추가
		$('.upload-name').val("");		//-- 파일 이름 보여주는 input 박스 값 없애기
		$(".emph_over").empty();		//-- 파일 용량 초과 안내 msg 제거
		$(".txt_size").empty();			//-- 파일 사이즈 표시 msg 제거	
		fileSizeMB = 0;					//-- 파일 크기 담은 변수 초기화
		//alert(fileSizeMB);
	}
	
	
	function fileChange()
	{
		//alert("확인");
		if(fileChk == "Y")
		{
			//alert("확인");
			$('.upload-name').val("QnA 답변.jpg");
			$(".inner_bar").attr("width", "0.16");		//-- 파일크기 만큼 넓이 설정값 넣어주기
			$(".txt_size").html("0.16"+" MB");			//-- 파일 크기 값 넣어주기
		}
		return;
	}
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
	
	<div id="content" style="float: left; padding: 10px;" >
		<div id="Custom_Article">
			<div class="head_article">
	        	<h1 id="daumBody" class="tit_article">자료실</h1>
	    	</div>
		</div>	<!-- end #Custom_Article -->	
		<div class="data_replay" style="float: left;">
			<form method="POST" class="cs_inquiry" id="data_insertForm" name="data_updateForm" enctype="multipart/form-data">
			<div>
				제목 : <input type="text" id="data_title" name="data_title">
			</div>
			<div>
				<span id="replay_content">
					<textarea rows="10" cols="70" id="data_content" name="data_content"></textarea>
				</span>
			</div>
			<div>
				<div class="left">
					<span>첨부</span>
				</div>
				<div class="filebox">
					<span id="fileWrap">
						<input class="upload-name" id="upload-name" name="upload-name" value="" disabled="disabled">
							<label for="file">업로드</label>
							<input type="file" id="file" name="file" class="upload-hidden" accept=".jpeg, .jpg, .gif, .png, application/msword, application/vnd.ms-excel, application/vnd.ms-powerpoint">
						</span>
							<button type="button" class="filedel">삭제</button>
				</div>
			</div>
			</form>
				
			<div class="file_size">
				<!-- 파일크기 초과일때 over_size 추가 -->
				<span class="size_bar">
					<span class="inner_bar" style="width: 0%;"></span>
				</span>
				<span class="txt_size" style="display: block;"></span>
				<em class="emph_over" style="display: block;"></em>
			</div>
			<br>
			<p class="file_notice">
				첨부한 파일의 전체 크기는 25Mbyte 미만이어야 합니다.<br>
				용량이 초과될 경우, 등록이 원활하게 진행되지 않을 수 있습니다.<br>
				파일첨부는 JPEG, JPG, GIF, PNG, MS Office 파일만 가능합니다.
			</p>
		</div>	<!-- end .data_replay -->
		<br><br>
		<div style="float: left; width: 80%; padding: 10px;">
			<a href="#this" id="update_Qdata"  class="link_list">
				<span class="bg_cs" id="1234567"></span>등록
			</a>
			<a href="QnAView_data.jsp?no=47093696" class="link_list">
				<span class="bg_cs"></span>취소
			</a>
		</div>
	</div>
</body>
</html>