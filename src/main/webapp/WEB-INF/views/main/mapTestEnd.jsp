 <%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.hk.saeyan.dto.ManagerInfo" %>
<%@ page import="com.hk.saeyan.dto.Members" %>
<% ManagerInfo user = (ManagerInfo)request.getAttribute("user");%>
<%-- <% Members loginMember = (Members)request.getAttribute("loginMember");%> --%>
<%@ include file="../include/headerReal.jsp" %>
    <meta charset="utf-8">
    <title>인근 점포</title>
    <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:750px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
    <meta charset="utf-8">
    <title>마커에 클릭 이벤트 등록하기</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a6d8aa5bbd65de785c05503aa93df3ae&libraries=services"></script>
<div id="container">
	<div id="content" class="brd-wr">
		<div class="tit-area">
		<h2>인근 매장 찾기</h2>
		<p class="sub-tx">원하시는 지역을 검색해 주세요.</p>
		</div>
		
			
				<div class="map_wrap">
					<div id="map" style="width:2400px;height:750px;position:relative;overflow:hidden;"></div>
    					 <div id="menu_wrap" class="bg_white">
       						 <div class="option">
            					<div>
               					 <form onsubmit="searchPlaces(); return false;">
                   				 키워드 : <input type="text" value="${user.userFirstAddr } " id="keyword" size="15">
                    			<button type="submit">검색하기</button> 
               					 </form>
           					 </div>
        				</div>
        				<hr>
        				<ul id="placesList"></ul>
        				<div id="pagination"></div>
    					</div>
					</div>
				
			
		</div>
	</div>


<p><em>마커를 클릭해주세요!</em></p> 
<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level:7 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch( '${user.userFirstAddr}', function(result, status) {
// 정상적으로 검색이 완료됐으면 
	console.log("맵생성");
 	if (status === kakao.maps.services.Status.OK) {
    	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
   		map.setCenter(coords);
	} 
});    

//장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  
var storeInfos = [];
var addrSearchData = [];

$.ajax({
	url : '/admin/rest/map',
	dataType : 'json', /*html, text, json, xml, script*/
// 	method : 'get',
	async : false,
	success : function(data) {
		storeInfos = data;
		console.log('storeInfosaaa:', storeInfos);
	}
});

//키워드로 장소를 검색합니다
searchPlaces();

//키워드 검색을 요청하는 함수입니다
function searchPlaces() {
	console.log("검색기능되니");
    var keyword = document.getElementById('keyword').value;
    console.log("키워드는", keyword);

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }
    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
//     ps.keywordSearch( keyword, placesSearchCB); 
    placesSearch();
   // displayPlaces(storeInfos);

    // 페이지 번호를 표출합니다
   // displayPagination(pagination);

    var geocoder = new kakao.maps.services.Geocoder();

    geocoder.addressSearch(keyword, function(result) {
	    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	    map.setCenter(coords);
	});

	
}

function placesSearch() {
    var areaResult = setArea_num();
    console.log("스토어 area_num", areaResult);
    console.log('storeInfos:',storeInfos);
    var arrFilterDatas = storeInfos.filter(data => data.area_num == areaResult);
    console.log("result는", arrFilterDatas);
    displayPlaces(arrFilterDatas);
}

//장소검색이 완료됐을 때 호출되는 콜백함수 입니다
// function placesSearchCB(storeInfos, status, pagination) {
// function placesSearchCB(status, pagination) {
// 	//console.log("data는", data);
//     if (status === kakao.maps.services.Status.OK) {
	
//         // 정상적으로 검색이 완료됐으면
//         // 검색 목록과 마커를 표출합니다
        
//         //검색어 키워드가 들어간 주소만 배열로 리턴v
//         var areaResult = setArea_num();
//         console.log("스토어 area_num", areaResult);
//         console.log('storeInfos:',storeInfos);
//         var result = addrSearchData.filter(areaResult == storeInfos.area_num);
//         console.log("result는", result);
//         displayPlaces(result);

//         // 페이지 번호를 표출합니다
//         displayPagination(pagination);

//     } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

//         alert('검색 결과가 존재하지 않습니다.');
//         return;

//     } else if (status === kakao.maps.services.Status.ERROR) {

//         alert('검색 결과 중 오류가 발생했습니다.');
//         return;

//     }
// }
// console.log("타니111");

 
	//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
	var saddressArr = storeInfos.map( addressData => addressData.saddress);
	saddressArr.forEach(function(addr, index) {
		geocoder.addressSearch(addr, function(result, status) {
			console.log('result:',result);
			console.log('storeInfos:',storeInfos[index])
			//forEach문은 반복문이라서 하나씩 쓰기위해서 [index]가 필요
			var title = storeInfos[index].sname;
			var snum = storeInfos[index].snum;
	 	    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	 	  	var marker = new kakao.maps.Marker({
	 		    map: map,
	 	    	position: coords,
	 		});

	 	    // 인포윈도우로 장소에 대한 설명을 표시
	 		var infowindow = new kakao.maps.InfoWindow({
	 			content: '<div style="width:150px;text-align:center;padding:6px 0;">'+title+'</div>',
	 			disableAutoPan: true
	 		});
	 	    infowindow.open(map, marker);
	 	    kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, snum));
	 		//클릭이벤트
	 	 	function makeOverListener(map, marker, snum) {
	 			return function() {
	 	         	location.href='/stores/info?snum='+snum;
	 	      	};
	 	  	}
		});
	
	});
		
