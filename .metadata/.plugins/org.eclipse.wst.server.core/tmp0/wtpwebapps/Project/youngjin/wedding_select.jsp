<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>


<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>회원웨딩홀</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/css/youngjin/MenuStyle.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/youngjin/TableStyle.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/youngjin/MainStyle.css">


<script type="text/javascript" src="<%=cp %>/js/youngjin/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/youngjin/jquery-ui.js"></script>

<script type="text/javascript" src="ajax.js"></script>



<!-- 큰이미지 작은이미지 자리 선정 -->	
<script type="text/javascript">

	$(document).ready(function()
	{
		$(".thumbs a").click(function(e)
		{
			e.preventDefault(); // return false;
		
			var path=$(this).attr("href");
			// console.log("path : "+path);
			// $("#largeImg img").attr("src", path);
			// $("#largeImg img").attr({"src":path});
		
			if(path != $("#largeImg img").attr("src"))
			{
				$("#largeImg img").attr({src:path});
				$("#largeImg img").css({opacity:0})
				.stop()
				.animate({opacity:1}, 1000);
			}
		});
	});
	
</script>	


	
	
	
	
</script>


<!-- 찜하기 -->
<script type="text/javascript">
	/* 	
	$(function()
	{
		$("#love").click(function()
		{	
			//alert($(this).val());
			// value 값을 확인해서 찜하기의 내용을 알아온다
			if($(this).val()=="love1")
			{	
				alert("찜하였습니다♥")
				$("#love").html("찜하기♥");
				// 찜한정보를 받아오고 value 값을 바꿔준다
				$(this).attr("value", "love2");
				// 추가 찜한정보를 보내준다~ 
			}
			else
			{
				$("#love").html("찜하기♡");
				$(this).attr("value", "love1");
			}
		});
	});		
 */
	// ajax 처리 
	$(function()
	{
		$("#love").click(function()
		{	
			if($(this).val()=="love1")
			{	
				alert("찜하였습니다♥")
				$.post("<%=cp%>/youngjin/wedding_select_ok.love", {"love":$("#love").val()},function(data)
				{
					$("#love").html("찜하기♥");
					// 찜한정보를 받아오고 value 값을 바꿔준다
					$("#love").attr("value", "love2");
					// 추가 찜한정보를 보내준다~	
				});
			}
			else if($(this).val()=="love2")
			{
				$.post("<%=cp%>/youngjin/wedding_select_ok.love", {"love":$("#love").val()},function(data)
				{
					$("#love").html("찜하기♡");
					$("#love").attr("value", "love1");	
				});
			}
		});
	});	

</script>

<!-- 선택 견적정보 가져오기 -->
<script type="text/javascript">
	/* 
	$(function()
	{
		$(".select").change(function()
		{	
			// 각각의 value 값을 받아온다
			var userDay = $("#userDay").val();
			var userHalltype = $("#userHalltype").val();
			var userEat = $("#userEat").val();
			
			// 총계는 가격의 정보만을 받아온다
			var tot = Number(userHalltype) + Number(userEat);
			
			// 각각의 정보를 뿌려준다
			//$("#userDaySee").html(userDay);
			$("#userHalltypeSee").html(userHalltype);
			$("#userEatSee").html(userEat);
			$("#total").html(tot);
		});
	});
 */
</script>
			        			         

<!-- 상품평 삭제 버튼 ajax -->
<script type="text/javascript">

	$(function() 
	{
		$(".remove").click(function() 
		{
			var remove = $(this).val();
			$.post("wedding_select_ok.love", {"remove":remove}, function() 
			{
				alert("삭제합니다");
			});
			
		});
	});

</script>			 


<!-- 선택 견적정보 가져오기 ajax처리 -->
<script type="text/javascript">
	
	$(function()
	{	
		$("#userDay").change(function()
		{	
			var userDay = $("#userDay").val();
			$.post("wedding_select_ok.love",{"userDay":userDay},function(data)
			{	
				$("#userDaySee").html(userDay);
			});
		});
		
		$("#userHalltype").change(function()
		{	
			// 합계를 위한 홀/식사메뉴의 값을 받아온다
			var userHalltype = $("#userHalltype").val();
			var userEat = $("#userEat").val();
			$.post("wedding_select_ok.love",{"userHalltypeSee":userHalltype, "userEat":userEat},function(data)
			{	
				// 홀/식사메뉴가 변경될때마다 합을 해준다.
				$("#userHalltypeSee").html(userHalltype);
				$("#total").html(Number(userHalltype)+Number(userEat));
			});
		});
		
		$("#userEat").change(function()
		{
			var userEat = $("#userEat").val();
			var userHalltype = $("#userHalltype").val();
			$.post("wedding_select_ok.love",{"userEatSee":userEat, "userHalltype":userHalltype},function(data)
			{
				$("#userEatSee").html(userEat);
				$("#total").html(Number(userEat)+Number(userHalltype));
			});
		});
	});
	   
	
