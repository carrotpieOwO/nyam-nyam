<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/etc_nav.jsp"%>
<%@include file="../include/nav.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <section>
    <div id="user_header_mini" class="stickyUi ">
      <div class="container" style="width: 80%;" >
        <div class="row align-items-center mt-2" style="height: 70px;">
          <div class="profile">
            <a href="/user/mypage/${review.username}"><img src="/media/${review.profile}" 
              width="48" height="48" class="border rounded-circle"  onError="javascript:this.src='/img/unknown.png'"></a>
             
          <!-- /.avatar --></div>
          <div class="ml-2">
          <p class="my-auto">@${review.username}</p>
        </div> 
        <c:choose> 
	        <c:when test="${review.username==principal.username}">
	        	<div class="ml-auto">
	    		 <a href="/review/modify/${review.id}" class="btn btn-outline-dark">수정</a>  
	        	<button id="post-delete-submit" value="${review.id}" class="btn btn-outline-danger">삭제</button>
	        	</div>
	        </c:when>
	        <c:otherwise>
			<c:choose>
				<c:when test="${empty principal.id}">
				</c:when>
       	 		<c:when test="${review.follow eq true}">
       	 			<input type="hidden" id="followBoolean" value="true">
       	 			<a onclick="follow(${principal.id},${review.userId})" id="follow-true" class="btn btn-outline-dark ml-auto mt-2">
       	 			<i id="check" class="fas fa-user-check"></i> 팔로잉</a>
       	 		</c:when>
       	 		<c:otherwise>
       	 			<input type="hidden" id="followBoolean" value="false">
       	 			<a onclick="follow(${principal.id},${review.userId})" id="follow-false" class="btn btn-primary ml-auto mt-2  text-white">
       	 			<i id="plus" class="fas fa-user-plus"></i> 팔로우</a>
       	 		</c:otherwise>
       	 	</c:choose>	   
	        </c:otherwise>
        </c:choose>
        </div>
            </div>
    </div>
  </section>
    
    <!--디테일 -->
    <section>
    <div class="container" style="margin-top: 16px;">
      <div class="row">
        <div class="col-md-7">
          
          <div class="card" >
          <!-- 캐로셀 이미지  -->
          <div id="demo" class="carousel slide" data-ride="carousel">

			  <!-- The slideshow -->
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="/media/${review.image1}" width=630px height=630px>
			    </div>
			   <c:if test="${!empty review.image2}">
			    <div class="carousel-item">
			      <img src="/media/${review.image2}" width=630px height=630px>
			    </div>
			    </c:if>
			   <c:if test="${!empty review.image3}">			    
			    <div class="carousel-item">
			      <img src="/media/${review.image3}" width=630px height=630px>
			    </div>
			    </c:if>
			  </div>
			
			  <!-- Left and right controls -->
			 <c:if test="${!empty review.image2}">
			  <a class="carousel-control-prev my-auto" href="#demo" data-slide="prev" style="height:50%">
			    <span class="carousel-control-prev-icon"></span>
			  </a>
			  <a class="carousel-control-next" href="#demo" data-slide="next">
			    <span class="carousel-control-next-icon"></span>
			  </a>
			 </c:if>
			</div>
          
            <div class="card-img-overlay">
             <a type="button" class="badge badge-dark" style="opacity: 70%;"  data-toggle="modal" data-target="#likeModal" data-submit='${review.id}'> 
               <h4 class="my-auto mx-auto" style="color: white; letter-spacing: 4px"> <i id="likeCount" class="far fa-heart">${review.likeCount}</i></h4></a>
            </div>
            <div class="card-header">
              
              <!-- 좋아요 -->
               <div class="my-auto" style="position:relative;">
                  <a onclick="like(${review.id})"  style="position: absolute; top:50%; left:-5px; cursor: pointer;">
                 <c:choose>
	                 <c:when test="${review.like eq true}">
	                  	<i id="like-item-${review.id}" class=" fas fa-heart text-danger" style="font-size: 25px;"></i></a>
	                 </c:when>
	                 <c:otherwise>
	                 	 <i id="like-item-${review.id}" class="far fa-heart" style="font-size: 25px;"></i></a>
	                 </c:otherwise>
                 </c:choose>
                  </div>
            <i class="far fa-comment-dots ml-4" style="font-size: 25px;"></i>
            
            <!-- 북마크 --> 
             <div class=" float-right mr-2" style="position:relative;">
                  <a onclick="clipping(${review.id})"  style="position: absolute; top:50%; left:-5px; cursor: pointer;">
                  <c:choose>
	                 <c:when test="${review.clipping eq true}">
	                  	 <i id="clipping-item-${review.id}" class="fas fa-bookmark float-right text-warning" style="font-size: 25px;"></i></a>    	 
	                 </c:when>
	                 <c:otherwise>
	                  	 <i id="clipping-item-${review.id}" class="far fa-bookmark float-right" style="font-size: 25px;"></i></a>    	 
	                 </c:otherwise>
                 </c:choose>
             
             </div>
            </div>
            
            <!-- 댓글 리스트  -->
            <div class="card-body" id="comment-items">
            
                  
              <c:forEach var="comment" items="${comments}">
              <c:if test="${empty comments}">
              	<h4>댓글이 없습니다.</h4>
              </c:if>
              <c:if test="${comment.userId ne principal.id}">
              <div class="row align-items-center ml-1" style="height: 70px;">
                <div class="profile">
                  <a onclick="/user/mypage/${comment.username}" style="cursor: pointer">
                  <img src="/media/${comment.profile}" onError="javascript:this.src='/img/unknown.png'" class="rounded-circle border" width="40" height="40"></a>
                    <p class="my-auto" style="font-size: 11px;">
                    <fmt:formatDate value="${comment.createDate}" pattern="yyyy-MM-dd" /></p> 
                <!-- /.avatar --></div>
                <div class="ml-2">
                <p class="my-auto" style="font-size: 12px;">@${comment.username}</p>
                <div class="balloon test_3 ml-2" ><span>${comment.content}</span></div>
              </div> 
              </div>
              </c:if>
              <c:if test="${comment.userId eq principal.id}">
              <div id="comment-item-${comment.id}" class="row align-items-center justify-content-end text-right mr-1" style="height: 70px;">
                <div class="mr-2">
                  <p class="my-auto" style="font-size: 12px;">@${comment.username}</p>
                  
                  <div class="balloon test_4 ml" style="position: relative" ><span>${comment.content}</span>
                  <a onclick="commentDelete(${comment.id})" class="text-danger" style="position: absolute; top:-5px; left:-5px; cursor: pointer;">
                  <i class="fas fa-times-circle bg-white rounded-circle"></i></a>
                  </div>
                </div> 
                <div class="profile">
                  <a href="/user/mypage/${principal.username}">
                  <img src="/media/${principal.profile}"  onError="javascript:this.src='/img/unknown.png'" class="rounded-circle border" width="40" height="40"></a>
                    <p class="my-auto" style="font-size: 11px;">
                    <fmt:formatDate value="${comment.createDate}" pattern="yyyy-MM-dd" /></p>
                <!-- /.avatar --></div>
               </div>
             </c:if>
             
              </c:forEach>
                          </div>
            
            <!--  댓글쓰기  -->
                        <c:if test="${not empty principal.id}">
           
            <div class="card-footer">
            <input type="hidden" id="reviewId" value="${review.id}" /> 
                   <input type="hidden" id="userId" value="${principal.id}" />
                 <div class="input-group align-items-center">
                   <div class="profile mr-2 ">
                     <a href="/user/mypage/${principal.username}">
                  <img src="/media/${principal.profile}" onError="javascript:this.src='/img/unknown.png'"  class="rounded-circle border" width="40" height="40"></a></div>
                   <input type="text" id="content" class="form-control form-control-sm" placeholder="댓글달기...">
                   
                   <div class="input-group-append">
                     <button id="comment-submit" class="btn btn-secondary btn-sm " type="submit">보내기</button>
                   </div>
                 </div>      
            </div>
                   </c:if>
            
          </div>
        
