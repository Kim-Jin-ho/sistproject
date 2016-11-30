<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>할인메인</title>

<link rel="stylesheet" type="text/css" href="css/MenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/TableStyle.css">
<link rel="stylesheet" type="text/css" href="css/MainStyle.css">
<link rel="stylesheet" type="text/css" href="css/wedding_main.css">

<script type="text/javascript" src="ht
tp://code.jquery.com/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery.innerfade.js"></script>

<!-- 지됴영역 -->
<script type="text/javascript">

	$(document).ready(function() 
	{
		
		$(".sido").click(function() 
		{
			// 경로 넣어주고
			var NationwideId = "<%=cp%>/images/"; 
			var region = $(this).attr("id");
			
			// 이미지 넣어주고
			NationwideId = NationwideId + region + ".gif";
			
			alert(NationwideId);
			
			// 이미지를 투입!!!
			$("#regionImg").attr("src", NationwideId);
			
			// 지도가 변경된 지역을 클릭한다면!!!
			if (region == "seoul")
			{
				$("#regionMap").html("<area alt='강남구' class='seoul' id='gangnam' onmouseover=\"point1.src='./images/seoul/gangnam.gif'\" onmouseout=\"point1.src='./images/seoul/seoul.gif'\" shape='poly' coords='293,260,292,258,314,248,337,257,349,271,354,298,377,305,390,312,398,326,406,337,397,354,382,347,367,328,350,330,340,337,326,325,325,315,307,306,302,280,296,256'><area alt='강동구' class='seoul' id='gangdong' onmouseover=\"point1.src='./images/seoul/gangdong.gif'\" onmouseout=\"point1.src='./images/seoul/seoul.gif'\" shape='poly' coords='456,185,455,186,432,202,406,211,396,218,397,233,397,241,406,245,406,258,413,268,425,277,441,251,443,241,463,235,472,225,462,203,463,191,456,184'><area alt='강북구' class='seoul' id='gangbuk' onmouseover=\"point1.src='./images/seoul/gangbuk.gif'\" onmouseout=\"point1.src='./images/seoul/seoul.gif'\" shape='poly' coords='284,52,266,59,269,74,263,86,255,90,261,107,256,117,270,122,279,126,284,135,289,140,293,145,302,147,310,155,319,146,331,142,330,131,303,106,295,104,291,96,296,90,296,82,298,78,296,70,289,66,283,51'><area alt='강서구' class='seoul' id='gangseo' onmouseover=\"point1.src='./images/seoul/gangseo.gif'\" onmouseout=\"point1.src='./images/seoul/seoul.gif'\" shape='poly' coords='131,200,140,213,156,221,163,226,166,233,159,239,150,237,137,235,136,247,133,258,115,263,111,249,103,245,98,252,86,239,69,244,62,238,49,236,35,222,52,202,55,193,68,180,64,165,77,156,103,183,131,200'><area alt='관악구' class='seoul' id='gwanak' onmouseover=\"point1.src='./images/seoul/gwanak.gif'\" onmouseout=\"point1.src='./images/seoul/seoul.gif'\" shape='poly' coords='180,317,181,317,200,310,205,302,216,311,227,306,240,307,244,326,259,331,269,342,261,350,255,366,240,370,234,377,211,375,203,361,196,355,192,345,182,334,190,328,181,314'><area alt='광진구' class='seoul' id='gwangjin' onmouseover=\"point1.src='./images/seoul/gwangjin.gif'\" onmouseout=\"point1.src='./images/seoul/seoul.gif'\" shape='poly' coords='382,199,381,199,373,208,363,205,355,218,357,231,347,242,344,250,341,258,351,268,364,266,382,260,395,240,396,228,392,215,381,207,381,197'><area alt='구로구' class='seoul' id='guro' onmouseover=\"point1.src='./images/seoul/guro.gif'\" onmouseout=\"point1.src='./images/seoul/seoul.gif'\" shape='poly' coords='95,277,95,278,90,299,93,312,87,326,112,331,122,318,130,317,138,302,150,308,159,313,162,323,174,323,177,314,168,295,157,275,145,280,144,291,133,284,119,285,114,291,106,295,98,275'><area alt='금천구' class='seoul' id='geumcheon' onmouseover=\"point1.src='./images/seoul/geumcheon.gif'\" onmouseout=\"point1.src='./images/seoul/seoul.gif'\" shape='poly' coords='151,307,161,317,164,322,185,324,186,329,184,341,192,345,192,353,198,356,202,361,189,375,172,377,171,367,158,348,163,341,159,333,150,326,148,304'><area alt='노원구' class='seoul' id='nowon' onmouseover=\"point1.src='./images/seoul/nowon.gif'\" onmouseout=\"point1.src='./images/seoul/seoul.gif'\" shape='poly' coords='361,39,361,40,346,47,335,50,334,64,329,74,336,83,338,95,339,109,334,115,325,120,326,129,331,136,335,145,349,151,364,141,373,141,382,143,385,137,384,130,395,120,391,105,377,101,368,91,372,84,378,78,375,61,381,49,372,47,364,47,360,38'><area alt='도봉구' class='seoul' id='dobong' onmouseover=\"point1.src='./images/seoul/dobong.gif'\" onmouseout=\"point1.src='./images/seoul/seoul.gif'\" shape='poly' coords='283,52,282,52,293,69,300,73,300,81,293,86,294,95,293,102,302,105,321,124,326,113,334,113,339,103,336,86,328,74,332,63,335,49,322,42,312,43,306,33,293,30,282,52'><area alt='동대문구' class='seoul' id='dongdaemun' onmouseover=\"point1.src='./images/seoul/dongdaemun.gif'\" onmouseout=\"point1.src='./images/seoul/seoul.gif'\" shape='poly' coords='353,158,351,158,342,161,340,165,327,168,321,172,320,179,312,187,306,195,309,202,322,198,330,201,335,213,346,214,353,216,361,203,359,186,349,183,347,169,356,164,352,155'><area alt='동작구' class='seoul' id='dongjak' onmouseover=\"point1.src='./images/seoul/dongjak.gif'\" onmouseout=\"point1.src='./images/seoul/seoul.gif'\" shape='poly' coords='225,270,214,278,203,278,195,289,197,302,181,309,176,319,199,312,205,304,212,304,216,311,226,303,233,309,240,305,242,311,244,324,249,330,259,329,263,322,262,305,264,297,257,294,258,280,245,277,223,267'><area alt='마포구' class='seoul' id='mapo' onmouseover=\"point1.src='./images/seoul/mapo.gif'\" onmouseout=\"point1.src='./images/seoul/seoul.gif'\" shape='poly' coords='242,228,237,219,224,224,202,222,197,209,180,199,174,185,171,178,157,175,145,186,147,196,131,199,152,220,160,223,168,235,190,247,206,249,214,261,220,262,222,250,226,246,231,248,238,244,236,234,243,226'><area alt='서대문구' class='seoul' id='seodaemun' onmouseover=\"point1.src='./images/seoul/seodaemun.gif'\" onmouseout=\"point1.src='./images/seoul/seoul.gif'\" shape='poly' coords='224,160,223,160,216,163,207,176,197,187,181,194,182,200,199,211,202,223,220,223,237,221,242,206,235,195,235,179,235,167,225,159'  ><area alt='서초구' class='seoul' id='seocho' onmouseover=\"point1.src='./images/seoul/seocho.gif'\" onmouseout=\"point1.src='./images/seoul/seoul.gif'\" shape='poly' coords='291,263,284,273,277,281,258,283,263,296,268,307,262,320,263,333,272,346,277,336,286,344,291,352,300,353,308,341,315,347,318,376,338,391,350,387,355,371,371,369,370,357,378,348,366,328,347,336,336,342,325,330,311,312,301,289,298,273,292,262' ><area alt='성동구' class='seoul' id='seongdong' onmouseover=\"point1.src='./images/seoul/seongdong.gif'\" onmouseout=\"point1.src='./images/seoul/seoul.gif'\" shape='poly' coords='308,202,302,207,305,217,296,224,287,235,298,254,309,245,327,248,338,255,345,247,343,238,354,228,354,217,331,212,327,200,317,199,307,200' ><area alt='성북구' class='seoul' id='seongbuk' onmouseover=\"point1.src='./images/seoul/seongbuk.gif'\" onmouseout=\"point1.src='./images/seoul/seoul.gif'\" shape='poly' coords='353,149,352,149,355,161,342,159,335,170,318,171,314,180,309,190,304,192,289,189,282,178,271,173,266,172,264,164,265,152,261,137,253,122,261,119,267,124,278,125,287,134,292,143,301,148,309,156,321,146,332,142,340,151,350,148' ><area alt='송파구' class='seoul' id='songpa' onmouseover=\"point1.src='./images/seoul/songpa.gif'\" onmouseout=\"point1.src='./images/seoul/seoul.gif'\" shape='poly' coords='395,241,395,240,380,265,367,269,349,269,352,288,356,294,374,298,387,306,392,310,400,321,404,328,408,339,418,335,415,326,426,325,436,325,435,312,442,308,446,291,425,289,421,276,408,266,403,257,404,249,396,238' ><area alt='양천구' class='seoul' id='yangcheon' onmouseover=\"point1.src='./images/seoul/yangcheon.gif'\" onmouseout=\"point1.src='./images/seoul/seoul.gif'\" shape='poly' coords='96,251,95,274,98,284,106,288,107,298,115,292,120,283,134,286,142,291,149,279,159,276,157,265,165,251,163,238,148,234,133,234,134,252,124,261,112,259,111,248,104,244,95,250' ><area alt='영등포구' class='seoul' id='yeongdeungpo' onmouseover=\"point1.src='./images/seoul/yeongdeungpo.gif'\" onmouseout=\"point1.src='./images/seoul/seoul.gif'\" shape='poly' coords='167,232,161,241,164,255,157,264,158,279,168,287,173,311,176,318,186,303,197,299,200,291,204,274,216,274,223,268,219,260,212,259,204,246,188,247,167,228' ><area alt='용산구' class='seoul' id='yongsan' onmouseover=\"point1.src='./images/seoul/yongsan.gif'\" onmouseout=\"point1.src='./images/seoul/seoul.gif'\" shape='poly' coords='247,227,256,226,267,233,285,237,291,246,296,248,298,254,289,262,283,274,275,281,259,283,252,278,242,280,236,271,224,270,220,259,223,250,229,245,232,250,238,244,236,234,246,225' ><area alt='은평구' class='seoul' id='eunpyeing' onmouseover=\"point1.src='./images/seoul/eunpyeong.gif'\" onmouseout=\"point1.src='./images/seoul/seoul.gif'\" shape='poly' coords='250,121,250,120,237,106,231,91,215,90,201,100,184,109,180,134,174,151,177,171,174,182,177,197,195,180,210,172,221,156,229,146,224,133,237,126,249,119'  ><area alt='종로구' class='seoul' id='jongno' onmouseover=\"point1.src='./images/seoul/jongno.gif'\" onmouseout=\"point1.src='./images/seoul/seoul.gif'\" shape='poly' coords='250,123,250,122,234,132,226,145,231,151,222,161,237,166,237,184,234,195,241,208,255,203,267,210,277,203,294,205,303,202,302,192,282,190,278,176,266,176,259,168,267,158,260,137,247,120'><area alt='중구' class='seoul' id='junggu' onmouseover=\"point1.src='./images/seoul/junggu.gif'\" onmouseout=\"point1.src='./images/seoul/seoul.gif'\" shape='poly' coords='246,208,239,220,245,227,255,226,270,234,284,237,296,221,305,212,301,203,286,207,273,205,261,210,245,205'  ><area alt='중랑구' class='seoul' id='jungnang' onmouseover=\"point1.src='./images/seoul/jungnang.gif'\" onmouseout=\"point1.src='./images/seoul/seoul.gif'\" shape='poly' coords='369,140,368,140,355,150,357,159,355,168,350,171,355,184,362,187,362,205,372,202,383,196,391,185,392,176,400,170,398,141,385,136,377,146,369,139' >");
				$("#regionMap>area").click(function() 
				{
					alert($(this).attr("alt"));
				});
			}
			// 제주도
			else if (region == "jeju")
			{
				$("#regionMap").html("<area alt='제주시' class='jeju' id='jejeju' onmouseover=\"point1.src='./images/jeju/jejeju.gif'\" onmouseout=\"point1.src='./images/jeju/jeju.gif'\" shape='poly' coords='152,192,161,185,207,171,232,163,252,166,291,153,313,151,347,149,374,153,384,164,395,158,410,170,410,178,389,177,344,204,326,202,316,213,287,217,257,227,219,231,203,235,175,235,155,242,127,258,101,253,95,262,98,233,115,219,131,213,136,196,153,190'><area alt='서귀포시' class='jeju' id='seogwipo' onmouseover=\"point1.src='./images/jeju/seogwipo.gif'\" onmouseout=\"point1.src='./images/jeju/jeju.gif'\" shape='poly' coords='132,263,160,248,169,239,206,241,219,232,248,235,258,228,275,229,315,217,328,205,345,206,359,199,397,179,409,180,414,194,404,218,396,222,384,243,366,253,340,263,313,266,285,284,264,278,232,286,210,278,192,281,167,283,155,283,145,300,129,289,103,274,98,262,109,257,133,264'>");
				$("#regionMap>area").click(function() 
				{
					alert($(this).attr("alt"));
				});	
			}
			
			// 부산
			else if (region == "busan")
			{
				$("#regionMap").html("<area alt='강서구' class='busan' id='gangseo' onmouseover=\"point1.src='./images/busan/gangseo.gif'\" onmouseout=\"point1.src='./images/busan/busan.gif'\" shape='poly' coords='153,205,178,197,198,190,210,195,228,189,229,209,217,219,199,231,197,271,194,289,174,313,175,333,163,357,144,349,132,350,125,395,117,419,93,413,79,380,70,368,71,351,88,333,101,315,117,304,108,288,88,283,78,270,84,259,103,261,117,256,130,258,136,269,142,253,135,245,144,238,143,228,133,223,134,212,155,204'><area alt='금정구' class='busan' id='geumjeong' onmouseover=\"point1.src='./images/busan/geumjeong.gif'\" onmouseout=\"point1.src='./images/busan/busan.gif'\" shape='poly' coords='285,132,300,120,325,127,325,138,324,156,326,165,336,162,340,177,331,185,322,195,316,208,298,197,280,196,270,187,268,174,263,165,267,152,271,144,273,135,287,130'><area alt='남구' class='busan' id='namgu' onmouseover=\"point1.src='./images/busan/namgu.gif'\" onmouseout=\"point1.src='./images/busan/busan.gif'\" shape='poly' coords='295,266,302,258,310,264,315,278,323,280,330,297,326,311,311,310,306,314,296,307,286,305,280,295,283,284,281,272,285,262,296,264'><area alt='동구' class='busan' id='donggu' onmouseover=\"point1.src='./images/busan/donggu.gif'\" onmouseout=\"point1.src='./images/busan/busan.gif'\" shape='poly' coords='256,280,263,274,267,266,275,276,282,276,281,286,280,296,268,301,253,297,256,278'><area alt='동래구' class='busan' id='dongnae' onmouseover=\"point1.src='./images/busan/dongnae.gif'\" onmouseout=\"point1.src='./images/busan/busan.gif'\" shape='poly' coords='278,202,292,197,305,206,316,211,320,232,308,230,304,222,294,218,283,217,277,223,264,220,277,200'><area alt='부산진구' class='busan' id='busanjin' onmouseover=\"point1.src='./images/busan/busanjin.gif'\" onmouseout=\"point1.src='./images/busan/busan.gif'\" shape='poly' coords='249,229,263,223,266,232,279,234,289,243,295,251,298,259,291,265,285,263,280,274,266,265,258,274,247,278,244,273,243,261,242,246,249,238,248,226'><area alt='북구' class='busan' id='bukgu' onmouseover=\"point1.src='./images/busan/bukgu.gif'\" onmouseout=\"point1.src='./images/busan/busan.gif'\" shape='poly' coords='230,182,235,169,239,154,247,146,258,147,268,146,266,155,262,160,267,168,269,185,278,195,274,204,260,221,235,227,223,221,231,207,229,180'><area alt='사상구' class='busan' id='sasang' onmouseover=\"point1.src='./images/busan/sasang.gif'\" onmouseout=\"point1.src='./images/busan/busan.gif'\" shape='poly' coords='220,223,241,232,248,230,246,239,240,245,239,261,243,270,237,276,227,288,217,290,211,299,202,288,205,256,201,242,207,232,220,222'><area alt='사하구' class='busan' id='saha' onmouseover=\"point1.src='./images/busan/saha.gif'\" onmouseout=\"point1.src='./images/busan/busan.gif'\" shape='poly' coords='189,323,180,324,179,308,192,293,203,291,213,299,222,293,239,300,239,316,236,328,227,332,231,353,222,355,220,373,206,366,199,349,198,336,199,325,189,322'><area alt='서구' class='busan' id='bsseogu' onmouseover=\"point1.src='./images/busan/bsseogu.gif'\" onmouseout=\"point1.src='./images/busan/busan.gif'\" shape='poly' coords='235,282,240,274,250,280,253,291,250,301,245,309,255,325,250,357,243,350,241,332,245,317,240,305,231,292,236,282'><area alt='수영구' class='busan' id='suyeong' onmouseover=\"point1.src='./images/busan/suyeong.gif'\" onmouseout=\"point1.src='./images/busan/busan.gif'\" shape='poly' coords='307,233,323,235,338,260,327,260,323,277,313,269,309,257,300,257,299,250,306,244,307,231'><area alt='연제구' class='busan' id='yeonje' onmouseover=\"point1.src='./images/busan/yeonje.gif'\" onmouseout=\"point1.src='./images/busan/busan.gif'\" shape='poly' coords='263,220,282,227,290,218,307,226,308,233,297,253,289,240,278,239,272,233,264,221'><area alt='영도구' class='busan' id='yeongdo' onmouseover=\"point1.src='./images/busan/yeongdo.gif'\" onmouseout=\"point1.src='./images/busan/busan.gif'\" shape='poly' coords='271,308,293,320,306,326,302,332,307,347,307,353,299,357,287,343,269,338,259,325,260,317,270,306'><area alt='중구' class='busan' id='bsjunggu' onmouseover=\"point1.src='./images/busan/bsjunggu.gif'\" onmouseout=\"point1.src='./images/busan/busan.gif'\" shape='poly' coords='253,299,248,307,254,319,263,315,269,310,270,304,252,29'><area alt='해운대구' class='busan' id='haeundae' onmouseover=\"point1.src='./images/busan/haeundae.gif'\" onmouseout=\"point1.src='./images/busan/busan.gif'\" shape='poly' coords='330,191,337,187,336,178,342,176,350,179,358,190,357,196,352,208,354,215,365,219,372,225,379,227,384,218,387,245,381,248,373,253,352,254,340,256,324,235,324,213,320,207,324,202,324,194,332,18'><area alt='기장군' class='busan' id='gijang' onmouseover=\"point1.src='./images/busan/gijang.gif'\" onmouseout=\"point1.src='./images/busan/busan.gif'\" shape='poly' coords='325,95,320,86,337,66,347,67,359,74,374,67,376,45,395,46,404,48,426,44,441,57,444,86,461,96,461,113,447,115,432,107,428,118,424,152,417,188,411,209,416,234,394,232,387,216,375,218,372,226,364,213,351,207,362,191,354,180,339,172,337,162,324,158,322,138,324,127,307,117,317,102,324,94'>");
				$("#regionMap>area").click(function()  
				{
					alert($(this).attr("alt"));
				});	
			}	
			// 대구
			else if (region == "daegu")
			{
				$("#regionMap").html("<area alt='남구' class='daegu' id='daegunamgu' onmouseover=\"point1.src='./images/daegu/daegunamgu.gif'\" onmouseout=\"point1.src='./images/daegu/daegu.gif'\" shape='poly' coords='262,189,259,204,252,210,258,220,270,234,281,220,282,197,284,188,271,194,261,187'><area alt='달서구' class='daegu' id='dalseo' onmouseover=\"point1.src='./images/daegu/dalseo.gif'\" onmouseout=\"point1.src='./images/daegu/daegu.gif'\" shape='poly' coords='190,191,201,189,222,189,232,188,241,194,259,190,256,205,250,210,261,226,271,235,260,241,260,258,244,265,239,251,220,243,217,234,201,228,192,226,187,209,190,188'><area alt='동구' class='daegu' id='daegudonggu' onmouseover=\"point1.src='./images/daegu/daegudonggu.gif'\" onmouseout=\"point1.src='./images/daegu/daegu.gif'\" shape='poly' coords='282,79,286,69,303,64,313,68,324,63,351,68,364,74,372,93,368,105,371,116,371,131,375,143,385,145,384,160,388,166,384,184,369,193,356,185,346,192,333,177,323,171,310,170,300,182,287,178,291,168,296,158,299,140,294,122,293,96,282,79'><area alt='북구' class='daegu' id='daegubukgu' onmouseover=\"point1.src='./images/daegu/daegubukgu.gif'\" onmouseout=\"point1.src='./images/daegu/daegu.gif'\" shape='poly' coords='240,104,253,91,267,90,278,82,288,90,291,122,297,132,295,156,296,167,288,167,286,174,269,174,256,168,251,162,236,157,233,163,225,165,212,160,215,148,226,141,231,126,230,109,227,97,228,90,242,103'><area alt='서구' class='daegu' id='daeguseogu' onmouseover=\"point1.src='./images/daegu/daeguseogu.gif'\" onmouseout=\"point1.src='./images/daegu/daegu.gif'\" shape='poly' coords='238,162,251,165,260,170,262,183,254,187,241,192,233,187,218,181,221,173,228,165,238,161'><area alt='수성구' class='daegu' id='suseong' onmouseover=\"point1.src='./images/daegu/suseong.gif'\" onmouseout=\"point1.src='./images/daegu/daegu.gif'\" shape='poly' coords='282,206,287,196,294,185,306,181,322,179,334,188,347,196,360,190,361,204,350,210,356,223,352,237,348,247,335,253,323,238,311,239,302,233,272,236,274,226,285,216,282,202'><area alt='중구' class='daegu' id='daegujunggu' onmouseover=\"point1.src='./images/daegu/daegujunggu.gif'\" onmouseout=\"point1.src='./images/daegu/daegu.gif'\" shape='poly' coords='262,170,263,182,261,190,268,191,282,191,284,179,285,173,270,175,263,167'><area alt='달성군' class='daegu' id='dalseong1' onmouseover=\"point1.src='./images/daegu/dalseong.gif'\" onmouseout=\"point1.src='./images/daegu/daegu.gif'\" shape='poly' coords='189,230,213,235,230,254,244,264,259,265,267,244,291,238,315,247,335,267,340,286,336,300,312,314,290,317,289,289,274,293,262,292,246,295,240,307,230,313,234,329,227,340,212,349,217,365,212,378,179,374,159,392,131,400,121,395,144,383,143,369,119,347,108,337,111,320,123,319,147,323,167,323,165,300,153,293,134,288,134,274,139,262,143,246,152,236,189,229'><area alt='달성군' class='daegu' id='dalseong2' onmouseover=\"point1.src='./images/daegu/dalseong.gif'\" onmouseout=\"point1.src='./images/daegu/daegu.gif'\" shape='poly' coords='189,142,193,127,188,122,176,122,158,135,146,154,141,170,128,196,148,203,162,199,189,213,186,190,194,183,203,186,220,186,220,175,221,164,208,164,197,162,185,152,188,140'>");
				$("#regionMap>area").click(function() 
				{
					alert($(this).attr("alt"));
				});	
			}
			// 경북
			else if (region == "gyeongbuk")
			{
				$("#regionMap").html("<area alt='경산시' class='gyeongbuk' id='gbgs' shape='poly' onmouseover=\"point1.src='./images/gyeongbuk/gyeongbuk.gif'\" onmouseout=\"point1.src='./images/gyeongbuk/gyeongbuk.gif'\" coords='275,315,286,318,294,332,298,346,313,346,310,364,288,371,275,380,263,372,271,352,281,335,274,324,276,313'><area alt='경주시' class='gyeongbuk' id='gyeongju' onmouseover=\"point1.src='./images/gyeongbuk/gyeongju.gif'\" onmouseout=\"point1.src='./images/gyeongbuk/gyeongbuk.gif'\" shape='poly' coords='326,344,336,324,349,325,346,311,359,298,376,291,381,308,385,328,391,339,409,340,424,348,422,366,415,386,397,388,380,390,376,375,339,379,345,395,330,395,324,378,321,364,317,348,326,342'><area alt='구미시' class='gyeongbuk' id='gumi' onmouseover=\"point1.src='./images/gyeongbuk/gumi.gif'\" onmouseout=\"point1.src='./images/gyeongbuk/gyeongbuk.gif'\" shape='poly' coords='175,233,190,231,202,239,213,254,221,262,235,277,231,287,220,295,210,288,198,292,186,290,185,278,183,268,178,262,162,254,160,247,175,240,174,231'><area alt='김천시' class='gyeongbuk' id='gimcheon' onmouseover=\"point1.src='./images/gyeongbuk/gimcheon.gif'\" onmouseout=\"point1.src='./images/gyeongbuk/gyeongbuk.gif'\" shape='poly' coords='135,255,140,270,125,272,125,281,119,295,107,306,101,310,110,321,108,337,121,350,139,350,139,341,136,329,142,326,151,323,161,313,160,300,171,297,184,300,184,288,182,280,180,271,172,261,166,260,152,252,148,261,133,255'><area alt='문경시' class='gyeongbuk' id='mungyeong' onmouseover=\"point1.src='./images/gyeongbuk/mungyeong.gif'\" onmouseout=\"point1.src='./images/gyeongbuk/gyeongbuk.gif'\" shape='poly' coords='144,144,130,134,132,125,144,124,156,119,169,114,180,111,188,124,198,129,202,138,195,143,192,157,186,166,179,172,190,178,185,183,175,190,167,180,154,173,142,173,135,183,135,189,124,189,115,188,113,176,114,160,107,157,112,150,116,145,134,148,144,140'><area alt='상주시' class='gyeongbuk' id='sangju' onmouseover=\"point1.src='./images/gyeongbuk/sangju.gif'\" onmouseout=\"point1.src='./images/gyeongbuk/gyeongbuk.gif'\" shape='poly' coords='122,194,133,189,146,189,137,173,152,173,165,189,174,196,180,203,194,208,190,222,182,228,168,229,166,238,157,247,143,252,128,251,122,250,112,247,104,242,104,235,104,224,103,207,106,198,109,188,94,178,100,169,110,170,120,194'><area alt='안동시' class='gyeongbuk' id='andong' onmouseover=\"point1.src='./images/gyeongbuk/andong.gif'\" onmouseout=\"point1.src='./images/gyeongbuk/gyeongbuk.gif'\" shape='poly' coords='242,160,245,148,262,148,275,146,271,130,281,125,294,135,311,138,317,155,317,168,316,198,313,213,313,227,303,241,298,216,292,204,278,199,263,201,250,210,234,200,222,196,222,187,231,172,244,158'><area alt='영주시' class='gyeongbuk' id='yeongju' onmouseover=\"point1.src='./images/gyeongbuk/yeongju.gif'\" onmouseout=\"point1.src='./images/gyeongbuk/gyeongbuk.gif'\" shape='poly' coords='258,65,246,64,230,73,222,85,207,102,209,115,216,118,227,136,234,132,240,145,249,145,265,149,268,132,260,121,271,114,257,116,248,106,254,95,262,85,262,79,266,68,258,65'><area alt='영천시' class='gyeongbuk' id='yeongch' onmouseover=\"point1.src='./images/gyeongbuk/yeongch.gif'\" onmouseout=\"point1.src='./images/gyeongbuk/gyeongbuk.gif'\" shape='poly' coords='291,284,303,277,309,268,330,277,341,289,350,297,349,306,344,313,345,331,338,327,329,330,325,344,315,351,303,344,297,331,291,315,275,309,262,309,269,294,268,290,285,290,293,284'><area alt='포항시' class='gyeongbuk' id='pohang' onmouseover=\"point1.src='./images/gyeongbuk/pohang.gif'\" onmouseout=\"point1.src='./images/gyeongbuk/gyeongbuk.gif'\" shape='poly' coords='331,266,336,258,337,248,352,252,367,258,365,241,378,233,385,251,399,260,400,272,406,284,404,292,394,297,403,305,421,303,428,291,437,299,425,324,428,338,427,349,416,344,411,337,397,337,381,317,383,301,372,291,363,296,351,295,339,286,332,278,322,272,332,264'><area alt='고령군' class='gyeongbuk' id='goryeong' onmouseover=\"point1.src='./images/gyeongbuk/goryeong.gif'\" onmouseout=\"point1.src='./images/gyeongbuk/gyeongbuk.gif'\" shape='poly' coords='176,363,186,356,193,360,205,354,205,346,213,346,225,354,205,362,205,371,213,376,208,384,198,387,211,400,208,404,189,391,175,391,164,387,168,373,162,363,175,362'><area alt='군위군' class='gyeongbuk' id='gunwi' onmouseover=\"point1.src='./images/gyeongbuk/gunwi.gif'\" onmouseout=\"point1.src='./images/gyeongbuk/gyeongbuk.gif'\" shape='poly' coords='213,240,226,244,240,250,245,245,253,261,273,268,290,265,300,265,300,277,287,279,293,290,284,293,271,287,268,287,264,308,251,308,249,291,242,290,236,280,233,268,223,265,223,262,211,257,211,240'><area alt='봉화군' class='gyeongbuk' id='bonghwa' onmouseover=\"point1.src='./images/gyeongbuk/bonghwa.gif'\" onmouseout=\"point1.src='./images/gyeongbuk/gyeongbuk.gif'\" shape='poly' coords='267,70,281,63,303,64,316,60,333,59,348,63,333,78,333,94,341,102,336,117,317,129,301,130,289,125,281,123,264,127,269,112,259,110,252,101,259,86,267,68'><area alt='성주군' class='gyeongbuk' id='seongju' onmouseover=\"point1.src='./images/gyeongbuk/seongju.gif'\" onmouseout=\"point1.src='./images/gyeongbuk/gyeongbuk.gif'\" shape='poly' coords='163,315,169,308,181,302,190,311,191,323,208,332,204,342,200,350,199,360,187,351,180,351,180,361,169,354,161,353,165,365,147,354,141,335,149,329,164,314'><area alt='영덕군' class='gyeongbuk' id='youngduk' onmouseover=\"point1.src='./images/gyeongbuk/youngduk.gif'\" onmouseout=\"point1.src='./images/gyeongbuk/gyeongbuk.gif'\" shape='poly' coords='367,181,364,169,369,157,374,155,392,159,397,155,404,175,407,192,407,210,396,228,396,252,382,249,379,233,369,233,360,219,350,198,364,194,369,180'><area alt='영양군' class='gyeongbuk' id='yeongyang' onmouseover=\"point1.src='./images/gyeongbuk/yeongyang.gif'\" onmouseout=\"point1.src='./images/gyeongbuk/gyeongbuk.gif'\" shape='poly' coords='321,133,329,120,341,115,346,107,359,110,368,115,372,110,377,128,374,138,366,150,363,166,364,180,365,193,350,194,339,182,332,174,321,174,320,163,318,147,312,137,323,132'><area alt='예천군' class='gyeongbuk' id='yecheon' onmouseover=\"point1.src='./images/gyeongbuk/yecheon.gif'\" onmouseout=\"point1.src='./images/gyeongbuk/gyeongbuk.gif'\" shape='poly' coords='198,127,210,124,211,117,219,131,228,138,238,144,241,151,243,162,231,162,225,174,224,181,214,186,205,193,194,190,193,201,186,203,172,189,189,186,193,179,180,173,185,162,196,159,191,144,200,137,195,125'><area alt='울진군' class='gyeongbuk' id='uljin' onmouseover=\"point1.src='./images/gyeongbuk/uljin.gif'\" onmouseout=\"point1.src='./images/gyeongbuk/gyeongbuk.gif'\" shape='poly' coords='359,67,369,54,378,44,385,43,402,62,398,69,398,91,410,127,409,141,403,160,391,152,378,156,368,142,379,131,373,113,373,105,355,106,340,97,336,87,335,78,346,71,361,64'><area alt='의성군' class='gyeongbuk' id='uiseong' onmouseover=\"point1.src='./images/gyeongbuk/uiseong.gif'\" onmouseout=\"point1.src='./images/gyeongbuk/gyeongbuk.gif'\" shape='poly' coords='194,208,194,198,200,191,210,193,218,203,226,197,243,211,264,214,270,200,282,205,293,213,297,230,297,246,299,265,283,262,273,269,253,260,247,245,231,245,220,237,203,237,189,225,195,207'><area alt='청도군' class='gyeongbuk' id='cheongdo' onmouseover=\"point1.src='./images/gyeongbuk/cheongdo.gif'\" onmouseout=\"point1.src='./images/gyeongbuk/gyeongbuk.gif'\" shape='poly' coords='234,377,243,371,253,382,265,375,274,381,284,373,298,372,310,366,318,348,318,358,325,378,332,394,321,401,307,396,300,398,296,406,280,407,262,410,244,409,232,397,233,376'><area alt='청송군' class='gyeongbuk' id='cheongsong' onmouseover=\"point1.src='./images/gyeongbuk/cheongsong.gif'\" onmouseout=\"point1.src='./images/gyeongbuk/gyeongbuk.gif'\" shape='poly' coords='335,179,321,173,318,177,319,195,315,204,314,225,308,240,299,247,299,261,309,268,323,273,327,263,333,257,337,246,349,253,359,256,361,245,367,233,359,212,349,197,340,184,334,178'><area alt='칠곡군' class='gyeongbuk' id='chilgok' onmouseover=\"point1.src='./images/gyeongbuk/chilgok.gif'\" onmouseout=\"point1.src='./images/gyeongbuk/gyeongbuk.gif'\" shape='poly' coords='197,296,208,291,221,300,225,290,234,285,240,298,249,296,252,308,235,319,224,337,219,324,207,332,196,321,192,313,184,302,186,287,199,296'>");
				$("#regionMap>area").click(function() 
				{
					alert($(this).attr("alt"));
				});	
			}
			// 울산
			else if (region == "ulsan")
			{
				$("#regionMap").html("<area alt='남구' class='ulsan' id='ulsannamgu' onmouseover=\"point1.src='./images/ulsan/ulsannamgu.gif'\" onmouseout=\"point1.src='./images/ulsan/ulsan.gif'\" shape='poly' coords='296,221,306,215,322,216,336,214,356,235,360,252,361,259,356,267,345,277,331,268,319,259,307,252,297,249,290,235,276,225,265,223,264,215,276,210,289,213,296,221'><area alt='동구' class='ulsan' id='ulsandonggu' onmouseover=\"point1.src='./images/ulsan/ulsandonggu.gif'\" onmouseout=\"point1.src='./images/ulsan/ulsan.gif'\" shape='poly' coords='367,217,373,205,387,200,403,198,403,209,397,215,397,226,393,235,393,250,384,264,369,267,360,265,364,253,360,241,364,233,374,231,367,217'><area alt='북구' class='ulsan' id='ulsanbukgu' onmouseover=\"point1.src='./images/ulsan/ulsanbukgu.gif'\" onmouseout=\"point1.src='./images/ulsan/ulsan.gif'\" shape='poly' coords='296,179,295,164,298,153,298,140,313,134,325,121,337,121,346,128,359,124,377,133,395,138,390,149,395,158,407,169,407,183,400,185,397,192,389,197,372,196,369,203,364,214,368,230,358,232,334,208,334,192,331,178,319,177,312,175,295,179'><area alt='중구' class='ulsan' id='ulsanjunggu' onmouseover=\"point1.src='./images/ulsan/ulsanjunggu.gif'\" onmouseout=\"point1.src='./images/ulsan/ulsan.gif'\" shape='poly' coords='296,187,308,183,317,178,327,181,331,197,334,210,322,213,307,212,298,217,285,209,275,207,275,198,276,191,286,188,295,185'><area alt='울주군' class='ulsan' id='ulju' onmouseover=\"point1.src='./images/ulsan/ulju.gif'\" onmouseout=\"point1.src='./images/ulsan/ulsan.gif'\" shape='poly' coords='182,109,203,92,212,102,221,95,241,95,246,103,266,108,270,114,272,127,272,144,292,144,293,159,292,182,289,189,278,185,267,190,273,207,259,215,264,224,278,232,296,255,316,260,327,269,346,281,352,306,346,329,341,356,331,356,323,367,308,372,292,360,290,342,278,329,270,326,256,336,239,326,249,315,238,300,240,291,233,292,222,296,203,289,188,276,182,261,167,245,155,242,139,238,118,230,105,222,92,206,106,196,123,190,125,175,125,168,113,167,121,156,135,158,139,146,157,151,159,143,153,128,155,114,171,104,183,109'>");
				$("#regionMap>area").click(function() 
				{
					alert($(this).attr("alt"));
				});
			}
			// 전남
			else if (region == "jeonnam")
			{
				$("#regionMap").html("<area alt='광양시' class='jeonnam' id='gwangyang' onmouseover=\"point1.src='./images/jeonnam/gwangyang.gif'\" onmouseout=\"point1.src='./images/jeonnam/jeonnam.gif'\" shape='poly' coords='412,165,425,159,428,150,430,143,437,151,442,162,462,177,461,196,446,204,436,214,422,208,415,203,412,191,415,184,411,178,406,172,411,165'><area alt='나주시' class='jeonnam' id='naju' onmouseover=\"point1.src='./images/jeonnam/naju.gif'\" onmouseout=\"point1.src='./images/jeonnam/jeonnam.gif'\" shape='poly' coords='216,167,228,163,236,165,249,175,260,180,274,170,272,180,270,190,269,211,263,223,254,224,239,216,231,202,222,204,226,217,215,214,206,211,201,220,196,208,199,198,213,192,209,172,217,164'><area alt='목포시' class='jeonnam' id='mokpo' onmouseover=\"point1.src='./images/jeonnam/mokpo.gif'\" onmouseout=\"point1.src='./images/jeonnam/jeonnam.gif'\" shape='poly' coords='168,228,163,236,164,252,171,259,179,250,182,242,169,225'><area alt='순천시' class='jeonnam' id='suncheon' onmouseover=\"point1.src='./images/jeonnam/suncheon.gif'\" onmouseout=\"point1.src='./images/jeonnam/jeonnam.gif'\" shape='poly' coords='342,154,351,165,359,171,370,171,371,162,381,159,386,151,386,143,400,152,410,165,410,174,409,182,414,185,417,193,413,200,421,208,417,217,412,229,404,221,398,229,383,232,371,221,360,216,351,219,344,207,339,194,335,184,335,171,338,159,342,153'><area alt='여수시' class='jeonnam' id='yeosu' onmouseover=\"point1.src='./images/jeonnam/yeosu.gif'\" onmouseout=\"point1.src='./images/jeonnam/jeonnam.gif'\"  shape='poly' coords='419,216,427,231,439,235,450,230,460,226,462,239,461,246,459,255,447,257,437,253,434,267,434,279,430,284,417,279,408,268,419,258,421,247,408,238,409,228,415,223,419,214'><area alt='강진군' class='jeonnam' id='gangjin' onmouseover=\"point1.src='./images/jeonnam/gangjin.gif'\" onmouseout=\"point1.src='./images/jeonnam/jeonnam.gif'\"  shape='poly' coords='230,257,242,253,250,244,261,263,268,285,266,296,268,304,268,312,263,320,262,333,253,334,252,301,243,302,242,324,237,335,227,321,229,308,228,296,231,286,233,274,225,266,230,256' ><area alt='고흥군' class='jeonnam' id='goheung' onmouseover=\"point1.src='./images/jeonnam/goheung.gif'\" onmouseout=\"point1.src='./images/jeonnam/jeonnam.gif'\"  shape='poly' coords='354,254,363,244,375,242,379,248,378,258,384,271,394,274,402,284,406,297,388,299,382,304,386,314,365,333,359,332,347,313,328,312,320,307,330,297,335,291,344,294,349,288,347,276,355,265,365,267,365,259,353,254'><area alt='곡성군' class='jeonnam' id='gokseong' onmouseover=\"point1.src='./images/jeonnam/gokseong.gif'\" onmouseout=\"point1.src='./images/jeonnam/jeonnam.gif'\"  shape='poly' coords='316,120,318,108,331,102,349,104,356,108,365,109,380,106,374,118,380,124,374,132,379,138,383,147,376,154,374,165,361,173,346,160,338,149,337,137,329,136,321,140,317,130,316,118' ><area alt='구례군' class='jeonnam' id='gurye' onmouseover=\"point1.src='./images/jeonnam/gurye.gif'\" onmouseout=\"point1.src='./images/jeonnam/jeonnam.gif'\"  shape='poly' coords='382,137,378,127,382,118,379,111,388,100,399,94,409,104,421,114,422,126,428,135,428,146,422,155,414,164,400,152,382,136'><area alt='담양군' class='jeonnam' id='damyang' onmouseover=\"point1.src='./images/jeonnam/damyang.gif'\" onmouseout=\"point1.src='./images/jeonnam/jeonnam.gif'\"  shape='poly' coords='275,99,283,86,291,85,290,72,297,68,308,73,308,79,304,86,307,94,311,100,311,107,315,110,316,126,321,136,310,142,313,152,314,159,297,153,301,142,286,136,281,124,273,124,272,113,265,111,276,98'><area alt='무안군' class='jeonnam' id='muan' onmouseover=\"point1.src='./images/jeonnam/muan.gif'\" onmouseout=\"point1.src='./images/jeonnam/jeonnam.gif'\"  shape='poly' coords='173,177,184,174,184,188,192,197,195,203,192,214,200,221,198,233,193,242,181,245,175,233,171,225,164,205,157,200,150,208,149,196,158,181,153,174,140,175,136,159,138,147,148,149,156,153,156,167,164,168,172,177'><area alt='보성군' class='jeonnam' id='boseong' onmouseover=\"point1.src='./images/jeonnam/boseong.gif'\" onmouseout=\"point1.src='./images/jeonnam/jeonnam.gif'\"  shape='poly' coords='316,224,315,213,321,203,334,199,344,203,347,216,356,221,367,220,380,232,378,241,369,237,359,243,348,255,340,257,334,270,316,272,309,277,293,270,298,255,299,245,301,234,317,224'><area alt='신안군' class='jeonnam' id='shinan' onmouseover=\"point1.src='./images/jeonnam/shinan.gif'\" onmouseout=\"point1.src='./images/jeonnam/jeonnam.gif'\"  shape='poly' coords='99,241,95,230,105,222,118,231,121,241,124,256,122,265,104,270,92,260,92,249,99,241'><area alt='영광군' class='jeonnam' id='yeonggwang' onmouseover=\"point1.src='./images/jeonnam/yeonggwang.gif'\" onmouseout=\"point1.src='./images/jeonnam/jeonnam.gif'\"  shape='poly' coords='169,87,172,78,186,80,189,86,193,104,204,106,216,103,216,110,210,117,208,123,209,129,207,135,200,143,191,145,185,140,179,142,171,142,162,148,152,139,144,127,151,116,160,109,168,94,171,86 '><area alt='영암군' class='jeonnam' id='yeongam' onmouseover=\"point1.src='./images/jeonnam/yeongam.gif'\" onmouseout=\"point1.src='./images/jeonnam/jeonnam.gif'\"  shape='poly' coords='205,216,202,222,197,244,178,248,174,258,190,261,200,274,212,274,222,269,227,258,237,247,252,242,259,224,245,221,233,215,230,205,222,204,231,222,217,221,213,212,204,213'><area alt='완도군' class='jeonnam' id='wando' onmouseover=\"point1.src='./images/jeonnam/wando.gif'\" onmouseout=\"point1.src='./images/jeonnam/jeonnam.gif'\"  shape='poly' coords='220,346,242,353,249,363,253,377,245,381,231,380,220,368,216,355,221,345'><area alt='장성군' class='jeonnam' id='jangseong' onmouseover=\"point1.src='./images/jeonnam/jangseong.gif'\" onmouseout=\"point1.src='./images/jeonnam/jeonnam.gif'\"  shape='poly' coords='219,104,232,102,236,94,241,74,251,66,259,62,266,70,272,71,277,80,282,86,276,91,275,96,269,100,267,106,263,107,264,116,272,119,269,126,259,127,245,126,236,126,233,137,220,137,211,136,209,129,210,123,217,117,219,102'><area alt='장흥군' class='jeonnam' id='jangheung' onmouseover=\"point1.src='./images/jeonnam/jangheung.gif'\" onmouseout=\"point1.src='./images/jeonnam/jeonnam.gif'\"  shape='poly' coords='261,225,272,228,283,240,301,237,296,249,297,265,294,275,306,279,306,288,297,287,295,292,293,302,288,310,292,326,280,337,273,333,271,336,262,335,265,318,269,307,268,300,268,293,269,275,248,244,261,233,261,224'><area alt='진도군' class='jeonnam' id='jindo' onmouseover=\"point1.src='./images/jeonnam/jindo.gif'\" onmouseout=\"point1.src='./images/jeonnam/jeonnam.gif'\"  shape='poly' coords='127,310,133,297,148,308,159,321,160,334,149,342,135,352,118,359,102,353,102,339,106,327,124,315,127,307'><area alt='함평군' class='jeonnam' id='hampyeong' onmouseover=\"point1.src='./images/jeonnam/hampyeong.gif'\" onmouseout=\"point1.src='./images/jeonnam/jeonnam.gif'\" shape='poly' coords='165,148,173,143,186,144,199,144,211,140,211,136,223,139,223,157,216,164,209,167,207,176,210,186,203,194,193,194,186,188,185,173,179,170,176,160,163,147'><area alt='해남군' class='jeonnam' id='haenam' onmouseover=\"point1.src='./images/jeonnam/haenam.gif'\" onmouseout=\"point1.src='./images/jeonnam/jeonnam.gif'\" shape='poly' coords='197,284,204,275,214,273,229,271,229,288,227,305,225,311,231,333,218,339,209,346,210,359,200,368,189,357,185,348,185,336,179,314,171,303,147,297,138,283,140,269,141,255,147,251,149,257,150,276,163,293,174,293,175,282,166,277,161,267,172,266,179,278,196,282'><area alt='화순군' class='jeonnam' id='hwasun' onmouseover=\"point1.src='./images/jeonnam/hwasun.gif'\" onmouseout=\"point1.src='./images/jeonnam/jeonnam.gif'\" shape='poly' coords='290,161,298,155,308,159,318,157,309,146,318,141,327,140,339,137,337,148,340,155,333,161,333,174,336,184,338,199,326,196,316,204,313,215,312,223,302,233,286,237,275,229,267,222,273,193,272,183,276,177,277,169,291,167,291,158'>");
				$("#regionMap>area").click(function() 
				{
					alert($(this).attr("alt"));
				});	
			}
			// 광주
			else if (region == "gwangju")
			{		
				$("#regionMap").html("<area alt='광산구' class='gwangju' id='gwangsan' onmouseover=\"point1.src='./images/gwangju/gwangsan.gif'\" onmouseout=\"point1.src='./images/gwangju/gwangju.gif'\" shape='poly' coords='153,128,158,115,167,109,189,103,188,115,183,125,183,130,194,130,204,143,228,147,245,145,253,137,260,136,277,153,281,172,287,188,283,195,275,196,264,196,261,204,246,216,250,240,245,257,240,275,231,279,223,304,211,328,193,328,191,310,180,306,179,295,161,282,146,282,122,282,107,285,97,291,94,279,81,278,76,270,78,250,73,235,76,217,84,214,97,212,97,198,77,181,81,177,91,178,103,182,101,167,106,157,119,154,127,161,136,157,146,150,147,135,152,128'><area alt='남구' class='gwangju' id='gjnamgu' onmouseover=\"point1.src='./images/gwangju/gjnamgu.gif'\" onmouseout=\"point1.src='./images/gwangju/gwangju.gif'\" shape='poly' coords='319,235,336,236,346,251,350,265,346,280,341,299,342,309,331,313,317,316,299,325,288,320,272,325,268,341,250,345,244,357,231,356,223,345,209,352,196,345,189,336,200,332,215,329,224,311,239,307,255,307,269,303,274,293,289,288,301,282,318,279,320,251,311,245,320,233'><area alt='동구' class='gwangju' id='gjdonggu' onmouseover=\"point1.src='./images/gwangju/gjdonggu.gif'\" onmouseout=\"point1.src='./images/gwangju/gwangju.gif'\" shape='poly' coords='344,229,345,217,359,227,374,229,384,240,391,252,410,254,416,266,422,283,417,300,405,302,391,308,388,315,375,330,360,329,347,306,347,295,344,283,358,266,351,249,342,240,345,228'><area alt='북구' class='gwangju' id='gjbukgu' onmouseover=\"point1.src='./images/gwangju/gjbukgu.gif'\" onmouseout=\"point1.src='./images/gwangju/gwangju.gif'\" shape='poly' coords='269,130,282,124,303,108,312,116,332,99,348,108,359,122,374,138,377,153,391,168,386,188,394,197,420,189,438,200,449,209,439,215,432,232,437,249,436,265,424,276,419,258,405,248,385,247,383,234,371,223,365,217,355,220,345,216,340,235,314,217,306,205,295,215,279,209,275,198,290,191,285,181,285,159,280,143,266,141,269,127'><area alt='서구' class='gwangju' id='gjseogu' onmouseover=\"point1.src='./images/gwangju/gjseogu.gif'\" onmouseout=\"point1.src='./images/gwangju/gwangju.gif'\" shape='poly' coords='261,207,276,210,299,219,311,214,339,232,318,233,312,238,307,245,316,256,316,276,304,272,293,283,273,286,264,291,260,302,248,302,239,303,226,303,234,292,233,284,242,270,251,257,253,241,251,225,253,215,260,207'>");
				$("#regionMap>area").click(function() 
				{
					alert($(this).attr("alt"));
				});	
			}
			// 전북
			else if (region == "jeonbuk")
			{
				$("#regionMap").html("<area alt='군산시' class='jeonbuk' id='gunsan' onmouseover=\"point1.src='./images/jeonbuk/gunsan.gif'\" onmouseout=\"point1.src='./images/jeonbuk/jeonbuk.gif'\" shape='poly' coords='134,129,142,120,158,117,179,115,190,132,182,143,174,158,163,159,144,163,119,166,102,162,102,149,92,138,112,131,135,128'><area alt='남원시' class='jeonbuk' id='namwon' onmouseover=\"point1.src='./images/jeonbuk/namwon.gif'\" onmouseout=\"point1.src='./images/jeonbuk/jeonbuk.gif'\" shape='poly' coords='313,278,315,278,344,279,356,294,364,305,377,300,378,284,394,315,388,333,381,356,364,361,344,342,325,359,307,363,272,357,263,356,270,336,289,327,298,310,303,298,311,292,315,277'><area alt='김제시' class='jeonbuk' id='gimje' onmouseover=\"point1.src='./images/jeonbuk/gimje.gif'\" onmouseout=\"point1.src='./images/jeonbuk/jeonbuk.gif'\" shape='poly' coords='158,171,158,170,177,155,184,160,204,160,214,167,214,186,223,202,232,214,232,226,233,246,212,233,202,219,183,210,179,220,165,222,154,203,147,197,132,183,137,172,153,174,159,169'><area alt='익산시' class='jeonbuk' id='iksan' onmouseover=\"point1.src='./images/jeonbuk/iksan.gif'\" onmouseout=\"point1.src='./images/jeonbuk/jeonbuk.gif'\" shape='poly' coords='173,112,173,111,184,83,205,75,224,81,235,105,247,107,246,117,241,128,242,147,230,157,221,161,209,165,202,157,180,158,180,146,192,130,181,116,173,109'><area alt='전주시' class='jeonbuk' id='jeonju' onmouseover=\"point1.src='./images/jeonbuk/jeonju.gif'\" onmouseout=\"point1.src='./images/jeonbuk/jeonbuk.gif'\" shape='poly' coords='213,167,245,166,269,178,272,197,258,205,247,208,234,218,227,201,214,191,217,179,212,167'><area alt='정읍시' class='jeonbuk' id='jeongeup' onmouseover=\"point1.src='./images/jeonbuk/jeongeup.gif'\" onmouseout=\"point1.src='./images/jeonbuk/jeonbuk.gif'\" shape='poly' coords='174,223,184,224,189,212,208,229,224,242,238,255,240,279,241,297,218,292,207,281,194,290,196,302,178,308,171,312,156,310,144,310,149,298,151,287,151,274,139,277,141,266,138,251,149,238,162,235,176,219'><area alt='고창군' class='jeonbuk' id='gochang' onmouseover=\"point1.src='./images/jeonbuk/gochang.gif'\" onmouseout=\"point1.src='./images/jeonbuk/jeonbuk.gif'\" shape='poly' coords='97,285,128,275,139,275,140,283,152,278,147,295,143,311,140,329,135,347,117,355,101,357,98,366,79,362,81,351,77,345,67,341,68,327,57,320,57,308,71,286,96,284'><area alt='무주군' class='jeonbuk' id='muju' onmouseover=\"point1.src='./images/jeonbuk/muju.gif'\" onmouseout=\"point1.src='./images/jeonbuk/jeonbuk.gif'\" shape='poly' coords='358,129,360,129,368,149,375,168,393,188,409,200,416,182,436,177,445,169,453,157,458,134,445,115,423,121,401,116,390,105,380,111,378,123,361,115,360,128'><area alt='부안군' class='jeonbuk' id='buan' onmouseover=\"point1.src='./images/jeonbuk/buan.gif'\" onmouseout=\"point1.src='./images/jeonbuk/jeonbuk.gif'\" shape='poly' coords='109,206,109,205,122,195,142,204,152,203,161,223,158,235,137,245,137,258,138,271,123,273,105,265,76,271,67,258,71,243,90,233,108,222,108,203'><area alt='순창군' class='jeonbuk' id='sunchang' onmouseover=\"point1.src='./images/jeonbuk/sunchang.gif'\" onmouseout=\"point1.src='./images/jeonbuk/jeonbuk.gif'\" shape='poly' coords='196,289,211,283,221,294,249,300,258,310,274,303,293,304,292,317,272,331,262,350,255,368,239,366,225,358,227,343,226,326,218,314,212,319,212,334,197,334,184,321,177,309,194,302,196,285'><area alt='완주군' class='jeonbuk' id='wanju' onmouseover=\"point1.src='./images/jeonbuk/wanju.gif'\" onmouseout=\"point1.src='./images/jeonbuk/jeonbuk.gif'\" shape='poly' coords='248,118,247,118,246,103,259,97,287,99,297,86,308,89,316,118,308,129,305,144,307,160,296,181,292,200,282,211,279,228,268,216,253,221,248,237,242,259,235,236,246,208,266,200,274,181,263,168,244,160,224,160,244,147,247,131,248,114'><area alt='임실군' class='jeonbuk' id='imsil' onmouseover=\"point1.src='./images/jeonbuk/imsil.gif'\" onmouseout=\"point1.src='./images/jeonbuk/jeonbuk.gif'\" shape='poly' coords='250,228,266,217,278,232,284,219,292,205,297,228,306,241,328,252,320,263,311,281,307,294,298,301,285,303,268,302,254,309,242,295,247,284,239,260,253,249,251,225'><area alt='장수군' class='jeonbuk' id='jangsu' onmouseover=\"point1.src='./images/jeonbuk/jangsu.gif'\" onmouseout=\"point1.src='./images/jeonbuk/jeonbuk.gif'\" shape='poly' coords='357,206,357,205,362,194,371,197,383,191,390,184,404,194,408,202,397,214,390,234,387,258,376,272,371,294,364,299,355,284,341,272,317,271,337,257,349,240,347,221,357,201'><area alt='진안군' class='jeonbuk' id='jinan' onmouseover=\"point1.src='./images/jeonbuk/jinan.gif'\" onmouseout=\"point1.src='./images/jeonbuk/jeonbuk.gif'\" shape='poly' coords='316,120,308,134,308,150,307,165,297,179,297,197,291,206,298,221,305,238,319,245,335,249,343,237,341,218,351,206,354,186,372,188,382,181,367,163,363,145,354,130,314,119'>");
				$("#regionMap>area").click(function() 
				{
					alert($(this).attr("alt"));
				});	
			}
			// 경남
			else if (region == "gyeongnam")
			{
				$("#regionMap").html("<area alt='거제시' class='gyeongnam' id='geoje' onmouseover=\"point1.src='./images/gyeongnam/geoje.gif'\" onmouseout=\"point1.src='./images/gyeongnam/gyeongnam.gif'\" shape='poly' coords='328,341,319,328,327,321,335,310,346,305,352,310,356,320,358,330,360,338,351,344,362,348,359,359,367,375,349,373,343,379,346,391,321,407,323,388,312,378,323,365,314,358,307,367,297,355,301,341,313,338,325,347,329,339'><area alt='김해시' class='gyeongnam' id='gimhae' onmouseover=\"point1.src='./images/gyeongnam/gimhae.gif'\" onmouseout=\"point1.src='./images/gyeongnam/gyeongnam.gif'\" shape='poly' coords='357,220,377,216,377,207,393,206,404,214,420,226,426,235,431,243,422,251,405,254,394,254,398,266,393,273,384,269,362,266,372,254,361,249,358,236,353,230,363,229,359,219'><area alt='밀양시' class='gyeongnam' id='miryang' onmouseover=\"point1.src='./images/gyeongnam/miryang.gif'\" onmouseout=\"point1.src='./images/gyeongnam/gyeongnam.gif'\" shape='poly' coords='321,152,337,150,344,147,366,158,378,147,390,150,408,138,429,142,431,150,414,153,424,165,415,172,413,182,398,192,390,207,373,207,367,213,349,213,336,196,325,186,316,178,321,166,320,148'><area alt='사천시' class='gyeongnam' id='sacheon' onmouseover=\"point1.src='./images/gyeongnam/sacheon.gif'\" onmouseout=\"point1.src='./images/gyeongnam/gyeongnam.gif'\" shape='poly' coords='147,301,147,300,143,286,138,276,150,280,159,274,172,278,175,287,190,281,194,289,208,287,215,295,215,307,215,320,206,326,202,342,187,335,180,325,180,307,173,308,171,318,163,321,146,322,149,297'><area alt='양산시' class='gyeongnam' id='yangsan' onmouseover=\"point1.src='./images/gyeongnam/yangsan.gif'\" onmouseout=\"point1.src='./images/gyeongnam/gyeongnam.gif'\" shape='poly' coords='403,194,416,188,419,176,428,164,450,173,462,186,478,185,480,198,476,214,459,213,459,224,433,239,423,229,417,218,395,213,399,203,401,193'><area alt='진주시' class='gyeongnam' id='jinju' onmouseover=\"point1.src='./images/gyeongnam/jinju.gif'\" onmouseout=\"point1.src='./images/gyeongnam/gyeongnam.gif'\" shape='poly' coords='143,250,162,249,168,238,176,232,187,224,204,224,216,225,219,241,235,245,245,254,260,264,261,276,249,280,229,283,217,286,220,301,211,298,210,282,196,281,186,280,174,282,173,271,152,271,145,265,144,250'><area alt='창원시' class='gyeongnam' id='changwon1' onmouseover=\"point1.src='./images/gyeongnam/changwon.gif'\" onmouseout=\"point1.src='./images/gyeongnam/gyeongnam.gif'\" shape='poly' coords='279,271,295,263,293,252,293,242,304,241,309,245,319,242,329,250,328,253,318,262,322,269,331,285,331,297,320,300,312,288,301,287,290,287,284,294,275,288,261,283,261,273,272,261,278,269'><area alt='창원시' class='gyeongnam' id='changwon2' onmouseover=\"point1.src='./images/gyeongnam/changwon.gif'\" onmouseout=\"point1.src='./images/gyeongnam/gyeongnam.gif'\" shape='poly' coords='312,223,318,212,332,210,345,214,358,223,350,230,359,237,359,256,366,262,358,271,348,266,337,268,329,273,323,258,328,253,328,244,320,237,311,220'><area alt='창원시' class='gyeongnam' id='changwon3' onmouseover=\"point1.src='./images/gyeongnam/changwon.gif'\" onmouseout=\"point1.src='./images/gyeongnam/gyeongnam.gif'\" shape='poly' coords='334,273,343,266,359,271,374,272,383,278,395,281,383,287,374,289,364,289,349,287,347,276,340,280,334,271'><area alt='통영시' class='gyeongnam' id='tongyeong' onmouseover=\"point1.src='./images/gyeongnam/tongyeong.gif'\" onmouseout=\"point1.src='./images/gyeongnam/gyeongnam.gif'\" shape='poly' coords='264,333,265,333,280,330,282,343,292,342,292,353,287,357,286,380,283,386,265,376,257,368,267,354,255,358,250,345,258,333,266,331'><area alt='거창군' class='gyeongnam' id='geochang' onmouseover=\"point1.src='./images/gyeongnam/geochang.gif'\" onmouseout=\"point1.src='./images/gyeongnam/gyeongnam.gif'\" shape='poly' coords='91,85,107,81,129,77,138,62,150,70,156,78,185,81,190,83,179,96,179,109,186,115,186,123,175,131,167,136,161,147,162,154,157,171,148,171,144,164,131,154,137,145,140,131,124,129,118,118,109,116,105,108,95,111,88,101,89,83'><area alt='고성군' class='gyeongnam' id='goseong' onmouseover=\"point1.src='./images/gyeongnam/goseong.gif'\" onmouseout=\"point1.src='./images/gyeongnam/gyeongnam.gif'\" shape='poly' coords='211,347,196,340,202,333,211,323,216,306,222,301,223,288,241,283,263,281,276,293,267,300,260,309,265,313,279,304,297,305,297,316,284,320,282,328,271,322,269,329,257,329,247,336,237,334,223,335,219,341,212,346'><area alt='남해군' class='gyeongnam' id='namhae' onmouseover=\"point1.src='./images/gyeongnam/namhae.gif'\" onmouseout=\"point1.src='./images/gyeongnam/gyeongnam.gif'\" shape='poly' coords='123,369,115,359,125,344,153,336,158,343,146,361,155,369,180,366,189,372,182,382,187,393,166,400,157,392,153,379,146,388,142,396,125,387,124,367'><area alt='산청군' class='gyeongnam' id='sancheong' onmouseover=\"point1.src='./images/gyeongnam/sancheong.gif'\" onmouseout=\"point1.src='./images/gyeongnam/gyeongnam.gif'\" shape='poly' coords='104,217,110,198,121,190,127,179,118,168,132,159,140,168,152,179,158,177,158,191,169,201,179,204,190,213,197,221,183,225,177,230,164,231,156,248,144,251,130,242,122,257,111,253,98,246,88,234,97,228,105,215'><area alt='의령군' class='gyeongnam' id='uiryeong' onmouseover=\"point1.src='./images/gyeongnam/uiryeong.gif'\" onmouseout=\"point1.src='./images/gyeongnam/gyeongnam.gif'\" shape='poly' coords='218,206,220,188,234,178,242,175,256,178,275,174,276,184,260,186,265,196,280,202,275,218,265,218,253,215,245,222,243,237,234,243,216,234,213,219,198,220,196,212,218,205'><area alt='창녕군' class='gyeongnam' id='changnyeong' onmouseover=\"point1.src='./images/gyeongnam/changnyeong.gif'\" onmouseout=\"point1.src='./images/gyeongnam/gyeongnam.gif'\" shape='poly' coords='263,142,284,134,300,135,301,123,314,146,319,166,314,183,319,192,334,194,336,208,317,206,302,203,285,209,267,193,282,184,275,173,260,161,264,151,262,140'><area alt='하동군' class='gyeongnam' id='hadong' onmouseover=\"point1.src='./images/gyeongnam/hadong.gif'\" onmouseout=\"point1.src='./images/gyeongnam/gyeongnam.gif'\" shape='poly' coords='64,228,77,229,87,231,89,245,105,251,112,258,128,258,136,246,142,268,156,274,148,279,141,277,138,279,140,290,145,305,145,324,138,333,119,334,104,325,109,310,103,301,91,296,88,286,88,279,70,265,66,250,61,239,65,227'><area alt='함안군' class='gyeongnam' id='haman' onmouseover=\"point1.src='./images/gyeongnam/haman.gif'\" onmouseout=\"point1.src='./images/gyeongnam/gyeongnam.gif'\" shape='poly' coords='265,224,275,215,287,208,302,206,316,214,313,232,312,241,296,239,288,253,284,272,273,260,263,265,258,258,244,245,244,234,253,225,258,213,265,223'><area alt='함양군' class='gyeongnam' id='hamyang' onmouseover=\"point1.src='./images/gyeongnam/hamyang.gif'\" onmouseout=\"point1.src='./images/gyeongnam/gyeongnam.gif'\" shape='poly' coords='93,106,92,106,95,115,108,115,114,125,124,133,135,133,137,144,128,148,124,158,120,168,120,181,107,195,100,209,95,223,86,227,67,228,69,215,66,208,77,204,82,195,73,186,80,181,74,169,64,165,60,154,66,145,70,128,77,106,82,98,92,106'><area alt='합천군' class='gyeongnam' id='hapcheon' onmouseover=\"point1.src='./images/gyeongnam/hapcheon.gif'\" onmouseout=\"point1.src='./images/gyeongnam/gyeongnam.gif'\" shape='poly' coords='209,132,227,143,237,135,250,131,260,140,253,149,257,156,260,170,261,176,248,171,239,175,226,179,217,186,215,199,206,206,193,212,185,201,167,201,162,184,159,173,160,162,172,149,170,135,184,128,188,112,181,101,184,92,196,81,202,87,217,105,223,121,210,132'>");
				$("#regionMap>area").click(function() 
				{
					alert($(this).attr("alt"));
				});	
			}
			// 충남
			else if (region == "chungnam")
			{
				$("#regionMap").html("<area alt='계룡시' class='chungnam' id='gyeryoung' onmouseover=\"point1.src='./images/chungnam/gyeryoung.gif'\" onmouseout=\"point1.src='./images/chungnam/chungnam.gif'\" shape='poly' coords='343,291,350,285,358,289,361,307,366,315,362,323,352,314,346,314,343,289'><area alt='공주시' class='chungnam' id='gongju' onmouseover=\"point1.src='./images/chungnam/gongju.gif'\" onmouseout=\"point1.src='./images/chungnam/chungnam.gif'\" shape='poly' coords='279,193,290,188,312,192,323,194,344,214,352,230,354,250,361,263,362,288,346,285,343,293,328,290,317,289,310,303,295,297,295,285,301,268,294,248,275,244,263,232,280,191'><area alt='논산시' class='chungnam' id='nonsan' onmouseover=\"point1.src='./images/chungnam/nonsan.gif'\" onmouseout=\"point1.src='./images/chungnam/chungnam.gif'\" shape='poly' coords='309,308,318,297,329,301,337,294,347,319,358,325,366,325,374,332,374,354,364,358,356,360,357,373,342,366,333,369,321,373,308,367,309,356,298,352,297,344,291,332,298,328,312,315,308,309'><area alt='당진군' class='chungnam' id='dangjin' onmouseover=\"point1.src='./images/chungnam/dangjin.gif'\" onmouseout=\"point1.src='./images/chungnam/chungnam.gif'\" shape='poly' coords='154,69,162,60,175,69,195,80,216,80,233,86,237,103,242,113,247,115,246,130,252,138,242,143,231,149,213,135,205,144,192,133,184,123,171,130,164,114,157,110,162,95,153,69'><area alt='보령시' class='chungnam' id='boryeong' onmouseover=\"point1.src='./images/chungnam/boryeong.gif'\" onmouseout=\"point1.src='./images/chungnam/chungnam.gif'\" shape='poly' coords='157,235,177,240,187,240,195,253,207,258,212,275,208,294,209,310,221,319,211,332,197,340,177,338,169,329,170,314,166,299,169,290,175,280,164,273,162,260,157,245,157,231'><area alt='서산시' class='chungnam' id='seosan' onmouseover=\"point1.src='./images/chungnam/seosan.gif'\" onmouseout=\"point1.src='./images/chungnam/chungnam.gif'\" shape='poly' coords='123,71,127,71,155,75,158,99,158,119,169,133,186,133,198,144,199,156,186,167,181,187,163,194,146,189,145,206,131,195,123,169,129,143,121,131,131,117,143,104,143,92,129,91'><area alt='아산시' class='chungnam' id='asan' onmouseover=\"point1.src='./images/chungnam/asan.gif'\" onmouseout=\"point1.src='./images/chungnam/chungnam.gif'\" shape='poly' coords='251,116,271,116,276,106,292,99,302,100,314,98,311,120,316,127,315,142,320,150,311,156,309,166,297,170,289,184,282,169,267,169,260,159,248,152,255,144,255,133,253,115'><area alt='천안시' class='chungnam' id='cheonan' onmouseover=\"point1.src='./images/chungnam/cheonan.gif'\" onmouseout=\"point1.src='./images/chungnam/chungnam.gif'\" shape='poly' coords='316,102,321,93,329,86,343,92,350,103,363,106,373,122,376,132,387,133,395,140,399,152,393,153,380,151,376,160,367,174,351,168,333,160,324,165,330,178,332,198,320,184,312,192,295,185,306,173,315,169,316,156,325,149,320,142,318,127,323,122,316,102'><area alt='금산군' class='chungnam' id='geumsan' onmouseover=\"point1.src='./images/chungnam/geumsan.gif'\" onmouseout=\"point1.src='./images/chungnam/chungnam.gif'\" shape='poly' coords='380,336,392,331,403,337,418,334,426,319,441,324,446,341,445,349,452,365,458,368,454,378,452,392,441,387,430,384,430,396,428,404,416,404,415,394,401,386,397,391,390,377,387,363,379,353,377,353,382,339,382,334'><area alt='부여군' class='chungnam' id='buyeo' onmouseover=\"point1.src='./images/chungnam/buyeo.gif'\" onmouseout=\"point1.src='./images/chungnam/chungnam.gif'\" shape='poly' coords='218,281,237,295,246,280,255,296,266,296,277,302,289,294,296,311,307,313,295,326,285,329,290,349,277,343,261,352,253,373,249,355,239,348,239,336,213,338,227,319,213,309,212,296,218,281'><area alt='서천군' class='chungnam' id='seochenon' onmouseover=\"point1.src='./images/chungnam/seochenon.gif'\" onmouseout=\"point1.src='./images/chungnam/chungnam.gif'\" shape='poly' coords='188,345,211,340,219,347,236,341,240,355,250,366,256,375,236,389,218,394,202,397,204,382,195,377,183,355,171,348,158,354,168,342,174,334,186,345'><area alt='예산군' class='chungnam' id='yesan' onmouseover=\"point1.src='./images/chungnam/yesan.gif'\" onmouseout=\"point1.src='./images/chungnam/chungnam.gif'\" shape='poly' coords='193,165,206,157,218,142,231,159,242,154,249,161,260,166,270,179,281,177,278,187,266,218,251,211,242,225,226,222,229,208,228,188,221,178,211,182,192,187,193,199,186,191,193,163' ><area alt='청양군' class='chungnam' id='cheongyang' onmouseover=\"point1.src='./images/chungnam/cheongyang.gif'\" onmouseout=\"point1.src='./images/chungnam/chungnam.gif'\" shape='poly' coords='233,232,244,232,252,223,256,215,262,216,263,244,268,254,283,252,294,259,294,272,283,288,272,293,264,290,255,290,252,284,256,273,243,273,238,284,223,280,215,270,212,257,215,247,224,247,232,232'><area alt='태안군' class='chungnam' id='taean' onmouseover=\"point1.src='./images/chungnam/taean.gif'\" onmouseout=\"point1.src='./images/chungnam/chungnam.gif'\" shape='poly' coords='107,84,107,83,103,111,90,117,78,116,81,127,64,150,67,160,78,152,85,159,89,166,103,164,101,175,111,184,110,196,113,218,118,250,126,263,138,265,139,251,134,228,128,207,123,178,121,153,122,141,116,135,103,136,111,121,116,109,103,79' ><area alt='홍성군' class='chungnam' id='hongseong' onmouseover=\"point1.src='./images/chungnam/hongseong.gif'\" onmouseout=\"point1.src='./images/chungnam/chungnam.gif'\" shape='poly' coords='150,196,149,196,169,198,182,190,190,204,199,192,221,185,231,202,222,217,227,229,223,244,214,241,198,247,187,239,185,232,173,233,157,225,154,218,151,208,150,195'><area alt='연기군' class='chungnam' id='yeongi' onmouseover=\"point1.src='./images/chungnam/yeongi.gif'\" onmouseout=\"point1.src='./images/chungnam/chungnam.gif'\" shape='poly' coords='328,166,342,164,356,173,370,175,365,185,359,193,367,194,371,210,382,220,385,244,378,261,365,261,357,247,362,237,351,226,353,212,335,203,335,188,327,163'>");
				$("#regionMap>area").click(function() 
				{
					alert($(this).attr("alt"));
				});	
			}
			// 충북
			else if (region == "chungbuk")
			{
				$("#regionMap").html("<area alt='제천시' class='chungbuk' id='jecheon' onmouseover=\"point1.src='./images/chungbuk/jecheon.gif'\" onmouseout=\"point1.src='./images/chungbuk/chungbuk.gif'\" shape='poly' coords='247,72,247,70,252,52,271,45,289,65,304,55,315,58,329,49,342,53,357,61,347,71,341,76,353,80,347,90,337,87,338,99,329,111,340,119,339,139,331,144,338,153,333,162,330,176,300,172,294,163,281,168,287,152,284,136,297,127,291,112,294,98,281,90,269,94,262,83,258,74,248,68'><area alt='청주시' class='chungbuk' id='cheongju' onmouseover=\"point1.src='./images/chungbuk/cheongju.gif'\" onmouseout=\"point1.src='./images/chungbuk/chungbuk.gif'\" shape='poly' coords='121,214,122,214,134,203,140,219,151,224,149,234,137,242,126,236,116,236,101,242,102,231,106,220,122,214'><area alt='충주시' class='chungbuk' id='chungju' onmouseover=\"point1.src='./images/chungbuk/chungju.gif'\" onmouseout=\"point1.src='./images/chungbuk/chungbuk.gif'\" shape='poly' coords='187,77,194,73,200,63,207,68,215,78,251,75,257,76,268,87,272,94,281,90,289,97,291,111,290,120,293,134,282,141,287,146,285,157,281,166,294,167,303,173,296,177,283,172,269,176,260,159,252,154,242,155,229,146,221,137,216,142,208,140,201,134,181,129,183,110,189,103,190,92,194,88,187,75'><area alt='괴산군' class='chungbuk' id='goesan' onmouseover=\"point1.src='./images/chungbuk/goesan.gif'\" onmouseout=\"point1.src='./images/chungbuk/chungbuk.gif'\" shape='poly' coords='212,145,222,139,232,150,246,158,257,157,262,169,270,178,282,175,284,181,280,194,289,202,275,204,260,202,250,211,256,224,251,231,237,224,231,232,211,233,194,214,186,203,177,190,174,174,188,165,201,159,221,155,209,140'><area alt='단양군' class='chungbuk' id='danyang' onmouseover=\"point1.src='./images/chungbuk/danyang.gif'\" onmouseout=\"point1.src='./images/chungbuk/chungbuk.gif'\" shape='poly' coords='354,76,356,76,372,75,383,88,406,85,429,96,446,102,440,108,420,112,409,127,388,143,393,161,389,172,367,179,353,168,338,159,338,149,332,143,341,135,342,117,331,106,342,96,342,86,353,91,361,72'><area alt='보은군' class='chungbuk' id='boeun' onmouseover=\"point1.src='./images/chungbuk/boeun.gif'\" onmouseout=\"point1.src='./images/chungbuk/chungbuk.gif'\" shape='poly' coords='156,255,167,249,171,239,184,235,202,239,215,236,223,238,227,247,239,249,248,259,241,278,237,294,239,299,227,305,215,299,193,295,183,281,170,286,165,294,156,295,144,286,151,273,157,263,156,252'><area alt='영동군' class='chungbuk' id='youngdong' onmouseover=\"point1.src='./images/chungbuk/youngdong.gif'\" onmouseout=\"point1.src='./images/chungbuk/chungbuk.gif'\" shape='poly' coords='191,339,206,331,214,323,228,321,235,327,246,324,261,333,283,333,290,350,279,352,267,352,271,367,263,380,261,392,243,400,227,398,214,406,191,394,183,399,173,381,162,376,161,364,176,360,180,352,177,344,193,337'><area alt='옥천군' class='chungbuk' id='okchun' onmouseover=\"point1.src='./images/chungbuk/okchun.gif'\" onmouseout=\"point1.src='./images/chungbuk/chungbuk.gif'\" shape='poly' coords='151,294,152,294,168,296,181,284,198,298,222,302,243,300,238,312,228,319,214,324,201,335,183,342,176,349,176,359,161,359,163,347,151,340,132,335,134,319,144,307,152,291' ><area alt='음성군' class='chungbuk' id='eumseong' onmouseover=\"point1.src='./images/chungbuk/eumseong.gif'\" onmouseout=\"point1.src='./images/chungbuk/chungbuk.gif'\" shape='poly' coords='127,107,146,108,154,111,157,101,170,92,171,79,185,81,193,90,187,100,182,111,178,128,193,133,205,135,211,142,216,150,207,159,185,156,183,165,173,166,165,167,154,166,156,154,147,149,134,139,123,142,122,129,118,117,128,105'><area alt='증평군' class='chungbuk' id='jeungpyeong' onmouseover=\"point1.src='./images/chungbuk/jeungpyeong.gif'\" onmouseout=\"point1.src='./images/chungbuk/chungbuk.gif'\" shape='poly' coords='157,164,167,170,175,173,171,189,179,200,178,208,162,205,154,194,137,189,150,178,158,161'><area alt='진천군' class='chungbuk' id='jincheon' onmouseover=\"point1.src='./images/chungbuk/jincheon.gif'\" onmouseout=\"point1.src='./images/chungbuk/chungbuk.gif'\" shape='poly' coords='88,138,104,135,109,122,122,117,123,133,129,141,140,145,149,155,158,162,147,175,141,188,127,186,121,194,109,187,104,177,95,173,82,157,88,136'><area alt='청원군' class='chungbuk' id='cheongwon' onmouseover=\"point1.src='./images/chungbuk/cheongwon.gif'\" onmouseout=\"point1.src='./images/chungbuk/chungbuk.gif'\" shape='poly' coords='104,241,107,240,121,239,134,242,148,235,152,220,194,218,201,228,209,235,202,239,182,237,170,237,163,251,152,260,153,272,148,279,139,291,136,278,128,274,113,279,108,267,97,263,96,250,107,237'>");
				$("#regionMap>area").click(function() 
				{
					alert($(this).attr("alt"));
				});	
			}
			// 대전
			else if (region == "daejeon")
			{
				$("#regionMap").html("<area alt='대덕구' class='daejeon' id='daedeok' onmouseover=\"point1.src='./images/daejeon/daedeok.gif'\" onmouseout=\"point1.src='./images/daejeon/daejeon.gif'\" shape='poly' coords='266,120,266,119,287,115,299,127,324,118,327,99,339,99,333,121,354,117,355,125,347,141,332,140,324,156,308,170,313,180,305,191,316,205,321,217,306,218,293,205,274,225,264,218,255,201,272,193,272,181,282,159,273,145,255,134,254,126,268,118'><area alt='동구' class='daejeon' id='dgdonggu' onmouseover=\"point1.src='./images/daejeon/dgdonggu.gif'\" onmouseout=\"point1.src='./images/daejeon/daejeon.gif'\" shape='poly' coords='311,170,313,168,328,160,332,149,340,140,351,147,355,161,366,167,364,156,371,148,382,150,394,148,399,162,409,169,404,178,386,181,378,189,377,209,364,223,358,241,354,259,353,267,349,275,354,284,354,296,340,309,347,322,345,340,333,342,320,354,312,365,310,379,289,373,278,365,286,360,284,350,296,345,299,326,286,313,298,302,290,293,290,283,304,279,313,278,308,261,293,260,289,248,285,236,278,228,293,212,299,220,317,221,322,217,317,203,305,189,313,181,313,167'><area alt='서구' class='daejeon' id='dgseogu' onmouseover=\"point1.src='./images/daejeon/dgseogu.gif'\" onmouseout=\"point1.src='./images/daejeon/daejeon.gif'\" shape='poly' coords='211,220,213,221,234,207,254,203,261,219,254,238,242,257,234,274,225,290,226,301,219,316,224,341,219,358,203,368,194,389,184,366,179,351,165,349,148,335,148,318,158,304,175,299,183,287,191,275,202,269,205,258,201,245,214,242,216,233,213,218'><area alt='유성구' class='daejeon' id='yuseong' onmouseover=\"point1.src='./images/daejeon/yuseong.gif'\" onmouseout=\"point1.src='./images/daejeon/daejeon.gif'\" shape='poly' coords='169,151,172,151,192,153,210,127,219,109,229,96,220,83,242,74,262,90,259,114,250,127,260,144,277,158,267,184,253,196,222,206,207,220,211,236,198,243,197,258,191,272,176,286,159,302,140,307,128,295,116,280,128,276,128,267,126,247,143,221,135,210,147,191,144,177,151,157,169,150'><area alt='중구' class='daejeon' id='dgjunggu' onmouseover=\"point1.src='./images/daejeon/dgjunggu.gif'\" onmouseout=\"point1.src='./images/daejeon/daejeon.gif'\" shape='poly' coords='264,221,276,229,274,240,285,244,293,262,307,269,307,276,288,280,284,292,293,303,284,312,288,322,295,331,290,345,280,344,279,364,264,361,258,350,255,341,248,333,245,321,251,313,245,302,229,299,229,283,242,276,250,263,250,247,259,245,260,233,264,218'>");
				$("#regionMap>area").click(function() 
				{
					alert($(this).attr("alt"));
				});	
			}
			// 강원
			else if (region == "gangwon")
			{
				$("#regionMap").html("<area alt='강릉시' class='gangwon' id='gangneung' onmouseover=\"point1.src='./images/gangwon/gangneung.gif'\" onmouseout=\"point1.src='./images/gangwon/gangwon.gif'\" shape='poly' coords='333,212,333,210,348,209,355,204,368,201,376,212,376,225,384,230,393,244,406,245,411,258,413,268,409,280,402,287,389,285,377,281,372,292,364,293,361,286,353,290,343,284,347,274,354,271,356,244,346,234,334,237,324,226,326,215,336,208'><area alt='동해시' class='gangwon' id='donghae' onmouseover=\"point1.src='./images/gangwon/donghae.gif'\" onmouseout=\"point1.src='./images/gangwon/gangwon.gif'\" shape='poly' coords='397,289,397,288,411,283,415,270,423,276,428,294,432,305,424,309,408,310,405,314,391,308,397,300,398,287'><area alt='삼척시' class='gangwon' id='samcheok' onmouseover=\"point1.src='./images/gangwon/samcheok.gif'\" onmouseout=\"point1.src='./images/gangwon/gangwon.gif'\" shape='poly' coords='387,357,378,346,379,320,389,307,406,316,417,309,431,304,440,316,452,324,456,341,467,351,467,363,472,373,467,380,447,388,444,399,437,400,428,390,421,389,422,374,411,369,403,356,409,341,402,334,387,356'><area alt='속초시' class='gangwon' id='sokcho' onmouseover=\"point1.src='./images/gangwon/sokcho.gif'\" onmouseout=\"point1.src='./images/gangwon/gangwon.gif'\" shape='poly' coords='297,138,298,138,311,137,319,131,328,132,329,147,312,152,302,157,295,146,296,134'><area alt='원주시' class='gangwon' id='wonju' onmouseover=\"point1.src='./images/gangwon/wonju.gif'\" onmouseout=\"point1.src='./images/gangwon/gangwon.gif'\" shape='poly' coords='195,327,201,321,198,312,205,300,212,311,223,312,236,319,229,334,230,340,237,344,241,350,257,348,258,356,239,371,228,373,223,361,216,356,209,361,213,371,203,379,192,378,176,374,172,354,175,339,173,331,180,322,180,310,195,327,178,308,195,327'><area alt='춘천시' class='gangwon' id='chuncheon' onmouseover=\"point1.src='./images/gangwon/chuncheon.gif'\" onmouseout=\"point1.src='./images/gangwon/gangwon.gif'\" shape='poly' coords='132,187,140,182,142,174,143,168,152,175,161,178,171,181,181,183,194,182,201,173,206,183,213,178,226,186,216,201,217,214,208,224,197,221,186,223,192,237,187,246,166,242,156,258,149,257,142,250,130,246,136,238,132,226,149,211,146,197,137,196,130,185'><area alt='태백시' class='gangwon' id='taebaek' onmouseover=\"point1.src='./images/gangwon/taebaek.gif'\" onmouseout=\"point1.src='./images/gangwon/gangwon.gif'\" shape='poly' coords='391,353,391,352,402,335,408,342,403,356,408,370,420,375,423,388,413,395,395,394,386,401,379,387,387,375,392,368,392,350'><area alt='고성군' class='gangwon' id='gosung' onmouseover=\"point1.src='./images/gangwon/gosung.gif'\" onmouseout=\"point1.src='./images/gangwon/gangwon.gif'\" shape='poly' coords='257,97,270,79,271,52,277,41,293,54,293,64,298,78,309,100,328,133,312,134,296,140,295,126,283,132,277,119,276,108,267,111'><area alt='양구군' class='gangwon' id='yanggu' onmouseover=\"point1.src='./images/gangwon/yanggu.gif'\" onmouseout=\"point1.src='./images/gangwon/gangwon.gif'\" shape='poly' coords='189,108,191,108,201,108,214,109,232,110,244,113,243,129,234,135,232,154,237,158,235,167,240,174,230,175,227,183,213,183,212,176,200,178,201,168,196,152,195,139,187,135,190,107'><area alt='양양군' class='gangwon' id='yangyang' onmouseover=\"point1.src='./images/gangwon/yangyang.gif'\" onmouseout=\"point1.src='./images/gangwon/gangwon.gif'\" shape='poly' coords='327,142,316,151,303,158,293,163,298,174,310,174,312,185,307,194,303,201,303,214,316,210,323,217,336,207,347,208,363,202,356,185,355,173,340,166,337,153,328,139'><area alt='영월군' class='gangwon' id='yeongwol' onmouseover=\"point1.src='./images/gangwon/yeongwol.gif'\" onmouseout=\"point1.src='./images/gangwon/gangwon.gif'\" shape='poly' coords='254,324,276,321,282,337,286,345,294,345,302,337,308,345,327,349,328,361,340,369,350,372,361,368,376,373,383,375,381,387,388,399,377,399,369,392,362,396,359,404,343,400,321,391,305,388,293,378,274,380,272,372,278,364,266,360,258,350,242,348,249,340,255,334,254,322'><area alt='인제군' class='gangwon' id='inje' onmouseover=\"point1.src='./images/gangwon/inje.gif'\" onmouseout=\"point1.src='./images/gangwon/gangwon.gif'\" shape='poly' coords='234,103,234,101,257,99,268,109,276,120,284,131,297,134,295,148,301,156,292,163,295,174,309,177,308,192,302,200,305,209,300,215,293,215,286,225,278,221,269,217,258,227,249,218,236,210,225,200,227,189,239,176,238,163,233,152,238,134,247,126,243,112,232,109'><area alt='정선군' class='gangwon' id='jungsun' onmouseover=\"point1.src='./images/gangwon/jungsun.gif'\" onmouseout=\"point1.src='./images/gangwon/gangwon.gif'\" shape='poly' coords='326,301,328,287,339,284,353,291,364,288,372,292,384,282,397,287,396,308,382,312,377,347,388,361,387,373,366,371,351,365,343,370,325,358,329,343,320,334,316,318,318,308,328,299'><area alt='철원군' class='gangwon' id='cheorwon' onmouseover=\"point1.src='./images/gangwon/cheorwon.gif'\" onmouseout=\"point1.src='./images/gangwon/gangwon.gif'\" shape='poly' coords='63,107,74,111,93,110,102,105,122,114,136,106,148,108,144,121,135,133,126,145,126,156,116,163,104,160,97,164,87,155,90,146,76,150,64,133,54,125,64,105'><area alt='평창군' class='gangwon' id='pyeongchang' onmouseover=\"point1.src='./images/gangwon/pyeongchang.gif'\" onmouseout=\"point1.src='./images/gangwon/gangwon.gif'\" shape='poly' coords='269,268,270,268,280,256,297,255,308,247,316,245,315,235,327,228,334,237,345,237,355,246,354,269,344,279,341,284,327,282,323,297,316,309,311,319,317,325,321,338,328,342,323,347,309,345,303,338,295,338,290,346,279,328,269,322,269,316,267,304,276,295,273,284,270,267'><area alt='홍천 군' class='gangwon' id='hongcheon' onmouseover=\"point1.src='./images/gangwon/hongcheon.gif'\" onmouseout=\"point1.src='./images/gangwon/gangwon.gif'\" shape='poly' coords='186,248,193,242,193,233,189,223,200,223,210,228,214,223,217,212,220,198,231,214,244,212,253,226,269,218,283,225,298,216,311,214,323,219,320,229,315,235,313,247,301,247,295,256,281,258,265,271,252,262,246,262,238,265,223,275,218,269,206,271,202,277,192,286,176,282,152,275,143,270,137,262,138,252,145,252,154,264,165,249,186,248'><area alt='화천군' class='gangwon' id='hwacheon' onmouseover=\"point1.src='./images/gangwon/hwacheon.gif'\" onmouseout=\"point1.src='./images/gangwon/gangwon.gif'\" shape='poly' coords='152,106,162,101,182,106,191,123,190,135,196,140,195,153,203,171,193,173,191,184,179,185,173,177,161,180,149,174,142,166,141,183,131,189,122,185,113,162,126,161,129,154,130,143,141,130,147,123,152,103'><area alt='횡성군' class='gangwon' id='hoengseong' onmouseover=\"point1.src='./images/gangwon/hoengseong.gif'\" onmouseout=\"point1.src='./images/gangwon/gangwon.gif'\" shape='poly' coords='224,276,224,275,236,270,241,261,249,261,258,268,268,274,270,289,277,296,265,303,265,313,269,320,251,325,250,332,249,339,240,348,228,338,233,329,238,315,222,311,211,310,204,298,196,316,193,321,181,309,173,300,181,291,191,288,201,281,206,276,217,270,223,275'>");
				$("#regionMap>area").click(function() 
				{
					alert($(this).attr("alt"));
				});	
			}
			// 인천
			else if (region == "incheon")
			{
				$("#regionMap").html("<area alt='계양구' class='incheon' id='gyeyang' onmouseover=\"point1.src='./images/incheon/gyeyang.gif'\" onmouseout=\"point1.src='./images/incheon/incheon.gif'\" shape='poly' coords='423,231,424,231,438,233,441,241,450,238,467,241,468,247,454,257,444,294,416,293,394,289,398,279,407,277,412,268,394,242,401,240,419,243,427,229' ><area alt='남구'  class='incheon' id='namgu' onmouseover=\"point1.src='./images/incheon/namgu.gif'\" onmouseout=\"point1.src='./images/incheon/incheon.gif'\" shape='poly' coords='378,318,379,319,379,331,369,337,362,349,360,365,369,365,376,358,383,363,406,360,398,348,402,341,399,335,377,316' ><area alt='남동구'  class='incheon' id='namdong' onmouseover=\"point1.src='./images/incheon/namdong.gif'\" onmouseout=\"point1.src='./images/incheon/incheon.gif'\" shape='poly' coords='400,334,401,343,400,354,408,361,409,370,392,394,391,402,397,405,410,405,413,411,428,398,440,386,443,372,454,373,451,354,462,351,467,343,455,329,444,334,431,338,420,331,410,332,407,337,399,332' ><area alt='동구'  class='incheon' id='donggu' onmouseover=\"point1.src='./images/incheon/donggu.gif'\" onmouseout=\"point1.src='./images/incheon/incheon.gif'\" shape='poly' coords='356,314,357,313,372,313,378,319,377,329,369,336,343,318,355,312,359,311'><area alt='부평구'  class='incheon' id='bupyeong' onmouseover=\"point1.src='./images/incheon/bupyeong.gif'\" onmouseout=\"point1.src='./images/incheon/incheon.gif'\" shape='poly' coords='396,292,412,292,433,291,446,293,434,304,440,316,433,321,445,323,453,329,440,336,431,338,418,332,409,335,402,335,397,331,403,323,405,313,397,306,396,291'><area alt='서구' class='incheon' id='seogu' onmouseover=\"point1.src='./images/incheon/seogu.gif'\" onmouseout=\"point1.src='./images/incheon/incheon.gif'\" shape='poly' coords='391,198,407,210,412,222,421,233,418,244,394,240,406,264,412,270,404,277,392,283,399,307,406,315,398,327,371,315,367,303,359,307,350,300,356,289,371,290,382,280,376,274,361,285,343,283,336,277,332,291,322,293,318,275,325,263,331,251,324,239,330,229,338,229,349,224,367,207,377,190'><area alt='연수구'  class='incheon' id='yeonsu' onmouseover=\"point1.src='./images/incheon/yeonsu.gif'\" onmouseout=\"point1.src='./images/incheon/incheon.gif'\" shape='poly' coords='360,368,362,382,373,393,379,386,380,396,389,401,392,392,402,380,408,371,407,360,394,365,381,367,378,360,370,361,366,367,360,367'><area alt='중구' class='incheon' id='junggu' onmouseover=\"point1.src='./images/incheon/junggu.gif'\" onmouseout=\"point1.src='./images/incheon/incheon.gif'\" shape='poly' coords='315,286,315,287,320,303,309,314,284,320,267,330,254,344,226,351,213,363,202,351,180,349,174,342,172,330,174,319,185,315,194,324,206,316,219,304,221,294,240,292,259,286,257,277,267,269,284,272,316,286'><area alt='강화군' class='incheon' id='ganghwa' onmouseover=\"point1.src='./images/incheon/ganghwa.gif'\" onmouseout=\"point1.src='./images/incheon/incheon.gif'\" shape='poly' coords='318,236,319,234,315,220,307,212,306,200,309,185,299,173,303,160,298,151,298,133,304,113,291,102,289,81,247,46,226,51,207,54,181,77,181,94,186,113,179,127,188,149,205,155,215,167,212,190,215,202,192,206,192,217,200,228,195,235,223,253,264,247,274,252,290,250,301,253,303,239,309,241,314,248,320,234'><area alt='옹진군' class='incheon' id='ongjin' onmouseover=\"point1.src='./images/incheon/ongjin.gif'\" onmouseout=\"point1.src='./images/incheon/incheon.gif'\" shape='poly' coords=''>");
				$("#regionMap>area").click(function() 
				{
					alert($(this).attr("alt"));
				});	
			}
			// 경기
			else if (region == "gyeonggi")
			{
				$("#regionMap").html("<area alt='고양시' class='gyeonggi' id='goyang' onmouseover=\"point1.src='./images/gyeonggi/goyang.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='166,187,171,192,181,189,185,181,196,186,206,182,211,175,208,191,208,197,218,197,226,192,234,192,229,202,226,212,215,204,207,206,204,218,193,225,179,224,176,214,168,208,159,201,146,195,152,188,168,186'><area alt='과천시' class='gyeonggi' id='gwacheon' onmouseover=\"point1.src='./images/gyeonggi/gwacheon.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='230,256,243,256,251,257,238,265,221,277,218,267,214,260,231,254'><area alt='광명시' class='gyeonggi' id='gwangmyeong' onmouseover=\"point1.src='./images/gyeonggi/gwangmyeong.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='187,251,186,259,186,269,196,275,201,266,205,261,203,250,193,251,187,249'><area alt='광주시' class='gyeonggi' id='gwangju' onmouseover=\"point1.src='./images/gyeonggi/gwangju.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='307,245,312,236,323,238,331,254,326,262,329,267,335,278,341,283,325,293,314,313,308,309,299,312,298,303,302,291,297,287,288,288,283,294,277,286,271,293,263,291,270,281,278,276,278,265,271,258,287,255,310,244'><area alt='구리시' class='gyeonggi' id='guri' onmouseover=\"point1.src='./images/gyeonggi/guri.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='250,206,255,215,252,226,262,230,269,227,276,227,279,219,272,213,267,203,257,202,248,205'><area alt='군포시' class='gyeonggi' id='gunpo' onmouseover=\"point1.src='./images/gyeonggi/gunpo.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='210,280,203,287,196,293,205,298,214,301,222,297,220,290,210,280'><area alt='김포시' class='gyeonggi' id='gimpo' onmouseover=\"point1.src='./images/gyeonggi/gimpo.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='108,169,126,166,135,169,145,163,149,169,148,178,151,185,145,195,151,202,161,202,169,212,177,216,179,221,168,224,155,221,148,209,136,210,128,219,120,222,112,213,106,203,106,191,108,177,109,167'><area alt='남양주시' class='gyeonggi' id='namyangju' onmouseover=\"point1.src='./images/gyeonggi/namyangju.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='259,174,272,175,276,170,286,175,293,166,303,174,314,185,328,196,325,208,318,217,304,232,288,231,278,219,271,205,254,204,254,194,263,186,257,172'><area alt='동두천시' class='gyeonggi' id='dongducheon' onmouseover=\"point1.src='./images/gyeonggi/dongducheon.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='235,119,241,110,253,111,259,123,272,130,274,135,265,144,256,149,242,140,233,134,232,125,233,116'><area alt='부천시' class='gyeonggi' id='bucheon' onmouseover=\"point1.src='./images/gyeonggi/bucheon.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='174,229,184,232,191,238,186,248,187,262,176,260,167,250,166,237,174,225'><area alt='성남시' class='gyeonggi' id='seongnam' onmouseover=\"point1.src='./images/gyeonggi/seongnam.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='262,256,249,260,237,270,237,282,237,295,248,299,254,292,263,291,264,284,274,275,275,265,268,257,262,256'><area alt='수원시' class='gyeonggi' id='suwon' onmouseover=\"point1.src='./images/gyeonggi/suwon.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='215,301,216,301,223,300,225,292,234,290,241,298,251,302,249,312,245,322,230,321,218,322,208,314,217,297'><area alt='시흥시' class='gyeonggi' id='siheung' onmouseover=\"point1.src='./images/gyeonggi/siheung.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='176,261,176,260,171,268,159,275,150,283,163,282,172,286,187,284,194,286,198,282,195,272,187,272,183,264,174,258'><area alt='안산시' class='gyeonggi' id='ansan' onmouseover=\"point1.src='./images/gyeonggi/ansan.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='153,282,154,282,164,284,175,287,188,284,202,282,195,297,205,303,192,308,179,307,166,301,151,301,147,289,155,279'><area alt='안성시' class='gyeonggi' id='anseong' onmouseover=\"point1.src='./images/gyeonggi/anseong.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='262,364,273,360,282,365,285,358,291,351,299,347,305,355,319,356,328,361,335,359,337,344,347,349,357,356,360,365,353,373,342,377,339,388,330,401,307,405,299,420,285,416,273,399,260,394,268,388,268,380,258,376,262,368,262,361'><area alt='안양시' class='gyeonggi' id='anyang' onmouseover=\"point1.src='./images/gyeonggi/anyang.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='205,252,204,265,197,271,198,277,205,282,211,280,217,282,220,271,212,257,204,249'><area alt='양주시' class='gyeonggi' id='yangju' onmouseover=\"point1.src='./images/gyeonggi/yangju.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='220,125,219,125,231,126,236,138,253,147,262,159,258,166,244,174,230,171,227,177,233,189,228,191,221,194,206,198,213,182,211,169,205,156,218,144,218,124'><area alt='오산시' class='gyeonggi' id='osan' onmouseover=\"point1.src='./images/gyeonggi/osan.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='235,329,248,334,254,340,269,332,268,345,257,357,247,349,233,347,229,336,236,326'><area alt='용인시' class='gyeonggi' id='yongin' onmouseover=\"point1.src='./images/gyeonggi/yongin.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='251,300,251,299,255,293,264,292,271,295,277,290,284,295,291,294,297,289,299,295,296,304,296,314,305,314,311,312,316,330,325,333,332,341,340,344,333,349,334,361,320,358,315,351,302,352,295,346,289,351,284,358,279,366,271,359,259,364,260,353,271,342,267,328,252,321,245,316,254,309,252,298'><area alt='의왕시' class='gyeonggi' id='uiwang' onmouseover=\"point1.src='./images/gyeonggi/uiwang.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='237,267,226,274,217,279,222,292,233,291,240,284,237,275,238,266'><area alt='의정부시' class='gyeonggi' id='uijeongbu' onmouseover=\"point1.src='./images/gyeonggi/uijeongbu.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='228,174,234,171,242,173,259,168,263,175,264,185,254,192,246,198,235,194,232,181,227,172'><area alt='이천시' class='gyeonggi' id='icheon' onmouseover=\"point1.src='./images/gyeonggi/icheon.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='322,307,319,307,335,288,343,283,357,292,366,302,363,312,365,318,363,325,353,329,353,345,355,355,345,352,337,341,327,330,317,329,311,317,319,305'><area alt='파주시' class='gyeonggi' id='paju' onmouseover=\"point1.src='./images/gyeonggi/paju.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='142,122,151,115,160,116,171,110,176,117,179,131,187,124,187,114,194,110,202,116,215,114,229,109,218,124,213,143,204,156,209,175,203,181,184,183,177,189,149,189,149,178,149,166,142,160,145,144,151,140,162,145,156,132,145,130,143,118'><area alt='평택시' class='gyeonggi' id='pyeongtaek' onmouseover=\"point1.src='./images/gyeonggi/pyeongtaek.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='175,388,176,387,189,383,196,377,197,368,227,364,232,351,243,349,255,353,259,361,260,373,259,379,266,383,264,392,249,406,226,409,206,415,191,404,184,393,175,385'><area alt='포천시' class='gyeonggi' id='pocheon' onmouseover=\"point1.src='./images/gyeonggi/pocheon.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='282,62,297,54,304,72,332,74,343,78,343,94,333,109,322,113,317,129,305,133,297,144,299,159,289,165,277,169,257,169,265,159,263,149,277,133,275,125,258,113,265,104,265,89,277,89,281,81,283,60'><area alt='하남시' class='gyeonggi' id='hanam' onmouseover=\"point1.src='./images/gyeonggi/hanam.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='271,231,271,230,278,227,282,219,288,226,289,232,299,233,307,229,311,235,306,244,296,247,284,255,271,258,259,252,262,241,272,228'><area alt='화성시' class='gyeonggi' id='hwaseong' onmouseover=\"point1.src='./images/gyeonggi/hwaseong.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='179,309,191,310,209,308,218,320,225,327,238,320,244,324,252,323,265,327,264,334,254,337,238,330,227,334,234,346,228,364,209,365,190,369,182,384,170,385,160,372,166,361,168,351,178,347,175,337,165,336,154,347,144,340,144,320,154,308,170,314,180,307'><area alt='가평군' class='gyeonggi' id='gapyeong' onmouseover=\"point1.src='./images/gyeonggi/gapyeong.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='336,108,343,96,353,104,362,104,367,111,368,117,380,121,379,140,367,146,359,150,358,160,369,177,368,191,373,202,372,215,369,226,354,226,344,218,346,207,337,196,325,194,314,180,311,171,299,169,303,161,298,152,303,146,313,141,312,130,321,128,327,123,321,112,338,104'><area alt='양평군' class='gyeonggi' id='yangpyeong' onmouseover=\"point1.src='./images/gyeonggi/yangpyeong.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='328,196,338,198,346,212,349,221,352,228,372,225,376,216,375,203,387,203,403,219,418,215,427,221,438,223,437,238,425,244,432,259,431,273,422,285,407,280,402,271,388,275,376,270,365,267,357,266,344,269,332,265,328,257,332,249,321,235,308,237,308,228,318,218,330,208,329,193'><area alt='여주군' class='gyeonggi' id='yeoju' onmouseover=\"point1.src='./images/gyeonggi/yeoju.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='329,267,341,262,349,272,362,265,369,273,382,273,403,276,413,284,420,292,419,322,405,342,388,347,383,364,356,373,362,363,355,341,359,328,367,323,363,312,367,300,357,290,347,284,327,263'><area alt='연천군' class='gyeonggi' id='yeoncheon' onmouseover=\"point1.src='./images/gyeonggi/yeoncheon.gif'\" onmouseout=\"point1.src='./images/gyeonggi/gyeonggi.gif'\" shape='poly' coords='216,47,217,47,251,24,259,24,258,33,266,38,275,46,279,59,272,75,276,85,261,90,262,107,249,112,236,117,219,123,228,110,223,104,213,113,204,108,202,115,191,109,186,115,181,110,187,95,197,91,202,75,216,64,218,46'>");
				$("#regionMap>area").click(function() 
				{
					alert($(this).attr("alt"));
				});	
			}	
		});
		
		/* 세부 지도 클릭시 명령 */
		$(document).ready(function() 
		{
			$("#regionMap>area").click(function() 
			{
				alert($(this).attr("alt"));
			});
		});
	});