</script>


<!-- 상품평 글올리고 보내기 -->
<script type="text/javascript">

	$(function()
	{
		$("#goodBtn").click(function()
		{	
			// 내용을 입력하지 않을시 경고창을 띄워준다
			if($("#comment").val() == "")
			{
				alert("내용을입력하세요");
				$("#comment").focus();
				return;
			}
			
			// 글내용(글내용글자수) 와 평점을 받아온다.
			var comment = $("#comment").val();
			var commentLength = $("#comment").val().length;
			//alert($("#comment").val());
			//alert(commentLength);
			
			var good = $("#good").val();
			//alert($("#good").val());
			
			// 글자수 제한을 두고 그외자릿수는 toggle안에 숨긴다.
			var substr = comment.substr(0,10);
			var substrToggle = comment.substr(10);
			
			//alert(substr);
			//alert(substrToggle); 
			 
			if(commentLength <= 10)
			{	
				// 상품평의 테이블에 내용을 보낸다.
				var str = "<tr><td>"+comment+"<button id='toggleClick1'>▼</button><button id='toggleClick2'>▲</button></td><td>작성자 : 아이디불러오기<br>";
				
				// 평점의 value 값을 확인해서 그에 관한 정보를 찾는다.
				if(good == 5)
					// $("#commentUp").append("평점 : ♥♥♥♥♥<br>");
					str += "평점 : ♥♥♥♥♥<br>";
				else if(good == 4)
					str += "평점 : ♥♥♥♥♡<br>";
				else if(good == 3)
					str += "평점 : ♥♥♥♡♡<br>";
				else if(good == 2)
					str += "평점 : ♥♥♡♡♡<br>";
				else if(good == 1)
					str += "평점 : ♥♡♡♡♡<br>";
				
				str += "<button type='button'>삭제</button></td></tr>";
				
				// 원하는 장소에 추가를 해준다
				$("#commentUp").append(str);
			} 
			
			else if(commentLength >10)
			{
				var str = "<tr><td>"+substr+"<button id='toggleClick1'>▼</button><button id='toggleClick2'>▲</button><br><span id='toggle'>"+substrToggle+"</span></td><td>작성자 : 아이디불러오기<br>";
				
				if(good == 5)
					str += "평점 : ♥♥♥♥♥<br>";
				else if(good == 4)
					str += "평점 : ♥♥♥♥♡<br>";
				else if(good == 3)
					str += "평점 : ♥♥♥♡♡<br>";
				else if(good == 2)
					str += "평점 : ♥♥♡♡♡<br>";
				else if(good == 1)
					str += "평점 : ♥♡♡♡♡<br>";
				
				str += "<button type='button'>삭제</button></td></tr>";
				
				$("#commentUp").append(str);
			}
		});
	});

</script>

<!-- 상품평 toggle 적용 -->
<script type="text/javascript">
	
	$(document).ready(function()
	{	
		// 첫화면에서는 숨겨둔다
		$("#toggle").hide();
		//$("#toggleClick2").hide();
		$(".upup").hide();
		
		$(".downdown").click(function()
    	//$("#toggleClick1").click(function()
    	{	
    		// 토클버튼에 정보를 담아두고 클릭마다 보여주고 숨기고한다.
        	$("#toggle").toggle();
        	$("#toggleClick1").hide();
        	$("#toggleClick2").show();
        	//$(".downdown").hide();
        	//$(".upup").show();
        	
        	var kk = $(this).attr("id", sub("toggleClick1",10));
        	
        	$("#toggle").attr("id", "toggle"+1);
        	
        	
        });
		$(".upup").click(function()
    	//$("#toggleClick2").click(function()
       	{
       		$("#toggle").toggle();
       		$("#toggleClick2").hide();
           	$("#toggleClick1").show();
       		//$(".downdown").show();
        	//$(".upup").hide();
           	
       	});
	});
	