</div>
        <div class="col-md-5">
          <!-- 후기 -->
        <div class="mb-2 ml-3 row">
         <c:forEach var="tag" items="${tags}">
         <form class="mr-2" action="/search" method="get">
        	<input type="hidden" name="searchMenu" value="태그"/>
        	<input type="hidden" name="searchContent" value="${tag}"/>
        	<button class="btn btn-outline-dark text-outline-light" type="submit">#${tag}</button>
        	</form>
          </c:forEach>
        </div>
          <div class="card">
            <div class="card-header">
            <div class=" row align-items-center">
               <h4 class="card-title ml-1">${review.shopName}</h4>
             	<p class="card-text ml-2" style="font-size: 12px;"><i class="fas fa-won-sign"></i> ${review.price}</p>
              </div>
				<p id="star_grade" class="mb-0">
		            <c:choose>
						<c:when test="${review.rating==0}">
			              <a><i class="fas fa-star"></i></a>
			              <a><i class="fas fa-star"></i></a>
			              <a><i class="fas fa-star"></i></a>
			              <a><i class="fas fa-star"></i></a>
			              <a><i class="fas fa-star"></i></a>
				        </c:when>
				        <c:when test="${review.rating==1}">
			              <a class="on"><i class="fas fa-star"></i></a>
			              <a><i class="fas fa-star"></i></a>
			              <a><i class="fas fa-star"></i></a>
			              <a><i class="fas fa-star"></i></a>
			              <a><i class="fas fa-star"></i></a>
				        </c:when>
				        <c:when test="${review.rating==2}">
			              <a class="on"><i class="fas fa-star"></i></a>
			              <a class="on"><i class="fas fa-star"></i></a>
			              <a><i class="fas fa-star"></i></a>
			              <a><i class="fas fa-star"></i></a>
			              <a><i class="fas fa-star"></i></a>
				        </c:when>
				        <c:when test="${review.rating==3}">
			              <a class="on"><i class="fas fa-star"></i></a>
			              <a class="on"><i class="fas fa-star"></i></a>
			              <a class="on"><i class="fas fa-star"></i></a>
			              <a><i class="fas fa-star"></i></a>
			              <a><i class="fas fa-star"></i></a>
				        </c:when>
				        <c:when test="${review.rating==4}">
			              <a class="on"><i class="fas fa-star"></i></a>
			              <a class="on"><i class="fas fa-star"></i></a>
			              <a class="on"><i class="fas fa-star"></i></a>
			              <a class="on"><i class="fas fa-star"></i></a>
			              <a><i class="fas fa-star"></i></a>
				        </c:when>
				        <c:when test="${review.rating==5}">
			              <a class="on"><i class="fas fa-star"></i></a>
			              <a class="on"><i class="fas fa-star"></i></a>
			              <a class="on"><i class="fas fa-star"></i></a>
			              <a class="on"><i class="fas fa-star"></i></a>
			              <a class="on"><i class="fas fa-star"></i></a>
				        </c:when>
				     </c:choose>
				   </p>
            </div>
            <div class="card-body">
              <p class="card-text">${review.content}
            </p>
            </div>
            <div class="card-footer" style="color:grey;"><i class="far fa-clock"></i> 
            <fmt:formatDate value="${review.createDate}"
							pattern="yyyy.MM.dd HH:mm" /></div>
          </div>
          <!-- 위치정보 -->
          <div class="card mt-3">
            <div class="card-header">
              <i class="fas fa-map-marker-alt"></i> <strong>위치 정보</strong>
            </div>
            <div class="card-body">
               <div class="map_wrap">
				    <div id="map" style="width:100%;height:300px;position:relative;overflow:hidden;"></div>
				    <div id="menu_wrap" class="bg_white">
				        <div class="option">
				            <div>
				                <form onsubmit="searchPlaces(); return false;">
				                   <input type="hidden" value="${review.location} ${review.shopName}" id="keyword" size="15"> 
				                </form>
				            </div>
				        </div>
				        <hr>
				        <div id="placesList"></div>
				        
				    </div>
				</div>
             </div>
          </div>
          
          <!-- 근처 맛집 정보 -->
          <div class="card mt-3">
            <div class="card-header">
              <i class="fas fa-utensils"></i> <strong>근처 맛집</strong>
            </div>
            <div class="card-body">
            <div class="row">
              <c:forEach var="near" items="${nearDtos}">    
             	 <div class="nearby mt-1 mx-auto"" style="position: relative;">      
            	  <a href="/review/${near.id}" >
             	 <img src="/media/${near.image1}" class="nearby_photo" width= 200px height= 200px;">
             	 
              	</a>
              	<p class="nearby_info">${near.shopName}</p>
              </div>
            </c:forEach>
            </div>
            </div>
          </div>

        </div>
      </div>
   </div>