</script>


<script type="text/javascript">
	
	$(document).ready(function()
	{
		$(".select1").change(function()
		{	
			// 각각의 value 값을 받아온다.
			var map = $("#map").val();
			var detailedMap = $("#detailedMap").val();
			var hallType = $(".hall").val();
			
			
			for(var i= 0; i<6; i++)
			{	
				// 각 영역의 value + i 로 class이름을 확인하고
				// 체크여부를 판단해서 그 값을 받아온다.
				// 한영역을 체크하고 그외영역은 초기값으로 전체를 보여준다.
				
				if($(".dis" + i).is(":checked"))
				{
					//alert($(".re" + i).val());
					var dis = $(".dis"+i).val();
				}
				
				tot = map + detailedMap + dis;
				
				$("#test").html(tot);
				
				// 초기화버튼을 누르면 보여준 정보를 초기화시킨다.
				
				$(".reset").click(function() 
				{
					tot = "";
					$("#test").html(tot);
				});
				
			}
		});
	});
   
</script>

<!-- 광고/일반상품 이미지 이동 & 마우스오버 -->
<script type="text/javascript">
 
	$(function()
	{	
		var d = 100;
		
		$("#go1").innerfade(
		{
			'speed':            'slow',
            'type':             'sequence',
            'timeout':          1000,
            'containerheight':  'auto',
		});
		
		 
		/* $("#go1 img").mouseover(function()
		{	
			alert("들어오나?");
			$("#go1 img").stop().animate({'marginRigth':'10000px'},100);
		}); */
		
		 
		/* $("img").mouseover(function()
		{	
			//alert("들어오나?");
			$(this).css("width","300"); 
				$(this).css("height","750");
			
			//$("#go1 img").stop(alert("들어왔음 멈춰라!!!!"));
		}).mouseleave(function() 
		{
			$(this).css("width","100"); 
			$(this).css("height","250");
			//alert("나갑니다");
		});  */
		
	});
 
