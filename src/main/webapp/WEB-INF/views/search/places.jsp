<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/home_nav.jsp"%>
<%@include file="../include/nav.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!-- Header -->
<header class="masthead" style="background-image: url(/img/background.jpg);">
	<div class="intro-lead-in mx-auto">
	<img src="/img/logo.png" width="25%" height="25%">
	<p>Nyam-Nyam</p></div>
</header>
<section>
    <div id="user_header_mini" style="margin-top: 30px">
      <div class="container" style="width: 70%;" >
        <div class="row align-items-center mt-0">
         <h4 class="mr-auto"><i class="fas fa-search"></i> "${searchContent}"에 대한 검색결과</h4> 
         <h4 class="ml-auto"> ${fn:length(places)}건</h4>
        </div>
            </div>
    </div>
  </section>

<section>
<div class="container">
<div class="row ml-auto justify-content-center mb-2 mr-5 mt-5" >
    	<div class="card" style="width:100%">
        	 <div class="card-body">
               <div class="map_wrap" style="position:relative;">
				    <div id="map" style="width:100%;height:300px;position:relative;overflow:hidden;"></div>
				    <div id="menu_wrap" class="bg_white" 
				    style="position:absolute; top:10px; left:10px; width:30%; border:solid 1px;">
				        <div class="option">
				            <div>
				                <form onsubmit="searchPlaces(); return false;">
				                   <input type="hidden" value="${places[0].location} ${places[0].shopName}" id="keyword" size="15"> 
				                </form>
				            </div>
				        </div>
				        <hr>
				        <div id="placesList"></div>
				        
				    </div>
				</div>
             </div>
      	</div>  
</div>
	<div class="mt-1 row">
	<c:forEach var="place" items="${places}">
	<div class="col-md-4 my-3">
		<div class="card bg-light">
			<a href="/review/${place.id}">
			<div class="nearby" style="position:relative">
			<img src="/media/${place.image1}" class="card-img-top nearby_photo" style="cursor:pointer; z-index:11;" width="300px" height="300px" />
			<div class="row nearby_info align-items-center justify-content-center" style="width:80%">
				<p class="ml-4"><i class="fas fa-heart"></i> ${place.likeCount}</p>
				<p class="ml-3"><i class="fas fa-bookmark right-float"></i> ${place.clippingCount}</p>
			</div>
			
			<div class="card-img-overlay ">
				<div class="list-badge">
					<span class="badge badge-light">${place.location}</span> 
					<span class="badge badge-dark">${place.category}</span>
				</div>

			</div>
			</div>
			</a>

			<div id="user" class="card-body text-dark " style="height: 70px;">
				<div class="d-flex align-items-center">
					<p class="card-text ">
					<p class="img float-left mr-2">
						<img src="/media/${place.profile}" class="border rounded-circle" onError="javascript:this.src='/img/unknown.png'" width="36" height="36">
					</p>
					<p class="name clearfix " style="font-size: 11px;">${place.username}</p>
				</div>
				

			</div>

		</div>
	</div>
	</c:forEach>
		
	<!--카드끝-->
			</div>
	</div>
	</section>
<%@include file="../include/footer.jsp"%>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a0869af0b95acb3e599ca40afd01eb68&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a0869af0b95acb3e599ca40afd01eb68&libraries=LIBRARY"></script>
<script src="/js/nav-style.js"></script>
<script>
//호버로 정보보여주기
$( document ).ready(function() {
	$('.nearby').hover(function(){
		$(this).find('.nearby_photo').css('filter', 'brightness(0.30)');
		$(this).find('.nearby_info').css('visibility', 'visible');
	
	}, function(){
	$(this).find('.nearby_photo').css('filter','');
	$(this).find('.nearby_info').css('visibility', 'hidden');
	
	
	});
});

var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);


    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
 
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
           
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg"></span>' +
                '<div class="info">' +
                '   <strong>' + places.place_name + '</strong>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = '/img/maker_food.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(53, 65),  // 마커 이미지의 크기
        imgOptions =  {
          
            offset: new kakao.maps.Point(27, 69) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

	//근처맛집 호버로 정보보여주기
	$('.nearby').hover(function(){
		$(this).find('.nearby_photo').css('filter', 'brightness(0.30)');
		$(this).find('.nearby_info').css('visibility', 'visible');
	
}, function(){
	$(this).find('.nearby_photo').css('filter','');
	$(this).find('.nearby_info').css('visibility', 'hidden');

	
});

</script>
		</body>
		</html>