</script>


<!-- 댓글영역 -->
<script type="text/javascript">
	
	$(function()
	{	
		$("#derHide").hide();
		$("#derSee").hide();
		
		$("#derShow").click(function()
		{
			$("#derSee").show();
			$("#derHide").show();
			$("#derShow").hide();
		});
		
		$("#derHide").click(function()
		{
			$("#derSee").hide();
			$("#derHide").hide();
			$("#derShow").show();
		});
	});

	$(function()
	{	
		
		$("#derBtn").click(function()
		{	
			// 내용을 입력하지 않을 시 등록을 방지하고 경고창 출력
			if($("#der").val() == "")
			{	
				alert("내용을 입력하세요");
				$("#der").focus();
				return;
			}
			
			// 글내용 글자수를 받아온다.
			var der = $("#der").val();
			var derLength = $("#der").val().length;
			
			// 글내용에서 보여줄 글자만큼 자른다.
			var substr = der.substr(0,10);
			var substrToggle = der.substr(10);
			
			//der = der.replaceAll("\n","<br>");
			alert(substr);
			alert(substrToggle);
			
			// 10글자 이상하라면 ..
			if(derLength <=10)
			{
				var str = "<tr><td>gun***님에 대한 댓글입니다<br>"+substr+"</td><td>작성자 : 아이디불러오기<br>";
				
				str += "<button type='button'>삭제</button></td></tr>";
				
				$("#derUp").append(str);
			}
			// 10글자 이상이라면 10글자까지보여주고 다음정보는 toggle로..
			else if(derLength > 10)
			{
				var str = "<tr><td>gun***님에 대한 댓글입니다<br>"+substr+"<br><span>"+substrToggle+"</span></td><td>작성자 : 아이디불러오기<br>";
				
				str += "<button type='button'>삭제</button></td></tr>";
				
				$("#derUp").append(str);
			}
			
		});
	});

</script>

<!-- 상담하기 내역 등록 -->
<script type="text/javascript">

	$(function()
	{
		$("#adviceBtn").click(function()
		{
			if($("#advice").val() == "")
			{
				alert("내용을입력하세요");
				$("#advice").focus();
				return;
			}
			
			// 글내용(글내용글자수) 와 평점을 받아온다.
			var advice = $("#advice").val();
			var adviceLength = $("#advice").val().length;
			//alert($("#comment").val());
			//alert(commentLength);
			
					
			// 글자수 제한을 두고 그외자릿수는 toggle안에 숨긴다.
			var substr = advice.substr(0,10);
			var substrToggle = advice.substr(10);
			
			//alert(substr);
			//alert(substrToggle); 
			
			if(adviceLength <= 10)
			{	
				// 상담내역의 테이블에 내용을 보낸다.
				var str = "<tr><td>"+advice+"<button id='adviceClick1'>▼</button><button id='adviceClick2'>▲</button></td><td>작성자 : 아이디불러오기<br>";
												
				str += "<button type='button'>삭제</button></td></tr>";
				
				// 원하는 장소에 추가를 해준다
				$("#adviceUp").append(str);
			} 
			
			else if(adviceLength >10)
			{
				var str = "<tr><td>"+substr+"<button id='adviceClick1'>▼</button><button id='adviceClick2'>▲</button><br><span id='advicetoggle'>"+substrToggle+"</span></td><td>작성자 : 아이디불러오기<br>";
				
				str += "<button type='button'>삭제</button></td></tr>";
				
				$("#adviceUp").append(str);
			}
		});
	});

</script>