</script>

<!-- 마우스진입시 테두리 넣기 -->
<script type="text/javascript">
/* 
	$(function() 
	{
		$(".sido").mouseenter(function() 
		{
			//alert("들어옴");
			$(this).css("border", "2px solid red");
			//$("#kkk").css("border", "2px solid red");
			//$("a")append("<a>df</a>").css("border","red");
		}).mouseleave(function() 
		{
			$(this).css("");
			//$(this).css("border","0px solid black");
		});
	});
  */
</script>

<script type="text/javascript">

	$(function() 
	{
		$("#seoul").mouseenter(function() 
		{
			$("#seoul").css("color","red");
		});
	});

</script>


<style type="text/css">
	*
	{
		margin: 0px; 
		padding: 0px;
		
	}
	
	ul
	{
		list-style: none;
	}
</style>


</head>
<body>
<div id="wrap">
<div>
	<ul>
		<li><a class="wrap" href="">너는내운명</a></li>
		<li><a class="wrap" href="">로그아웃</a></li>
		<li><a class="wrap" href="">마이페이지</a></li>
		<li><a class="wrap" href="">QNA</a></li>
	</ul>   
   <hr>
</div><!-- /wrap -->


<div id="menu">
<!-- ul>li 쓸것 -->
   <form action="">
      <ul>
         <li><a class="menu" href="">로고</a></li>
         <li><a class="menu" href="">웨딩홀</a></li>
         <li><a class="menu" href="">스튜디오</a></li>
         <li><a class="menu" href="">드레스</a></li>
         <li><a class="menu" href="">메이크업</a></li>
         <li><a class="menu" href="">할인행사</a></li>
      </ul>
   </form>
