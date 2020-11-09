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
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var geocoder = new kakao.maps.services.Geocoder();
var xcoords = new Array();
var ycoords = new Array();
var title = new Array();
var addr = new Array();
var snum = new Array();
var ii=0;
var i1=0;

$.ajax({
	url : '/admin/rest/map',
	dataType : 'json', /*html, text, json, xml, script*/
	method : 'get',
	async: true,
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
		});
	}
});
console.log(snum);
console.log(title);
console.log(addr);

// setTimeout(function(){}, 3000);



	//주소로 좌표를 검색합니다
	geocoder.addressSearch(addr[0], function(result, status) {
 	// 정상적으로 검색이 완료됐으면 
		if (status === kakao.maps.services.Status.OK) {
						
			ycoords[0] = result[0].y;
			xcoords[0] = result[0].x;
// 			consloe.log("re",reult[0].y);
// 			consloe.log("re",reult[0].x);
			
			
		}
	});
	console.log(xcoords);
	console.log(ycoords);
	


// console.log(ycoords);
// console.log(xcoords);
geocoder.addressSearch(addr[1], function(result, status) {
	 // 정상적으로 검색이 완료됐으면 
	  if (status === kakao.maps.services.Status.OK) {
		 ycoords[1] = result[0].y;
		 xcoords[1] = result[0].x;
	  }
}); 

geocoder.addressSearch(addr[2], function(result, status) {
	 // 정상적으로 검색이 완료됐으면 
	  if (status === kakao.maps.services.Status.OK) {
		 ycoords[2] = result[0].y;
		 xcoords[2] = result[0].x;
	  }
});

console.log("ycoords[0]=",ycoords[0]);
console.log("xcoords[0]=",xcoords[0]);
console.log("ycoords[1]=",ycoords[1]);
console.log("xcoords[1]=",xcoords[1]);
console.log("ycoords[2]=",ycoords[2]);
console.log("xcoords[2]=",xcoords[2]);





// 마커를 표시할 위치입니다 
var positions = [
    {
        title: '테스트1', 
        content:'<div>test1</div>',
        latlng: new kakao.maps.LatLng(ycoords[0], xcoords[0]),
    	snum: '1111'
    },
    {
        title: '테스트2',
        content:'<div>test2</div>', 
        latlng: new kakao.maps.LatLng(ycoords[1], xcoords[1]),
        snum: '2222'
    },
    {
        title: '테스트3',
        content:'<div>test3</div>',
        latlng: new kakao.maps.LatLng(ycoords[2], xcoords[2]),
        snum: '3333'
    },
];
	
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	for (var i = 0; i < positions.length; i++) {

		// 마커 이미지의 이미지 크기 입니다
		var imageSize = new kakao.maps.Size(24, 35); 
		
		// 마커 이미지를 생성합니다    
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 

		
		// 마커를 생성합니다
 		var marker = new kakao.maps.Marker({
		 	map: map, // 마커를 표시할 지도
			position: positions[i].latlng, // 마커를 표시할 위치
			title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			image : markerImage // 마커 이미지 
		});

 		var infowindow = new kakao.maps.InfoWindow({
			content:positions[i].content
		});
 	
 	   kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, positions[i].snum));
	
 	//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
 	  function makeOverListener(map, marker, snum) {
 	      return function() {
 	         location.href='/stores/info?snum='+snum;
 	      };
 	  }

//  infowindow.open(map,marker);
 	}
	

</script>
</body>
</html>