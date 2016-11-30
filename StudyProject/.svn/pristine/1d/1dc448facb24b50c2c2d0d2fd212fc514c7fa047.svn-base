$(document).ready(function()
{
	var f = null;
	
	// FAQ ==================================================================
	
	// 검색 기능
	$("#searchButton").click(function() 
	{
		// 검색어를 입력하지 않았다면
		if ($("#searchText").val() == "")
		{
			alert("검색어를 입력해주세요.");
			return;
		}
		
		// id = searchForm을 f 변수에 넣는다.
		f = document.getElementById("searchForm");
		
		// 변수 f에 들어있는 폼을 서브밋 시킨다.
		f.submit();
	});
	
	// 삭제 기능
	$(".delete").click(function() 
	{	
		// 예, 아니오 버튼 중 예를 클릭했다면
		if (confirm("삭제를 진행하시겠습니까?") == true)
		{
			// 해당 버튼의 name 값을 변수 name에 넣는다.
			var name = $(this).attr("name");
			// input type hidden에 name값을 넣는다.
			document.getElementById("hidden").value = name;
			
			// 그 상태로 서브밋 시킨다.
			f = document.getElementById("listForm");
			f.submit();
		}
	});
	
	// 수정 기능
	$(".update").click(function()
	{ 
		// 해당 버튼의 id 값을 변수 id에 넣는다.
		var cd = $(this).attr("id");
		
		// id에서 update 글자를 제거하고 숫자(cd)만 뽑아내어 다시 id변수에 넣는다.
		cd = cd.substring(6);
		
		// 해당 버튼 클릭시 url을 전송!
		jQuery(location).attr("href","FAQInputForm.room?cd=" + cd);
	});
	
	
	
	// CSS 기능
	// FAQ 제목에 마우스 오버할시
	$(".panel-heading").mouseover(function() 
	{
		// 배경색을 진하게 하라
		$(this).css("background-color", "#cccccc");
		// 버튼의 굵기를 진하게 하라
		$(this).css("font-weight","bold");
		// 제목의 굵기를 진하게 하라
		$("h4").mouseover(function()
		{
			$(this).css("font-weight","bold");
		});
	});
	
	// FAQ 제목에서 마우스를 아웃할시
	$(".panel-heading").mouseout(function() 
	{
		// 배경색을 복구시킨다.
		$(this).css("background-color", "");
		// 버튼의 굵기를 복구시킨다.
		$(this).css("font-weight","");
		// 제목의 굵기를 복구시킨다.
		$("h4").mouseout(function()
		{
			$(this).css("font-weight","");
		});
	});
	
	
	
	
	
	
	//  ================================================================== FAQ
	
	
	
	
	// FAQInputForm ==========================================================
	
	// 등록 버튼을 클릭했을 때
	$("#insert").click(function() 
	{
		// 미 입력 항목이 존재한다면 얼럿노출.
		if($("#title").val() == "" || $("#comment").val() == "")
		{
			alert("미 입력 항목이 존재합니다.");
			return;
		}
		
		var f = document.getElementById("inputForm");
		f.submit();
	});
	
	// 수정 버튼을 클릭했을 때
	$("#update").click(function() 
	{
		// 미 입력 항목이 존재한다면 얼럿노출.
		if($("#title").val() == "" || $("#comment").val() == "")
		{
			alert("미 입력 항목이 존재합니다.");
			return;
		}

		var f = document.getElementById("inputForm");
		f.submit();
	});
	
	// 글자 수 제한 체크
	$("#title").keyup(function() 
	{
		if (($("#title").val().length) > 500)
			alert("글자수를 초과하였습니다.");
	});
	$("#comment").keyup(function() 
	{
		if (($("#comment").val().length) > 500)
			alert("글자수를 초과하였습니다.");
	});
	
	//======================================================== FAQInputForm
});