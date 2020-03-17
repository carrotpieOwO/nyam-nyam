<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/etc_nav.jsp"%>
<%@include file="../include/nav.jsp"%>

<!--프로필 바-->
<section>
	<div id="user_header_mini" class="stickyUi ">
		<div class="container" style="width: 60%;">
			<div class="row align-items-center" style="height: 80px;">
				<i class="fas fa-camera-retro" style="font-size: 50px;"></i>
				<h4 class="my-auto ml-2">글쓰기</h4>
			</div>
		</div>
	</div>
</section>

<!--디테일 -->
<section>
	<div class="container" style="margin-top: 16px;">
		<div class="row justify-content-center">
			<form action="/review/write" method="post"
				enctype="multipart/form-data" class="row justify-content-center">
				<input type="hidden" name="userId" value="${principal.id}">
				<!--사진선택-->
				<div class="card bg-light" style="width: 80%">
					<div class="card-header">
						<h4 class="card-title mb-0">사진선택</h4>
					</div>
					<div class="card-body">
						<div class="row">
							

						</div>
						<div class="row justify-content-center">
							<div id="preview" class="preview row align-items-center justify-content-center">
								<div id="card" class="card bg-light mr-2"
									style="width: 250px; hegit: 250px">
									<img src="/media/${review.image1}" id="foodPic"
										class="card-img-top " width=250 height=250 />
								</div>
								<c:if test="${!empty review.image2}">
									<div id="card" class="card bg-light mr-2"
										style="width: 250px; hegit: 250px">
										<img src="/media/${review.image2}" id="foodPic"
											class="card-img-top " width=250 height=250>
									</div>
								</c:if>
								<c:if test="${!empty review.image3}">
									<div id="card" class="card bg-light"
										style="width: 250px; hegit: 250px">
										<img src="/media/${review.image3}" id="foodPic"
											class="card-img-top" width=250 height=250>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>

				<!--내용입력-->
				<div class="card bg-light mt-2" style="width: 80%">
					<div class="card-header">
						<h4 class="card-title mb-0">내용입력</h4>
					</div>
					<div class="card-body">
						<!--별점,가격대-->
						<div class="row ml-1">
							<p id="star_grade">
								<input type="hidden" name="rating" id="rating" value="0" /> 
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

							<!-- 가격대  -->
							<div class="ml-3 dropdown">
								<button type="button" id="dropdown-btn"
									class="btn btn-sm btn-warning dropdown-toggle"
									data-toggle="dropdown">${review.price}</button>
								<div id="price" class="dropdown-menu">
									<a class="dropdown-item" name="price" value=1 >1만원 이하</a> <a
										class="dropdown-item" name="price" value=2>1만원~3만원</a> <a
										class="dropdown-item" name="price" value=3>3만원~5만원</a> <a
										class="dropdown-item" name="price" value=4>5만원~10만원</a> <a
										class="dropdown-item" name="price" value=5>10만원 이상</a>
								</div>
								
								<input id="selected-item" type="hidden" name="price"
									value="선택안함" />
							</div>

						</div>
						<!--가게이름-->
						<div class="form-group">
							<label for="comment">가게이름:</label> <input type="text"
								name="shopName" class="form-control" id="store_name" required
								style="width: 60%;" value="${review.shopName}">
						</div>
						<!--후기-->
						<div class="form-group">
							<label for="comment">후기:</label>
							<textarea name="content" class="form-control" rows="5"
								id="review" required>${review.content}</textarea>
						</div>
						<!--태그-->
						<label for="comment" class="mb-1">태그:</label><br>
						<div id="tags">
							<c:if test="${!empty tags}">
								<c:forEach var="tag" varStatus="status" items="${tags}">
									<div id="id_${status.index}" class="tag mb-1 mr-1">
									<p id="tag_${status.index}" class="tagArr">#${tag}</p>
									<a onclick="deleteTag(${status.index})" class="ml-2 tagDel"><strong>X</strong></a></div>
								</c:forEach>
							</c:if>
						</div>
						<input type="hidden" name="tags" id="tag-submit">
						<div class="input-group input-group-sm col-6 row">
							<input type="text" id="tag-input" class="form-control"
								placeholder="태그입력">
							<div class="input-group-append">
								<button class="btn btn-warning" type="button" id="tag-btn">추가</button>
							</div>
						</div>
					</div>
				</div>

				<!--위치정보-->
				<div class="card bg-light mt-2" style="width: 80%">
					<div class="card-header">
						<h4 class="card-title mb-0">위치정보</h4>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-6">
								<div class="input-group input-group-sm">

									<div class="map_wrap">

										<div id="menu_wrap">
											<div class="option">
												<div class="input-group">
													<input type="text" id="keyword" class="form-control"
														placeholder="가게명 검색" value="${review.shopName}" required >
													<div class="input-group-append">
														<button class="btn btn-warning" id="placeSearch"
															type="button">검색</button>
													</div>

												</div>
											</div>
											<hr>
											<ul id="placesList"></ul>
											<div id="pagination"></div>
										</div>
									</div>


								</div>
								<input type="text" id="location" name="location"
									class="form-control form-control-sm mt-1" placeholder="주소" value="${review.location }"
									readonly>
								<p id="no-address" style="font-size: 12px; visibility: hidden;"
									class="text-danger mt-2">
									※주소가 등록되어 있지 않습니다.<br> <i
										class="fas fa-exclamation-triangle"></i> 직접입력 시 지역명을 적지 않으면
									피드에 노출되지 않습니다.
								</p>
							</div>
							<div class="col-6">
								<!-- * 카카오맵 - 지도퍼가기 -->
								<!-- 1. 지도 노드 -->
								<div id="map"
									style="width: 100%; height: 300px; position: relative; overflow: hidden;"></div>

								<div id="daumRoughmapContainer1582003892727"
									class="root_daum_roughmap root_daum_roughmap_landing"></div>
							</div>
						</div>

					</div>
				</div>
				<div class="row col-12 justify-content-center">
					<button type="button" class="btn btn-warning mt-3 mb-3" id="update-submit" style="width: 200px;">업로드</button>
				</div>

			</form>
			<!--끝-->

		</div>

	</div>