</div><!-- /menu -->
   

<div id="container">
	<div id="section1" style="border: 5px solid red;">
		<form class="select1">
			
			<div>
			지역선택
			<select id="map">
				<option value="-">-</option>
				<option value="서울">서울</option>
				<option value="경기">경기</option>
			</select>
			<select id="detailedMap">
				<option value="-">-</option>
				<option value="강남">강남</option>
				<option value="강북">강북</option>
			</select>
			</div>
			   
			<div id="hallType">
            상품
			<input class="dis1" type="radio" name="웨스드메" value="전체" checked="checked">전체
            <input class="dis2" type="radio" name="웨스드메" value="웨딩홀">웨딩홀
            <input class="dis3" type="radio" name="웨스드메" value="스튜디오">스튜디오
            <input class="dis4" type="radio" name="웨스드메" value="드레스">드레스
            <input class="dis5" type="radio" name="웨스드메" value="메이크업&헤어">메이크업/일반
        	</div>
            <br>
            
            <button type="reset" class="reset">초기화</button>
         </form>
   </div>
   <span id="test"></span>
   
   
   <div id="section2">
   		
   		<!-- 전국지도 -->
   		<h2>전국지도</h2>
   
   <div id="leftMap">
	<img id="NationwideImg" name="point" src="./images/NationwideMap.jpg" usemap="#NationwideMap" alt="전국">
	
	<map name="NationwideMap">
		<area alt="서울" class="sido" onmouseover="point.src='./images/seoul/seoul_check.gif'" onmouseout="point.src='./images/NationwideMap.jpg'" id="seoul" shape="poly" coords="96,144,104,137,111,135,115,142,119,147,117,153,114,158,106,156,98,153">
		<area alt="경기" class="sido" onmouseover="point.src='./images/gyeonggi/gyeonggi_check.gif'" onmouseout="point.src='./images/NationwideMap.jpg'" id="gyeonggi" shape="poly" coords="82,132,83,132,90,127,91,116,96,113,94,101,108,96,115,97,118,107,131,114,132,125,132,135,140,144,146,148,145,158,144,167,145,174,131,180,122,188,108,189,95,190,82,180,83,165,91,156,100,152,112,155,119,148,116,138,108,133,97,141,86,139,82,130">
		<area alt="인천" class="sido" onmouseover="point.src='./images/incheon/incheon_check.gif'" onmouseout="point.src='./images/NationwideMap.jpg'" id="incheon" shape="poly" coords="85,139,93,140,98,150,93,157,87,160,76,156,65,147,59,136,67,123,80,120,87,127,80,134,84,139">
		<area alt="강원" class="sido" onmouseover="point.src='./images/gangwon/gangwon_check.gif'" onmouseout="point.src='./images/NationwideMap.jpg'" id="gangwon" shape="poly" coords="125,26,109,26,105,31,105,39,102,40,102,49,96,60,89,66,88,75,81,80,80,88,88,94,96,92,106,92,109,96,115,98,117,105,123,109,131,115,134,119,134,124,132,131,134,143,142,143,146,148,144,155,144,160,142,170,149,176,153,166,157,172,164,167,169,168,169,177,176,173,180,178,187,180,195,177,204,180,215,178,224,171,222,158,210,147,208,132,194,117,188,98,179,83,170,66,160,64,145,56,141,46,131,36,124,25,122,24">
		<area alt="대전" class="sido" onmouseover="point.src='./images/daejeon/daejeon_check.gif'" onmouseout="point.src='./images/NationwideMap.jpg'" id="daejeon" shape="poly" coords="118,209,111,213,110,218,106,222,108,227,111,232,115,234,120,230,124,221,125,213,118,208">
		<area alt="충남" class="sido" onmouseover="point.src='./images/chungnam/chungnam_check.gif'" onmouseout="point.src='./images/NationwideMap.jpg'" id="chungnam" shape="poly" coords="116,186,111,189,103,190,94,189,88,181,81,178,71,180,62,189,58,201,58,209,66,211,68,217,67,227,74,230,79,234,77,241,78,249,82,251,87,253,95,253,101,248,104,240,108,247,112,251,119,246,123,248,124,254,131,255,136,246,129,239,120,236,114,233,107,227,107,220,111,212,119,209,124,204,122,199,128,197,120,189,116,183">
		<area alt="충북" class="sido" onmouseover="point.src='./images/chungbuk/chungbuk_check.gif'" onmouseout="point.src='./images/NationwideMap.jpg'" id="chungbuk" shape="poly" coords="182,180,175,172,169,175,164,167,156,174,148,173,139,177,128,183,121,191,127,196,124,201,124,207,124,213,125,220,120,232,125,239,134,241,138,249,147,251,154,246,158,236,151,233,145,227,149,219,148,210,152,201,158,196,167,192,173,196,180,194,181,178,182,179">
		<area alt="경북" class="sido" onmouseover="point.src='./images/gyeongbuk/gyeongbuk_check.gif'" onmouseout="point.src='./images/NationwideMap.jpg'" id="gyeongbuk" shape="poly" coords="191,178,199,180,212,178,222,171,228,180,229,199,224,215,224,235,226,245,236,247,235,256,234,272,230,277,223,275,214,273,202,281,192,283,186,276,192,268,195,254,187,250,177,256,170,263,172,273,166,278,161,269,154,263,150,251,157,243,159,234,150,231,150,222,155,218,148,210,154,203,163,197,172,198,180,196,182,186,187,181,190,178">
		<area alt="경남" class="sido" onmouseover="point.src='./images/gyeongnam/gyeongnam_check.gif'" onmouseout="point.src='./images/NationwideMap.jpg'" id="gyeongnam" shape="poly" coords="169,338,181,345,192,342,197,332,192,322,177,329,181,314,191,310,200,304,210,298,205,287,193,284,184,281,169,281,162,274,156,267,148,262,140,268,139,278,140,289,141,301,142,311,146,322,146,334,151,345,162,346,169,336">
		<area alt="전북" class="sido" onmouseover="point.src='./images/jeonbuk/jeonbuk_check.gif'" onmouseout="point.src='./images/NationwideMap.jpg'" id="jeonbuk" shape="poly" coords="142,251,150,253,149,262,141,265,136,270,133,279,134,286,135,293,134,301,121,302,114,298,106,295,99,291,93,289,87,299,80,295,74,286,76,277,84,268,80,261,81,253,89,255,98,248,104,247,110,254,121,247,125,256,133,257,141,250">
		<area alt="전남" class="sido" onmouseover="point.src='./images/jeonnam/jeonnam_check.gif'" onmouseout="point.src='./images/NationwideMap.jpg'" id="jeonnam" shape="poly" coords="49,383,67,377,74,366,88,375,101,377,117,369,132,366,135,356,137,349,147,340,145,322,137,312,136,304,121,303,105,297,93,291,86,301,107,306,110,319,94,321,85,314,82,308,77,295,71,297,63,311,53,316,52,325,49,334,45,350,50,356,44,369">
		<area alt="광주" class="sido" onmouseover="point.src='./images/gwangju/gwangju_check.gif'" onmouseout="point.src='./images/NationwideMap.jpg'" id="gwangju" shape="poly" coords="99,303,90,306,84,315,92,320,101,320,108,316,100,301">
		<area alt="대구" class="sido" onmouseover="point.src='./images/daegu/daegu_check.gif'" onmouseout="point.src='./images/NationwideMap.jpg'" id="daegu" shape="poly" coords="179,257,180,257,186,251,193,255,193,260,192,268,187,273,183,279,176,279,168,278,173,271,174,264,178,255">
		<area alt="울산" class="sido" onmouseover="point.src='./images/ulsan/ulsan_check.gif'" onmouseout="point.src='./images/NationwideMap.jpg'" id="ulsan" shape="poly" coords="231,276,224,275,221,282,214,270,207,278,204,285,207,290,213,294,221,299,225,301,230,290,232,276">
		<area alt="부산" class="sido" onmouseover="point.src='./images/busan/busan_check.gif'" onmouseout="point.src='./images/NationwideMap.jpg'" id="busan" shape="poly" coords="216,296,219,295,207,301,201,307,195,314,185,313,180,319,181,327,192,321,197,325,206,322,217,313,225,303,217,294">
		<area alt="제주" class="sido" onmouseover="point.src='./images/jeju/jeju_check.gif'" onmouseout="point.src='./images/NationwideMap.jpg'" id="jeju" shape="poly" coords="94,393,93,393,84,399,71,403,60,412,65,425,79,423,95,421,106,408,102,396,93,392">
	</map>
