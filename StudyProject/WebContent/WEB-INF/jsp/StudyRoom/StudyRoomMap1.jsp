<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String dong = request.getParameter("dongkyung");
	String buk = request.getParameter("bukwi");
	String shop = request.getParameter("shopName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지도</title>
</head>
<body>
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=850448c69975031c4b91c77e0342ba63&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

var map = new daum.maps.Map(mapContainer, mapOption);

//마커가 표시될 위치입니다 
var markerPosition  = new daum.maps.LatLng(<%=dong%>, <%=buk%>); 

//마커를 생성합니다
var marker = new daum.maps.Marker({
position: markerPosition
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="padding:5px;"><%=shop%> <br><a href="http://map.daum.net/link/map/<%=shop%>,<%=dong%>,<%=buk%>" style="color:blue" target="_blank">큰지도보기</a> <a href="http://map.daum.net/link/to/<%=shop%>,<%=dong%>,<%=buk%>" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
iwPosition = new daum.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

//인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({
position : iwPosition, 
content : iwContent 
});

//마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 




<%-- // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(<%=dong%>, <%=buk%> ), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

/* // 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places(); 

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
}; */

var map = new daum.maps.Map(mapContainer, mapOption);

//마커가 표시될 위치입니다 
var markerPosition  = new daum.maps.LatLng(<%=dong%>, <%=buk%>); 

//마커를 생성합니다
var marker = new daum.maps.Marker({
position: markerPosition
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="padding:5px;"><%=shop%> <br><a href="http://map.daum.net/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="http://map.daum.net/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
iwPosition = new daum.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

//인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({
position : iwPosition, 
content : iwContent 
});

//마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 


// 키워드로 장소를 검색합니다
ps.keywordSearch('<%=shop%>', placesSearchCB); 

/* // 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (status, data, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new daum.maps.LatLngBounds();

        for (var i=0; i<data.places.length; i++) {
            displayMarker(data.places[i]);    
            bounds.extend(new daum.maps.LatLng(data.places[i].latitude, data.places[i].longitude));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}
 */
//마커가 표시될 위치입니다 
 var markerPosition  = new daum.maps.LatLng(33.450701, 126.570667); 

 // 마커를 생성합니다
 var marker = new daum.maps.Marker({
     position: markerPosition
 });

 // 마커가 지도 위에 표시되도록 설정합니다
 marker.setMap(map);
 daum.maps.event.addListener(marker, 'click', function() {
     // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
     infowindow.setContent('<div style="padding:5px;font-size:12px;">' + <%=shop%> + '</div>');
     infowindow.open(map, marker);
 });
 
// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new daum.maps.Marker({
        map: map,
        position: new daum.maps.LatLng(place.latitude, place.longitude) 
    });

    // 마커에 클릭이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + <%=shop%> + '</div>');
        infowindow.open(map, marker);
    });
} --%>
</script>
</body>
</html>