<!-- 상담하기 댓글영역 -->
<script type="text/javascript">
	
	$(function()
	{	
		$("#adviceDerHide").hide();
		$("#adviceDerSee").hide();
		
		$("#adviceDerShow").click(function()
		{
			$("#adviceDerSee").show();
			$("#adviceDerHide").show();
			$("#adviceDerShow").hide();
		});
		
		$("#adviceDerHide").click(function()
		{
			$("#adviceDerSee").hide();
			$("#adviceDerHide").hide();
			$("#adviceDerShow").show();
		});
	});

	$(function()
	{	
		
		$("#adviceDerBtn").click(function()
		{	
			// 내용을 입력하지 않을 시 등록을 방지하고 경고창 출력
			if($("#adviceDer").val() == "")
			{	
				alert("내용을 입력하세요");
				$("#adviceDer").focus();
				return;
			}
			
			// 글내용 글자수를 받아온다.
			var adviceDer = $("#adviceDer").val();
			var adviceDerLength = $("#adviceDer").val().length;
			
			// 글내용에서 보여줄 글자만큼 자른다.
			var substr = adviceDer.substr(0,10);
			var substrToggle = adviceDer.substr(10);
			
			
			//der = der.replaceAll("\n","<br>");
			alert(substr);
			alert(substrToggle);
			
			// 10글자 이상하라면 ..
			if(adviceDerLength <=10)
			{
				var str = "<tr><td>gun***님에 대한 댓글입니다<br>"+substr+"</td><td>작성자 : 아이디불러오기<br>";
				
				str += "<button type='button'>삭제</button></td></tr>";
				
				$("#adviceDerUp").append(str);
			}
			// 10글자 이상이라면 10글자까지보여주고 다음정보는 toggle로..
			else if(adviceDerLength > 10)
			{
				var str = "<tr><td>gun***님에 대한 댓글입니다<br>"+substr+"<br><span>"+substrToggle+"</span></td><td>작성자 : 아이디불러오기<br>";
				
				str += "<button type='button'>삭제</button></td></tr>";
				
				$("#adviceDerUp").append(str);
			}
			
		});
	});
</script>







<!-- 이준환 스크립트 -->
<script type="text/javascript">
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
// 상품평 등록하기 버튼 클릭시 Ajax 처리를 해야한다.
	$(function() 
	{
		// 상품평 작성 Ajax 
		$("#goodBtn").click(function() 
		{
			alert($("#comment").val());
			alert($("#good").val());
			$.post("Prod_cmt_Ajax.love", {"comment":$("#comment").val(), "good":$("#good").val()},function(data)
			{
				$("#section5").html(data);
			});
		});
		
		// 상담작성 Ajax
		$("#adviceBtn").click(function() 
		{
			alert($("#advice").val());
			$.post("Adv_Ajax.love", {"advice":$("#advice").val()},function(data)
			{
				$("#section7").html(data);
			});
		});
	});
	
	// 이미지 갯수 컨트롤
	$(function() 
	{
		var imgUrl = "";
		var arr = new Array();
		<c:forEach var="dto" items="${imgList }" varStatus="i">
			imgUrl = imgUrl + "${dto.pth}" + ",";
		</c:forEach>
		
		arr = imgUrl.split(",");
		$("#eq").attr("src", arr[0]);
		for (var i = 0; i < arr.length; i++) 
		{
			if (i < 5)
				$("#images_one1").append("<a href='" + arr[i] + "' title='image" + i + "'><img src='" + arr[i] + "'></a>");
			else if (i < 10) 
				$("#images_one2").append("<a href='" + arr[i] + "' title='image" + i + "'><img src='" + arr[i] + "'></a>");
			else if (i < 15) 
				$("#images_two1").append("<a href='" + arr[i] + "' title='image" + i + "'><img src='" + arr[i] + "'></a>");
			else if (i < 20) 
				$("#images_two2").append("<a href='" + arr[i] + "' title='image" + i + "'><img src='" + arr[i] + "'></a>");
		}
		
		
		
		/*  웨딩홀 버튼누르면 해당 정보나오게하기 */
		// 처음 들어올때 이미지1 을 빼고는 숨긴다
		$("#images_one2").hide();
		$("#images_Ktwo").hide();

		
		// 버튼 클릭시/ 해당정보만 보여주고 그외는 숨긴다.
		$("#liftBtn1").click(function()
		{
			$("#images_one2").hide();
			$("#images_one1").show();
			$("#eq").attr("src", arr[0]);
		});
		
		$("#rightBtn1").click(function()
		{
			$("#images_one1").hide();
			$("#images_one2").show();
			$("#eq").attr("src", arr[5]);
		});
		
		$("#liftBtn2").click(function()
		{
			$("#images_two2").hide();
			$("#images_two1").show();
			$("#eq").attr("src", arr[10]);
		});
		
		$("#rightBtn2").click(function()
		{
			$("#images_two1").hide();
			$("#images_two2").show();
			$("#eq").attr("src", arr[15]);
		});
		
		
		
		//
		
		$("#comment").keyup(function() 
		{
			$("#textCount1").html($("#comment").val().length);
			
		});
		$("#advice").keyup(function() 
		{
			$("#textCount2").html($("#advice").val().length);
			
			
		});
		
	});
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
</script>

	
	