</div>
   

   		
   		
   </div>
   
   <div id="section3">
   
		<!-- 상세지도 -->
		<h2>상세지도</h2>	   
   </div>
   
   <div id="rightMap">
	<img id="regionImg" name="point1" src="./images/seoul/seoul.gif" usemap="#regionMap" alt="전국">
	
	<map name="regionMap" id="regionMap">
		<area alt="강남구" class="seoul" id="gangnam" onmouseover="point1.src='./images/seoul/gangnam.gif'" onmouseout="point1.src='./images/seoul/seoul.gif'" shape="poly" coords="293,260,292,258,314,248,337,257,349,271,354,298,377,305,390,312,398,326,406,337,397,354,382,347,367,328,350,330,340,337,326,325,325,315,307,306,302,280,296,256">
		<area alt="강동구" class="seoul" id="gangdong" onmouseover="point1.src='./images/seoul/gangdong.gif'" onmouseout="point1.src='./images/seoul/seoul.gif'" shape="poly" coords="456,185,455,186,432,202,406,211,396,218,397,233,397,241,406,245,406,258,413,268,425,277,441,251,443,241,463,235,472,225,462,203,463,191,456,184">
		<area alt="강북구" class="seoul" id="gangbuk" onmouseover="point1.src='./images/seoul/gangbuk.gif'" onmouseout="point1.src='./images/seoul/seoul.gif'" shape="poly" coords="284,52,266,59,269,74,263,86,255,90,261,107,256,117,270,122,279,126,284,135,289,140,293,145,302,147,310,155,319,146,331,142,330,131,303,106,295,104,291,96,296,90,296,82,298,78,296,70,289,66,283,51">
		<area alt="강서구" class="seoul" id="gangseo" onmouseover="point1.src='./images/seoul/gangseo.gif'" onmouseout="point1.src='./images/seoul/seoul.gif'" shape="poly" coords="131,200,140,213,156,221,163,226,166,233,159,239,150,237,137,235,136,247,133,258,115,263,111,249,103,245,98,252,86,239,69,244,62,238,49,236,35,222,52,202,55,193,68,180,64,165,77,156,103,183,131,200">
		<area alt="관악구" class="seoul" id="gwanak" onmouseover="point1.src='./images/seoul/gwanak.gif'" onmouseout="point1.src='./images/seoul/seoul.gif'" shape="poly" coords="180,317,181,317,200,310,205,302,216,311,227,306,240,307,244,326,259,331,269,342,261,350,255,366,240,370,234,377,211,375,203,361,196,355,192,345,182,334,190,328,181,314">
		<area alt="광진구" class="seoul" id="gwangjin" onmouseover="point1.src='./images/seoul/gwangjin.gif'" onmouseout="point1.src='./images/seoul/seoul.gif'" shape="poly" coords="382,199,381,199,373,208,363,205,355,218,357,231,347,242,344,250,341,258,351,268,364,266,382,260,395,240,396,228,392,215,381,207,381,197">
		<area alt="구로구" class="seoul" id="guro" onmouseover="point1.src='./images/seoul/guro.gif'" onmouseout="point1.src='./images/seoul/seoul.gif'" shape="poly" coords="95,277,95,278,90,299,93,312,87,326,112,331,122,318,130,317,138,302,150,308,159,313,162,323,174,323,177,314,168,295,157,275,145,280,144,291,133,284,119,285,114,291,106,295,98,275">
		<area alt="금천구" class="seoul" id="geumcheon" onmouseover="point1.src='./images/seoul/geumcheon.gif'" onmouseout="point1.src='./images/seoul/seoul.gif'" shape="poly" coords="151,307,161,317,164,322,185,324,186,329,184,341,192,345,192,353,198,356,202,361,189,375,172,377,171,367,158,348,163,341,159,333,150,326,148,304">
		<area alt="노원구" class="seoul" id="nowon" onmouseover="point1.src='./images/seoul/nowon.gif'" onmouseout="point1.src='./images/seoul/seoul.gif'" shape="poly" coords="361,39,361,40,346,47,335,50,334,64,329,74,336,83,338,95,339,109,334,115,325,120,326,129,331,136,335,145,349,151,364,141,373,141,382,143,385,137,384,130,395,120,391,105,377,101,368,91,372,84,378,78,375,61,381,49,372,47,364,47,360,38">
		<area alt="도봉구" class="seoul" id="dobong" onmouseover="point1.src='./images/seoul/dobong.gif'" onmouseout="point1.src='./images/seoul/seoul.gif'" shape="poly" coords="283,52,282,52,293,69,300,73,300,81,293,86,294,95,293,102,302,105,321,124,326,113,334,113,339,103,336,86,328,74,332,63,335,49,322,42,312,43,306,33,293,30,282,52">
		<area alt="동대문구" class="seoul" id="dongdaemun" onmouseover="point1.src='./images/seoul/dongdaemun.gif'" onmouseout="point1.src='./images/seoul/seoul.gif'" shape="poly" coords="353,158,351,158,342,161,340,165,327,168,321,172,320,179,312,187,306,195,309,202,322,198,330,201,335,213,346,214,353,216,361,203,359,186,349,183,347,169,356,164,352,155">
		<area alt="동작구" class="seoul" id="dongjak" onmouseover="point1.src='./images/seoul/dongjak.gif'" onmouseout="point1.src='./images/seoul/seoul.gif'" shape="poly" coords="225,270,214,278,203,278,195,289,197,302,181,309,176,319,199,312,205,304,212,304,216,311,226,303,233,309,240,305,242,311,244,324,249,330,259,329,263,322,262,305,264,297,257,294,258,280,245,277,223,267">
		<area alt="마포구" class="seoul" id="mapo" onmouseover="point1.src='./images/seoul/mapo.gif'" onmouseout="point1.src='./images/seoul/seoul.gif'" shape="poly" coords="242,228,237,219,224,224,202,222,197,209,180,199,174,185,171,178,157,175,145,186,147,196,131,199,152,220,160,223,168,235,190,247,206,249,214,261,220,262,222,250,226,246,231,248,238,244,236,234,243,226">
		<area alt="서대문구" class="seoul" id="seodaemun" onmouseover="point1.src='./images/seoul/seodaemun.gif'" onmouseout="point1.src='./images/seoul/seoul.gif'" shape="poly" coords="224,160,223,160,216,163,207,176,197,187,181,194,182,200,199,211,202,223,220,223,237,221,242,206,235,195,235,179,235,167,225,159"  >
		<area alt="서초구" class="seoul" id="seocho" onmouseover="point1.src='./images/seoul/seocho.gif'" onmouseout="point1.src='./images/seoul/seoul.gif'" shape="poly" coords="291,263,284,273,277,281,258,283,263,296,268,307,262,320,263,333,272,346,277,336,286,344,291,352,300,353,308,341,315,347,318,376,338,391,350,387,355,371,371,369,370,357,378,348,366,328,347,336,336,342,325,330,311,312,301,289,298,273,292,262" >
		<area alt="성동구" class="seoul" id="seongdong" onmouseover="point1.src='./images/seoul/seongdong.gif'" onmouseout="point1.src='./images/seoul/seoul.gif'" shape="poly" coords="308,202,302,207,305,217,296,224,287,235,298,254,309,245,327,248,338,255,345,247,343,238,354,228,354,217,331,212,327,200,317,199,307,200" >
		<area alt="성북구" class="seoul" id="seongbuk" onmouseover="point1.src='./images/seoul/seongbuk.gif'" onmouseout="point1.src='./images/seoul/seoul.gif'" shape="poly" coords="353,149,352,149,355,161,342,159,335,170,318,171,314,180,309,190,304,192,289,189,282,178,271,173,266,172,264,164,265,152,261,137,253,122,261,119,267,124,278,125,287,134,292,143,301,148,309,156,321,146,332,142,340,151,350,148" >
		<area alt="송파구" class="seoul" id="songpa" onmouseover="point1.src='./images/seoul/songpa.gif'" onmouseout="point1.src='./images/seoul/seoul.gif'" shape="poly" coords="395,241,395,240,380,265,367,269,349,269,352,288,356,294,374,298,387,306,392,310,400,321,404,328,408,339,418,335,415,326,426,325,436,325,435,312,442,308,446,291,425,289,421,276,408,266,403,257,404,249,396,238" >
		<area alt="양천구" class="seoul" id="yangcheon" onmouseover="point1.src='./images/seoul/yangcheon.gif'" onmouseout="point1.src='./images/seoul/seoul.gif'" shape="poly" coords="96,251,95,274,98,284,106,288,107,298,115,292,120,283,134,286,142,291,149,279,159,276,157,265,165,251,163,238,148,234,133,234,134,252,124,261,112,259,111,248,104,244,95,250" >
		<area alt="영등포구" class="seoul" id="yeongdeungpo" onmouseover="point1.src='./images/seoul/yeongdeungpo.gif'" onmouseout="point1.src='./images/seoul/seoul.gif'" shape="poly" coords="167,232,161,241,164,255,157,264,158,279,168,287,173,311,176,318,186,303,197,299,200,291,204,274,216,274,223,268,219,260,212,259,204,246,188,247,167,228" >
		<area alt="용산구" class="seoul" id="yongsan" onmouseover="point1.src='./images/seoul/yongsan.gif'" onmouseout="point1.src='./images/seoul/seoul.gif'" shape="poly" coords="247,227,256,226,267,233,285,237,291,246,296,248,298,254,289,262,283,274,275,281,259,283,252,278,242,280,236,271,224,270,220,259,223,250,229,245,232,250,238,244,236,234,246,225" >
		<area alt="은평구" class="seoul" id="eunpyeong" onmouseover="point1.src='./images/seoul/eunpyeong.gif'" onmouseout="point1.src='./images/seoul/seoul.gif'" shape="poly" coords="250,121,250,120,237,106,231,91,215,90,201,100,184,109,180,134,174,151,177,171,174,182,177,197,195,180,210,172,221,156,229,146,224,133,237,126,249,119"  >
		<area alt="종로구" class="seoul" id="jongno" onmouseover="point1.src='./images/seoul/jongno.gif'" onmouseout="point1.src='./images/seoul/seoul.gif'" shape="poly" coords="250,123,250,122,234,132,226,145,231,151,222,161,237,166,237,184,234,195,241,208,255,203,267,210,277,203,294,205,303,202,302,192,282,190,278,176,266,176,259,168,267,158,260,137,247,120">
		<area alt="중구" class="seoul" id="junggu" onmouseover="point1.src='./images/seoul/junggu.gif'" onmouseout="point1.src='./images/seoul/seoul.gif'" shape="poly" coords="246,208,239,220,245,227,255,226,270,234,284,237,296,221,305,212,301,203,286,207,273,205,261,210,245,205"  >
		<area alt="중랑구" class="seoul" id="jungnang" onmouseover="point1.src='./images/seoul/jungnang.gif'" onmouseout="point1.src='./images/seoul/seoul.gif'" shape="poly" coords="369,140,368,140,355,150,357,159,355,168,350,171,355,184,362,187,362,205,372,202,383,196,391,185,392,176,400,170,398,141,385,136,377,146,369,139" >
	</map>
