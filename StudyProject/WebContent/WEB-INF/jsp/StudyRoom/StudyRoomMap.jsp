<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>지도 검색</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=0" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://bootswatch.com/paper/bootstrap.min.css" >
<link rel="stylesheet" href="http://bootswatch.com/paper/bootstrap.css" >
<script type="text/javascript" src="../OpenStudy/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=850448c69975031c4b91c77e0342ba63"></script>
	<script>
	         
	     	function inputmap() 
	     	{
		       /*  <label id="latlng" hidden=""></label>
		        <label id="lating1" hidden=""></label> */
	     		opener.document.getElementById("p_id").value = "latlng";
	    	}
				//변수 설정 및 최초 위치 설정
	            var map;
	            var marker = '';
	            var position = new daum.maps.LatLng(37.5668260, 126.978656);
				
				$("#map").ready(function() {
					//검색창에 엔터 입력시 좌표 검색
	                $("#txtAddress").keydown(function(e) {
	                    if (e.keyCode == 13) {
	                        Search();
	                    }
	                });
					
					//지도 초기화
	                map = new daum.maps.Map(document.getElementById('map'), {
	                    center: position,
	                    level: 4,
	                    mapTypeId: daum.maps.MapTypeId.ROADMAP
	                });
	
	/*                marker = new daum.maps.Marker({
	                    position: position
	                });
	
	                marker.setMap(map)
	*/
					//지도상의 위치 클릭시 클릭한 위치의 좌표 확인
	                daum.maps.event.addListener(map, "click", function(e) {
						//기존에 설정된 마커 삭제
	                    if (marker != '') {
	                        marker.setMap(null);
	                    }
	                    //temp에 새로 클릭된 좌표 입력
	                    var lat = e.latLng.getLat();
	                    var lng = e.latLng.getLng();
						var temp = new daum.maps.LatLng(lat, lng);
						//좌표 출력
						/* $("#latlng").html("동경 " + lat.toString().substr(0, 10) + ", 북위 " + lng.toString().substr(0, 10)); */
	                    $("#latlng").html(lat.toString().substr(0, 10));
						$("#latlng1").html(lng.toString().substr(0, 10));
						opener.document.getElementById("p_id").value = lat;
						opener.document.getElementById("t_id").value = lng;
						
						
						/* alert(lng);
						alert(lat); */
						//temp에 입력된 좌표값을 중심으로 지도 이동
	                    map.panTo(temp);
						//temp에 입력된 좌표값에 마커 설정
	                    marker = new daum.maps.Marker({
	                        position: temp
	                    });
	                    marker.setMap(map);
	                });
	            });
	
	            function Search() {
	                var query = $("#txtAddress").val();
	                $("#txtAddress").val('');
	                getPoint(query);
	            }
	
				//주소->좌표로 변환해주는 api 사용
	            function getPoint(query) {
	                var oScript = document.createElement("script");
	                oScript.type = "text/javascript";
	                oScript.charset = "utf-8";
	                oScript.src = "http://apis.daum.net/local/geo/addr2coord?apikey=d82c75b3a6b33cfad136796fbe876e68a518b478&output=json&callback=pongSearch&q=" + encodeURI(query);
	                document.getElementsByTagName("head")[0].appendChild(oScript);
	            }
				
				//좌표 변환 후 해당 좌표를 이용해 콜백(클릭시와 동일한 동작)
	            function pongSearch(data) {
	                marker = '';
	                if (data.channel.item.length == 0) {
	                    alert("결과가 없습니다.");
	                } else {
	                    if (marker != '') {
	                        marker.setMap(null);
	                    }
	                    var temp = new daum.maps.LatLng(data.channel.item[0].lat, data.channel.item[0].lng);
	                    $("#latlng").html((data.channel.item[0].lat).toString().substring(0, 10) + ", " + (data.channel.item[0].lng).toString().substring(0, 10));
	                    map.panTo(temp);
	                    marker = new daum.maps.Marker({
	                        position: temp
	                    });
	                    marker.setMap(map);
	                }
	            }
	        </script>
    </head>
    <body>
	    <div>
	        <label>주소검색 : </label>
	        <input id ="txtAddress" class="form-control" type="text" style="width : 100%">
	        <button type="button" class="btn btn-default" onclick="Search();">주소찾기</button>
        </div>
        <br>
        <div>
        <form id="frm" class="frm">
	        <label hidden="">좌표 : </label>
	        <label id="latlng" ></label>
	        <label id="latlng1" ></label>
	    </form>
	    </div>
        	<div id ="map" style="width : 100%; height:350px">
	    </div>
	    <br>
	    <div class="col-xs-10"></div>
	    <div>
	    	<button class="btn btn-default" type="button" id="map2" name="map2" onclick="inputmap()">닫기</button>
	    </div>
    </body>
</html>