<style type="text/css">

/* 작은이미지 크기조정 */
.thumbs img 
{
	margin-bottom: -30px;
	padding: 0px;
	border: 1px solid black;
	
	width: 64px;
	height: 64px;
}

.thumbs img:HOVER { border: 2px solid red; }

.thumbs { height: 80px; }

/* 홀사진 이지지크기고정 */
#largeImg {	width: 300px; height: 300px; } 

/* 홀사진 화면꽉차게 */
#eq { width: 100%; height: 100%; }

#toggle { background-color: red; }

</style>

</head>
<body>
<div id="wrap">




<div id="menu">
<!-- ul>li 쓸것 -->

   <form action="">
      <ul>
         <li><a class="menu" href="">로고</a></li>
         <li><a class="menu" href="">웨딩홀</a></li>
         <li><a class="menu" href="">스튜디오</a></li>
         <li><a class="menu" href="">드레스</a></li>
         <li><a class="menu" href="">메이크업</a></li>
      </ul>
   </form>
</div>
<br>

<div id="container">
	
	<!-- 웨딩홀 상세정보 -->
	<div id="section1">
		
			<table border="1">
				<tr>
					<th>기업이름</th>
					<td colspan="2">${dto.cmpnyName }</td>
				</tr>
				<tr>
					<th>홈페이지</th>
					<td colspan="2"><a href="${dto.hmpg }">${dto.hmpg }</a></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td colspan="2">${dto.addr1 }</td>
				</tr>
				<tr>
					<th>사  진</th>
					<!-- 큰이미지불러오기 -->
					<td id="largeImg">
						<img src="" id="eq" alt="image1" style="opacity: 1;">
					</td>
					
					<!-- <td>
						<button style="width: 63px;">▲</button><br><br>
						<button id="wedding_one">웨딩홀1</button><br><br>
						<button id="wedding_two">웨딩홀2</button><br><br>
						<button>웨딩홀3</button><br><br>
						<button style="width: 63px;">▼</button>
					</td> -->
					
				</tr>
				<!-- 작은이미지 불러오기 -->				
				<tr id="images_Kone">
					<th colspan="3" class="thumbs">
						<div>
							<span>
								<button id="liftBtn1" style="height: 68px;">◀</button>
							</span>
							<span id="images_one"></span>
							<%-- <c:forEach var="dto" items="${imgList }" varStatus="i">
								<span id="images_one${i.count }">
									<a href="${dto.pth }" title="image${i.count }"><img src="${dto.pth }"></a>
								</span>
							</c:forEach> --%>
							
							<span id="images_one1"></span>
							
							<span id="images_one2"></span>
							
							<span>
								<button style="height: 68px;" id="rightBtn1" onclick="me();">▶</button>
							</span>
						</div>
					</th>
				</tr>
				<tr id="images_Ktwo">	
					<th colspan="3" class="thumbs">
						<div>
							<span>
								<button id="liftBtn2" style="height: 68px;">◀</button>
							</span>
							<span id="images_two1">	
							</span>
							<span id="images_two2">	
							</span>
							<span>	
								<button id="rightBtn2" style="height: 68px;">▶</button>
							</span>
						</div>
					</th>
				</tr>
			</table>
	</div>
	<br>
	
	<!-- 찜하기 / 예약하기 -->
	<div id="section2">
		<button id="love" value="love1" name="love">찜하기♡</button>
		<!--  
		<button id="love1">찜하기♥</button>
		<p><span id="loveSee"></span></p>
		 -->
		
		<%-- <a id="go" target="_blank" href="<%=cp %>/youngjin/wedding_reserve.love">
			<button id="reserve" value="reserve">예약하기</button>
		</a> --%>
	</div>
	<br>
	
	<!-- 홀정보 -->
	<!-- <div id="section3">
		<table border="1">
			<tr>
				<th>요일</th>
				<th>형태/시설구분</th>
				<th>인원</th>
			</tr>
			<tr>
				<td>월~일</td>
				<td>동시/일반홀</td>
				<td>착석:100명, 최대:200명</td>
			</tr>
			
			<tr>
				<th>요일</th>
				<td>
					<select id="userDay" class="select">
						<option id="Mon">-</option>
						<option id="Mon" value="Mon">월요일</option>
						<option id="Tus" value="Tus">화요일</option>
						<option id="Wed" value="Wed">수요일</option>
						<option id="Thu" value="Thu">목요일</option>
						<option id="Fri" value="Fri">금요일</option>
						<option id="Sat" value="Sat">토요일</option>
						<option id="Sun" value="Sun">일요일</option>
					</select>
				</td>
				<td><span id="userDaySee"></span></td>
			</tr>
			<tr>
				<th>홀이름</th>
				<td>
					<select id="userHalltype" class="select">
						기업이올린 가격 아이디
						<option value="">-</option>
						<option value="10">웨딩홀1-10원</option>
						<option value="20">웨딩홀2-20원</option>
						<option value="30">웨딩홀3-30원</option>
						<option value="40">웨딩홀4-40원</option>
					</select>
				</td>
				<td><span id="userHalltypeSee"></span></td>
			</tr>
			<tr>
				<th>식사메뉴</th>
				<td>
					<select id="userEat" class="select">
						<option value="">-</option>
						<option value="10">한식-10원</option>
						<option value="20">중식-20원</option>
						<option value="30">일식-30원</option>
						<option value="40">뷔폐-40원</option>
					</select>
				</td>
				<td><span id="userEatSee"></span></td>
			</tr>
		</table>
		<div>
			총계 : 	<span id="total"></span>원 (선택한값 + 해서 가져오기)
		</div>
	</div> -->
	<br>
	
	<!-- 상품평 쓰는곳 -->
	<div id="section4">
		<form name="prodCmt" id="prodCmt">
			<table border="1">
				<tr>
					<th colspan="4">상품평작성란(<span id="textCount1">0</span>자/200자)</th>
				</tr>
				<tr>
					<td colspan="4">
						<textarea id="comment" name="comment" rows="5" cols="80" placeholder="글작성하기"></textarea>
					</td>
				</tr>
				<tr>
					<th>${srcScore[0]}점 / ${srcScore[1]}명</th>
					<th>5♥♥♥♥♥<br>
						4♥♥♥♥♡<br>
						3♥♥♥♡♡<br>
						2♥♥♡♡♡<br>
						1♥♡♡♡♡
					</th>
					<th>
						<select id="good" name="good">
							<option value="5">♥5 아주좋아요</option>
							<option value="4">♥4 맘에들어요</option>
							<option value="3">♥3 보통이에요</option>
							<option value="2">♥2 그냥그래요</option>
							<option value="1">♥1 별로에요</option>
						</select>
					</th>
					
					<th>
						<button id="goodBtn" type="button">등록하기</button>
					</th>
					
				</tr>	
			</table>
		</form>
	</div>
	
	<!-- 작성한 상품평 올라오는 곳 -->
	<div id="section5">
		<c:forEach var="dto" items="${prodCmtResult }">
			<div>
				<div>작성자 : ${dto.name} 시간 : ${dto.dt } 평점 : ${dto.scr }</div>
				${dto.ctnt }
				
				<div>상품평의 댓글</div>				 
			</div>
		</c:forEach>
	
	
	
	
		<%-- <table border="1" id="commentUp">
			<tr>
				<td colspan="2">상품평 올라오는 곳</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td>작성자:아이디불러오기<br>
					평점:★ 평점불러오기<br>
					<button type="button">삭제</button>
				</td>
			</tr>
			<!-- 상품평 글 올라오는 란 -->
			<c:forEach var="prodCmt" items="${prodCmtResult }">
			<tr>
				<td>
					${prodCmt.prodCtnt }(toggle)
					<br>작성시간 : ${prodCmt.prodDt }
					<button class="downdown" id="toggleClick1">▼</button>
					<button class="upup" id="toggleClick2">▲</button><br>
					
					
					<span id="toggle">글자수초과글입니다!!!!!!</span>
					
					<!-- rvwProdCtnt, rvwProdDt, rvwProdUsrId -->
					<!-- 상품평에 관한 댓글 올라오는 란 -->
					<c:forEach var="rvwProdCmt" items="${prodRvwCmtResult }">
					<div>
						<form>
							<table border="1" id="derUp">
								<tr id="derShow">
									<td colspan="3"><button type="button">댓글보기</button></td>
								</tr>
								<tr id="derHide">
									<td colspan="3"><button type="button">댓글숨기기</button></td>
								</tr>
								<tr id="derSee">
									<td colspan="2">
										<textarea id="der" rows="3" cols="20" placeholder="글작성하기"></textarea>
										<button type="reset" id="derBtn">등록하기</button>
									</td>
								</tr>
								<c:forEach var="rvwProdCmt" items="${prodRvwCmtResult }">
								<tr>
									<th>${rvwProdCmt.rvwProdCtnt }
										<br>${rvwProdCmt.rvwProdDt }
									</th>
									<td>작성자 : ${rvwProdCmt.rvwProdUsrId }</td>
								</tr>
								</c:forEach>
							</table>
						</form>
					</div>
					
					
				</td>	
				
				<td>작성자:${prodCmt.prodUsrId }<br>
					평점:${prodCmt.prodScr }<br>
					
					
					<!-- 평점받아서 하트바꾸기!!!!! -->
					<c:if test="${prodCmt.prodScr } == 3">♥♥♥</c:if>
					
					
					
					<button type="button" class="remove">삭제</button>
				</td>
			</tr>
			</c:forEach>
		</table> --%>
	</div>
	<br>
	
	<!-- 상담하기 쓰는곳(오픈형) -->
	<div id="section6">
		<form>
			<table border="1">
				<tr>
					<th colspan="4">상담내역작성란</th>
				</tr>
				<tr>	
					<td rowspan="2">
						<textarea id="advice" rows="5" cols="80" placeholder="글작성하기"></textarea>
					</td>
					<th>
						문의내역<br>
						(<span id="textCount2">0</span>자/400자)<br>
						<button type="reset" id="adviceBtn">등록하기</button>
					</th>
				</tr>
			</table>
			
		</form>
		<br>
	</div>
	
	<!-- 작성한 상담내역 올라오는 곳 -->
	<div id="section7">
		<c:forEach var="dto" items="${advCmtResult }">
			<div>
				<div>작성자 : ${dto.name} 시간 : ${dto.dt } </div>
				${dto.ctnt }
				
				<div>상담의 댓글</div>				 
			</div>
		</c:forEach>
		
		
		<%-- <table border="1" id="adviceUp">
			<tr>
				<th colspan="2">상담내역 올라오는 곳</th>
			</tr>
			<tr>
				<td>내용</td>
				<td>작성자:아이디불러오기<br>
					<button type="button">삭제</button>
				</td>
			</tr>
			
			<!-- 상담내역 뿌려주는 곳 -->
			<c:forEach var="advCmt" items="${advCmtResult }">
			
			<tr>
			<td>${advCmt.advCtnt }(toggle)
				<br>${advCmt.advdt } 
				<button id="adviceClick1">▼</button>
				<button id="adviceClick2">▲</button><br>
				<span id="advicetoggle">글자수초과글입니다!!!!!!</span>
				
				<div>
					<form>
					<table border="1" id="adviceDerUp">
						<tr id="adviceDerShow">
							<td colspan="3"><button type="button">댓글보기</button></td>
						</tr>
						<tr id="adviceDerHide">
							<td colspan="3"><button type="button">댓글숨기기</button></td>
						</tr>
						<tr id="adviceDerSee">
							<td colspan="2">
								<textarea id="adviceDer" rows="3" cols="20" placeholder="글작성하기"></textarea>
								<button type="reset" id="adviceDerBtn">등록하기</button>
							</td>
						</tr>
						
						<c:forEach var="advRvwCmt" items="${advCmtRvwResult }">
							<th>${advRvwCmt.rvwAdvCtnt }
								<br>${advRvwCmt.rvwAdvDt }
							</th>
							<td>작성자 : ${advRvwCmt.rvwAdvUsrId }</td>
						</c:forEach>
						
					</table>
					</form>
				</div>
			</td>	 
			
			<td>작성자 : ${advCmt.advUsrId }<br>
				<button type="button">삭제</button>
			</td>
		</tr>
		</c:forEach>	
			
		</table> --%>
		
	</div>
	

	
</div><!-- /container -->


</div>
</body>
</html>


