// storeInfos.forEach(function(storeInfos, index) {
// 	geocoder.addressSearch(storeInfos.saddress, function(result, status) {
// 		console.log("result는11",result);
// 		addrSearchData.push(result[0]);
// 	});

// });

// // storeInfos 갯수만큼 반복
// for (var i = 0; i < storeInfos.length; i++) {
// 	// 주소로 좌표를 검색합니다
// 	geocoder.addressSearch(storeInfos[i].saddress, function(result, status) {
// 		// result값은 1개의 배열로 값이 오기때문에 0번째 값을 배열에 넣음 
// 		addrSearchData.push(result[0]);
// 	});
// };

console.log('addrSearchData:',addrSearchData);

// setTimeout(() => {
// 	for (var j = 0; j < storeInfos.length; j++) {
// 	    var coords = new kakao.maps.LatLng(addrSearchData[j].y, addrSearchData[j].x);
// 	    console.log("coords는",coords);
// 	  	var marker = new kakao.maps.Marker({
// 		    map: map,
// 	    	position: coords,
// 	    	title : storeInfos[j].sname
// 		});
// 		console.log('marker:', marker);
// 	    // 인포윈도우로 장소에 대한 설명을 표시합니다
// 		var infowindow = new kakao.maps.InfoWindow({
// 			content: '<div style="width:150px;text-align:center;padding:6px 0;">'+storeInfos[j].sname+'</div>',
// 			disableAutoPan: true
// 		});
// 	    infowindow.open(map, marker);
// 	    kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker,storeInfos[j].snum));
// 		//클릭이벤트
// 	 	function makeOverListener(map, marker, snum) {
// 			return function() {
// 	         	location.href='/stores/info?snum='+snum;
// 	      	};
// 	  	}
// 	};
// }, 500);

console.log('addrSearchData1111:',addrSearchData);
console.log("storeInfos2222:", storeInfos);


function displayPlaces(arrFilterDatas){
	console.log("목록", arrFilterDatas);

	if(arrFilterDatas.length==0){
		alert("검색결과가 없습니다.");
	}
    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';

	//  검색 결과 목록에 추가된 항목 제거
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커제거
    // removeMarker();
    for ( var i=0; i<arrFilterDatas.length; i++ ) {

        // 마커를 생성 + 지도에 표시
        var placePosition = new kakao.maps.LatLng(arrFilterDatas[i].y, arrFilterDatas[i].x),
            //marker = Marker(placePosition, i), 
            itemEl = getListItem(i, arrFilterDatas[i]); // 검색 결과 항목 Element를 생성하기

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가
        bounds.extend(placePosition);

        fragment.appendChild(itemEl);
       
    }
    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정
   // map.setBounds(bounds);
   
}

//검색결과 항목을 Element로 반환 함수입니다
function getListItem(index, arrFilterDatas) {
	console.log("storeInfos", storeInfos);
    var addressDiv = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + arrFilterDatas.sname + '</h5>';

//     if (places.road_address_name) {
//         itemStr += '    <span>' + places.road_address_name + '</span>' +
//                     '   <span class="jibun gray">' +  places.address_name  + '</span>';
//     } else {
//         itemStr += '    <span>' +  places.address_name  + '</span>'; 
//     }
	itemStr += '  <span >' + arrFilterDatas.saddress  + '</span>';   
                 
      itemStr += '  <span class="tel">' + arrFilterDatas.snum  + '</span>' +
                '</div>';           

    addressDiv.innerHTML = itemStr;
    addressDiv.className = 'item';

    return addressDiv;
}

function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}


function setArea_num(){
	var aval = $("#keyword").val();
	console.log("aval", aval);
	if(aval.indexOf("강남구")!=-1){
		return '1';
	} else if (aval.indexOf("강동구")!=-1){
		return '2';
	} else if (aval.indexOf("강북구")!=-1){
		return '3';
	} else if (aval.indexOf("강서구")!=-1){
		return '4';
	} else if (aval.indexOf("관악구")!=-1){
		return '5';
	} else if (aval.indexOf("광진구")!=-1){
		return '6';
	} else if (aval.indexOf("구로구")!=-1){
		return '7';
	} else if (aval.indexOf("금천구")!=-1){
		return '8';
	} else if (aval.indexOf("노원구")!=-1){
		return '9';
	} else if (aval.indexOf("도봉구")!=-1){
		return '10';
	} else if (aval.indexOf("동대문구")!=-1){
		return '11';
	} else if (aval.indexOf("동작구")!=-1){
		return '12';
	} else if (aval.indexOf("마포구")!=-1){
		return '13';
	} else if (aval.indexOf("서대문구")!=-1){
		return '14';
	} else if (aval.indexOf("서초구")!=-1){
		return '15';
	} else if (aval.indexOf("성동구")!=-1){
		return '16';
	} else if (aval.indexOf("성북구")!=-1){
		return '17';
	} else if (aval.indexOf("송파구")!=-1){
		return '18';
	} else if (aval.indexOf("양천구")!=-1){
		return '19';
	} else if (aval.indexOf("영등포구")!=-1){
		return '20';
	} else if (aval.indexOf("용산구")!=-1){
		return '21';
	} else if (aval.indexOf("은평구")!=-1){
		return '22';
	} else if (aval.indexOf("종로구")!=-1){
		return '23';
	} else if (aval.indexOf("중구")!=-1){
		return '24';
	} else {
		return '25';
	}
}

</script>
</body>
</html>