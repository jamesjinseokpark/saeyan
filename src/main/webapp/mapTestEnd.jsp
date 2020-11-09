<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>마커에 클릭 이벤트 등록하기</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a6d8aa5bbd65de785c05503aa93df3ae&libraries=services"></script>
</head>
<body>
<div id="map" style="width:100%;height:350px;"></div>
<p><em>마커를 클릭해주세요!</em></p> 

<script>
var ii=0;
var i1=0;
var title = new Array();
var addr = new Array();
var snum = new Array();

$.ajax({
	url : '/admin/rest/map',
	dataType : 'json', /*html, text, json, xml, script*/
// 	method : 'get',
	async : false,
	success : function(data) {
		$.each(data, function(key,value) {
			$.each(value, function(k1,v1) {
// 				console.log("ii=",ii);
// 				console.log("k1=",k1);
// 				console.log("v1=",v1);
// 				console.log("------------------------");
				if(ii%3==0){
					snum.push(v1);
				} else if(ii%3==1){
					title.push(v1);
				} else if(ii%3==2){
// 					addr.push(v1);
					addr[i1]=v1;
					i1++;
				}
				ii++;
			});
		})
	}
});
// console.log(snum[0]);
// console.log(title[0]);
// console.log(addr[0]);

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

var tt="";
var sn="";

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

for(var i=0;i<addr.length;i++){

			console.log(i);
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(addr[i], function(result, status) {
			sn = snum.shift();
			tt = title.shift();
	    // 정상적으로 검색이 완료됐으면 
	     
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        
	        var positions = [
				{
// 					title: , 
// 					content:'<div>test1</div>',
// 					latlng: ,
					snum: sn
				}	
	        ];
	        console.log(positions);
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords,
	            title : tt
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+tt+'</div>'
	        });
	        infowindow.open(map, marker);
	kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker,positions[0].snum));
 	//클릭이벤트
 	  function makeOverListener(map, marker, snum) {
 	      return function() {
 	         location.href='/stores/info?snum='+snum;
 	      };
 	  }
	});
} 
</script>
</body>
</html>