</div> 
   
   
   
   
   
   
   
   <div id="section4">
   
   		<!-- 카테고리 -->
   		<form action="">
   			
			<ul>
			   <li><a class="menu" href="">진행중인할인행사</a></li>
			   <li><a class="menu" href="">종료된할인행사</a></li>
			</ul>
   		</form>
   	
   </div>
   
   <!-- 검색하기전 화면 -->
   <div id="section5">
   
   		<!-- 광고/홀정보 -->
   		<!-- 위의 선택사항 없이 페이지 처음 구성은 광고이미지만
   		     선택사항 클릭시마다 그에 해당하는 광고/상품 이미지를 보여준다 -->
		<form>
			<ul>
				<li><a>광고이미지</a></li>
				<li><a>광고이미지</a></li>
				<li><a>광고이미지</a></li>
			</ul>
		</form>
   </div>
   <br>
   <span id="test"></span>
   <!-- 검색 후 화면 -->
   <!-- <div id="section5">
   
   		광고/홀정보
   		위의 선택사항 없이 페이지 처음 구성은 광고이미지만
   		     선택사항 클릭시마다 그에 해당하는 광고/상품 이미지를 보여준다
		<form action="">
			<ul>
				<li id="go">
					<a href="광고상세로이동">광고이미지</a><br>
					<a href="광고상세로이동"><input type="text" value="가격/주소 불러오기"></a>
				</li>
				<li id="go">
					<a href="">광고이미지</a><br>
					<a href=""><input type="text" value=""></a>
				</li>
				<li id="go">
					<a href="">광고이미지</a><br>
					<a href=""><input type="text" value=""></a>
				</li>
				
				<li id="go"><a>상품이미지</a></li>
				<li id="go"><a>상품이미지</a></li>
				<li id="go"><a>상품이미지</a></li>
			</ul>
		</form>
   </div>
   <br>
    -->
   
   <!-- target = 새창으로 전환한다. 
        alt = 이미지 못불러올 시 메세지-->
   
   <div id="section6">
   		<a id="go1" target="_blank">
   			<img alt="" src="./img/images1.jpg" width="100" height="250">
   			<img alt="" src="./img/images2.jpg" width="100" height="250">
   			<img alt="" src="./img/images3.jpg" width="100" height="250">
   			<img alt="" src="./img/images4.jpg" width="100" height="250">
   			<img alt="" src="./img/images5.jpg" width="100" height="250">
   		</a>
   		
   		
   		<div class="desc">글 작성한 값 불러오기
   		<a id="go" target="_blank" href="상품상세정보로">
   			<img alt="" src="${list }" width="100" height="50">
   		</a>
   		</div>
   </div>
   <br>
   
  <!--  <div id="section6">
   		<a  target="_blank" href="./img/images2.jpg">
   			<img alt="" src="./img/images2.jpg" width="150" height="250">
   		<div class="desc">글 작성한 값 불러오기</div>
   		</a>
   		
   </div> -->
   
   
   
   
   
   
   
</div><!-- /container -->



<div id="footer">
</div>



</div><!-- /footer -->
</body>
</html>