</section>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a0869af0b95acb3e599ca40afd01eb68&libraries=services"></script>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a0869af0b95acb3e599ca40afd01eb68"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a0869af0b95acb3e599ca40afd01eb68&libraries=LIBRARY"></script>

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script>

	//별점주기
	$('#star_grade a').click(function() {
		$(this).parent().children("a").removeClass("on"); /* 별점의 on 클래스 전부 제거 */
		$(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
		var rating = $('.on').length;
		$('#rating').val(rating);
		return false;
	});

	//드롭다운
	$('#price > a').on('click', function() {
		// 버튼에 선택된 항목 텍스트 넣기 
		$('#dropdown-btn').text($(this).text());
		$('#selected-item').val($(this).text());
		// 선택된 항목 값(value) 얻기
		// alert($(this).attr('value'));
	});

	//태그
	$('#tag-btn')
			.on(
				'click',
				function() {
					var i = $('.tag').length;
					console.log($('.tag').length);
					var str ='<div id="id_'+i+'" class="tag mb-1 mr-1">'
					str += '<p id="tag_'+i+'" class="tagArr ">';
					str += '#'+$('#tag-input').val()+'</p>';
					str += '<a onclick="deleteTag('+i+')" class="ml-2 tagDel"><strong>X</strong></a></div>';

								
					$('#tags').append(str);
					$('#tag-input').val("");

					var taglist = $('.tagArr').text();
					$('#tag-submit').val(taglist);
					

					var confirm =$('#tag-submit').val(); 
					console.log(confirm);

				});

	function deleteTag(i) {

		var removeTag = $('#tag_'+i).text();
		console.log(removeTag);
		var taglist = $('.tagArr').text();
		$('#tag-submit').val(taglist.replace(removeTag,''));
		console.log($('#tag-submit').val());
		$('#id_'+i).remove();
	};

	//위치정보

	//가게이름 입력시 검색인풋에 값 넣어주기
	$('#store_name').on('propertychange change keyup paste input', function() {
		var storeName = $(this).val();
		$('#keyword').val(storeName);
		ps.keywordSearch(storeName, placesSearchCB);

	});

	//지도를 미리 생성
	var infowindow = new kakao.maps.InfoWindow({
		zIndex : 1
	});

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();

	$('#placeSearch').on('click', function() {
		var keyword = $('#keyword').val();
		ps.keywordSearch(keyword, placesSearchCB);

	});
	// 키워드로 장소를 검색합니다

	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
		if (status === kakao.maps.services.Status.OK) {

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			// LatLngBounds 객체에 좌표를 추가합니다
			var bounds = new kakao.maps.LatLngBounds();

			for (var i = 0; i < data.length; i++) {
				displayMarker(data[i]);
				bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
			}

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}
	}

	// 지도에 마커를 표시하는 함수입니다
	function displayMarker(place) {
		$('#location').val(place.address_name);
		// 마커를 생성하고 지도에 표시합니다
		var marker = new kakao.maps.Marker({
			map : map,
			position : new kakao.maps.LatLng(place.y, place.x)
		});

		// 마커에 클릭이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'click', function() {
			// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
			str = '<div style="padding:5px;font-size:12px;">'
					+ place.place_name + '</div>';
			infowindow.setContent(str);
			infowindow.open(map, marker);
			if (place.address_name) {
				$('#location').attr('readonly', 'readonly');
				$('#no-address').css('visibility', 'hidden');
				$('#location').val(place.address_name);
			} else {
				$('#location').removeAttr('readonly');
				$('#location').val('직접입력');
				$('#no-address').css('visibility', 'visible');
			}

		});
	}

	//업데이트
	$('#update-submit').on('click', function() {
	var data = {
		id : ${review.id},
		rating : $('#rating').val(),
		price : $('#selected-item').val(),
		shopName : $('#store_name').val(),
		content : $('#review').val(),
		location : $('#location').val(),
		tag :$('#tag-submit').val() 
	};
	$.ajax({
		type : 'PUT',
		url : '/review/modify',
		data : JSON.stringify(data), //만약 get 타입으로 데이터 보내면 'username=ssar' 이런식으로 쿼리스트링처럼 해서 날려야함,
		contentType : 'application/json; charset=utf-8',
		dataType : 'json'
	}).done(function(r) {
		if (r.statusCode == 200) {
			alert('수정 성공');
			location.href = '/review/${review.id}';
		} else {
				alert('수정 실패');
		}
	}).fail(function(r) {
		alert('회원가입 실패');
		
	});
});
</script>
</body>
</html>