<%@include file="../include/footer.jsp"%>
   
</section>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a0869af0b95acb3e599ca40afd01eb68&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a0869af0b95acb3e599ca40afd01eb68&libraries=LIBRARY"></script>

<script>
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

	//댓글달기
	$('#comment-submit').on('click', function() {
		var data = {
			reviewId: $('#reviewId').val(),
			userId: $('#userId').val(),
			content: $('#content').val()
		};
		
		$.ajax({
			type : 'POST',
			url : '/comment/write',
			data : JSON.stringify(data),
			contentType : 'application/json; charset=utf-8', //보내는 데이터
			dataType : 'json' //응답 데이터, 데이터 주고받을땐 무조건 스트링으로 인식해서 이렇게 해줘야 제이슨으로 인식함
		}).done(function(r) { //그래서 여기서 받을 때 잭슨이 제이슨을 자바스크립트로 바꿔줘서 자바스크립트 오브젝트화됨
			if (r.status.statusCode == 200) {
				makeCommentItem(r);
			}else{
				console.log(r);
				alert('댓글 등록 실패');
				}
		}).fail(function(r) {
			alert('댓글 등록 실패 실패');
		});
	});

	 function makeCommentItem(r){
		console.log(r);
		var id = r.id;
		var username = r.username;
		var content = r.content;
		var profile = r.profile;
		var date = r.createDate;
		var createDate = date.substring(0,10);
		console.log(createDate);
		
		var comment_item = '<div id="comment-item-'+id+'" class="row align-items-center justify-content-end text-right mr-1" id="comment-item-'+id+'"style="height: 70px;">';
		comment_item += '<div class="mr-2"><p class="my-auto" style="font-size: 12px;">@'+username+'</p>';
		comment_item += '<div class="balloon test_4" style="position: relative"><span>'+content+'</span>';
		comment_item += '<a onclick="commentDelete('+id+')" class="text-danger" style="position: absolute; top:-5px; left:-5px; cursor: pointer;">';
		comment_item += '<i class="fas fa-times-circle bg-white rounded-circle"></i></a></div></div>';
		comment_item += '<div class="profile">';
		comment_item += '<a href="/user/mypage/'+username+'">';
		comment_item += '<img src="/media/'+profile+'" class="rounded-circle border" width="40" height="40"></a></div>';
		comment_item += '<p class="my-auto" style="font-size: 11px;">'+createDate+'</p>';
		comment_item += '</div></div>';
		$('#comment-items').append(comment_item);
		$('#content').val('');
	 }


		
		function commentDelete(commentId){
			
			$.ajax({
				type : 'DELETE',
				url : '/comment/delete/'+commentId,
				dataType : 'json' //응답 데이터, 데이터 주고받을땐 무조건 스트링으로 인식해서 이렇게 해줘야 제이슨으로 인식함
			}).done(function(r) { //그래서 여기서 받을 때 잭슨이 제이슨을 자바스크립트로 바꿔줘서 자바스크립트 오브젝트화됨
				console.log(r);
				if (r.statusCode == 200) {
					$('#comment-item-'+commentId).remove();
				}else{
					alert('댓글 삭제 실패');
				}
			}).fail(function(r) {
				alert('댓글 삭제 실패');
			});
		}

		//좋아요
		function like(reviewId){
			var data = {
					reviewId: $('#reviewId').val(),
					userId: $('#userId').val()
				};
		
				$.ajax({
					type : 'POST',
					url : '/like/'+reviewId,
					data : JSON.stringify(data),
					contentType : 'application/json; charset=utf-8', //보내는 데이터
					dataType : 'text' //응답 데이터, 데이터 주고받을땐 무조건 스트링으로 인식해서 이렇게 해줘야 제이슨으로 인식함
				}).done(function(r) { //그래서 여기서 받을 때 잭슨이 제이슨을 자바스크립트로 바꿔줘서 자바스크립트 오브젝트화됨
					console.log(r);
					if (r == 'ok') {
						let likeCount = $('#likeCount').text();
						if($('#like-item-'+reviewId).hasClass('far fa-heart')){
							$('#like-item-'+reviewId).attr('class','fas fa-heart float-right text-danger');
							$('#likeCount').text( Number(likeCount)+1);
						}else{
							$('#like-item-'+reviewId).attr('class','far fa-heart float-right');
							$('#likeCount').text(Number(likeCount)-1);
							}	
					}else{
							alert('좋아요 실패');
						}
				}).fail(function(r) {
					alert('댓글 삭제 실패');
				});
			
			}

		//북마크
		function clipping(reviewId){
			var data = {
					reviewId: $('#reviewId').val(),
					userId: $('#userId').val()
				};
		
				$.ajax({
					type : 'POST',
					url : '/clipping/'+reviewId,
					data : JSON.stringify(data),
					contentType : 'application/json; charset=utf-8', //보내는 데이터
					dataType : 'text' //응답 데이터, 데이터 주고받을땐 무조건 스트링으로 인식해서 이렇게 해줘야 제이슨으로 인식함
				}).done(function(r) { //그래서 여기서 받을 때 잭슨이 제이슨을 자바스크립트로 바꿔줘서 자바스크립트 오브젝트화됨
					console.log(r);
					if (r == 'ok') {
						if($('#clipping-item-'+reviewId).hasClass('far fa-bookmark')){
							$('#clipping-item-'+reviewId).attr('class','fas fa-bookmark text-warning');
						}else{
							$('#clipping-item-'+reviewId).attr('class','far fa-bookmark');
							}	
					}else{
							alert('클리핑 실패');
						}
				}).fail(function(r) {
					alert('댓글 삭제 실패');
				});
			
			}
		
	
	//게시글 삭제
	$('#post-delete-submit').on('click', function() {
		var id= $('#post-delete-submit').val();
		$.ajax({
			type : 'DELETE',
			url : '/review/delete/'+id,
			dataType : 'json' //응답 데이터, 데이터 주고받을땐 무조건 스트링으로 인식해서 이렇게 해줘야 제이슨으로 인식함
		}).done(function(r) { //그래서 여기서 받을 때 잭슨이 제이슨을 자바스크립트로 바꿔줘서 자바스크립트 오브젝트화됨
			if (r.statusCode == 200) {
				alert('글이 삭제 되었습니다.');
				location.href = '/';
			}else{
				alert('글 삭제 실패');
			}
		}).fail(function(r) {
			alert('글 삭제 실패');
		});
	});

	//팔로우
	function follow(fromUserId, toUserId){
		console.log(toUserId);
		console.log(fromUserId);

		console.log('#follow-true')
			var data = {
					fromUser: fromUserId,
					toUser: toUserId
				};
				console.log(data);
			 	$.ajax({
					type : 'POST',
					url : '/follow',
					data : JSON.stringify(data),
					contentType : 'application/json; charset=utf-8', //보내는 데이터
					dataType : 'text' //응답 데이터, 데이터 주고받을땐 무조건 스트링으로 인식해서 이렇게 해줘야 제이슨으로 인식함
				}).done(function(r) { //그래서 여기서 받을 때 잭슨이 제이슨을 자바스크립트로 바꿔줘서 자바스크립트 오브젝트화됨
					console.log(r);
					if (r == 'ok') {
						console.log(r);
						
						if($('#followBoolean').val() == 'true'){
							$('#follow-true').attr('class','btn btn-primary ml-auto mt-2  text-white');
							$('#follow-true').html('<i id="plus" class="fas fa-user-plus"></i> 팔로우');						
							$('#follow-true').attr('id','follow-false');
							$('#followBoolean').val('false');
							               

						}else {
							$('#follow-false').attr('class','btn btn-outline-dark ml-auto mt-2');
							$('#follow-false').html('<i id="check" class="fas fa-user-check"></i> 팔로잉');						
							$('#follow-false').attr('id','follow-true');
							$('#followBoolean').val('true');

							/* $('#like-item-'+reviewId).attr('class','far fa-heart float-right');
							$('#likeCount').text(Number(likeCount)-1);
							}	 */
					}
					}else{
							alert('좋아요 실패');
						}
				}).fail(function(r) {
					alert('댓글 삭제 실패');
				}); 
			
			}
	
	
</script>

<%@include file="../modal/likeModal.jsp"%>
</body>
</html>