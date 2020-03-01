<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/etc_nav.jsp"%>
<%@include file="../include/nav.jsp"%>

<!--디테일 -->
<!--프로필 바-->
    <section>
    <div id="user_header_mini" class="stickyUi ">
      <div class="container" style="width: 65%;" >
        <div class="row align-items-center" style="height: 250px;">
          <div class="profile">
            <div class="row">
            <a href="/user/mypage/${user.username}"><img src="/media/${user.profile}" 
               width="148" height="148" class="border rounded-circle" onError="javascript:this.src='/img/unknown.png'"></a></div>
             
          <!-- /.avatar --></div>
          <div>
         
            <div class="row align-items-center">
          <h3 class="ml-5 mb-2">@${user.username}</h3>
          <c:choose>
			<c:when test="${not empty user.insta}">
	          <a href="${user.insta}" target="_blank" class="border ml-3 text-center rounded-circle" style="width: 27px; height: 27px;">
	          <i class="fab fa-instagram" style="color: #aaa; "></i></a>
          	</c:when>
          </c:choose>
          <c:choose>
			<c:when test="${not empty user.blog}">
          <a href="${user.blog}" target="_blank" class="border ml-2 text-center rounded-circle" style="width: 27px; height: 27px;">
          <i class="fas fa-desktop" style="color: #aaa;"></i></a>
          	</c:when>
       	</c:choose>
        </div>
          <div class="ml-5 mb-3">
          
          <a type="button" class="tag" data-toggle="modal" data-target="#followerModal" data-submit='${user.id}'>
          		팔로워  <span class="ml-1" id="followerCount">${followInfo.followerCount}</span></a>
          <a type="button" class="tag" data-toggle="modal" data-target="#followModal" data-submit='${user.id}'>
          		팔로잉  <span class="ml-1" id="followCount">${followInfo.followCount}</span></a>
          
        </div>
     
      <div class="row ml-5">
          <p style="font-size: 14px;">${user.introduction}</p>
        </div> 
      </div>
      <div class="row ml-auto">
              <!-- 팔로우 -->
      <c:choose>
      	<c:when test="${user.username eq principal.username}">
        	<a href="/user/userinfo/${principal.id}" class="btn btn-outline-dark mx-auto mt-2"><i class="fas fa-user-cog"></i> 프로필수정</a>
        </c:when>
        <c:otherwise>       	 	
       	 	<c:choose>
       	 		<c:when test="${followInfo.follow eq true}">
       	 			<input type="hidden" id="followBoolean" value="true">
       	 			<a onclick="follow(${principal.id},${user.id})" id="follow-true" class="btn btn-outline-dark mx-auto mt-2">
       	 			<i id="check" class="fas fa-user-check"></i> 팔로잉</a>
       	 		</c:when>
       	 		<c:otherwise>
       	 			<input type="hidden" id="followBoolean" value="false">
       	 			<a onclick="follow(${principal.id},${user.id})" id="follow-false" class="btn btn-primary mx-auto mt-2  text-white">
       	 			<i id="plus" class="fas fa-user-plus"></i> 팔로우</a>
       	 		</c:otherwise>
       	 	</c:choose>
        </c:otherwise>
       </c:choose>
       </div> 
    </div>
        </div>
            </div>
  </section>

  <!-- 카테고리바 -->
  <div id="switch_sex_type" >
    <nav>
  <ul id="category" class="d-flex justify-content-center" >
  	<c:choose>
  	<c:when test="${not empty reviews}">
    <li style="width: 300px;" ><a href="/user/mypage/${user.username}" ><i class="far fa-images"></i> ${reviews[0].count} 개</a></li>
    <li style="width: 300px;">
      <a href="javascript:getClippings(${user.id})"><i class="fas fa-bookmark"></i> ${reviews[0].clippingCount} 개</a>
    </li>
    </c:when>
    <c:otherwise>
    <li style="width: 300px;" ><a href="/user/mypage/${user.username}" ><i class="far fa-images"></i> 0개</a></li>
    <li style="width: 300px;">
      <a href="javascript:getClippings(${user.id})"><i class="fas fa-bookmark"></i> 0개</a>
    </li>
    </c:otherwise>
    </c:choose>
  </ul>  
</nav>
  </div>
  
    <!--디테일 -->
    <section>
    <div class="container mt-3">
    <div class="row" id="review-container">
    <c:choose>
    <c:when test="${not empty reviews}">
      <c:forEach var="review" items="${reviews}">
        <!--카드시작-->
        
        <div class="col-md-3" id="review-cards">
          <div class="mt-2 card review" >
                      <div class="nearby" style="position:relative">
          
            <a href="/review/${review.id}">
            <img class="card-img-top nearby_photo" style="cursor:pointer; z-index:11;" src="/media/${review.image1}" width="250" height="250">
           <div class="row nearby_info align-items-center justify-content-center" style="width:80%">
						<p class="ml-4"><i class="fas fa-utensils"></i> ${review.shopName}</p>
						
						</div>
           
            <div class="card-img-overlay">
              <span class="badge badge-dark" style="opacity: 80%;"><i class="fas fa-map-marker-alt" style="font-size: 12px;"></i> ${review.location}</span>
            </div></a></div>

	            <div class="card-header text-center">
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
	       
            <div class="card-body d-flex justify-content-between align-items-center"
             style="height: 10px;">
              <i class="far fa-heart ml-3"> ${review.likeCount}</i> 
              <i class="far fa-bookmark mr-3"> ${review.clippingCount }</i>
            </div>

          </div>
        </div>
          <!--카드 끝-->
          </c:forEach>
          
          </c:when>
          <c:otherwise>
          
          
          
          
          
          	<p class="mx-auto">등록한 리뷰가 없습니다.</p>
          </c:otherwise>
          </c:choose>
          
       </div>
      </div>
   
  </section>
<script src="/js/follow.js"></script>
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

	$('#update-submit').on("click", function() {
		var data = {
			id : $('#id').val(),
			password : $('#password').val(),
			address : $('#address').val()
		};
		$.ajax({
			type : 'PUT',
			url : '/user/profile',
			data : JSON.stringify(data),
			contentType : 'application/json; charset=utf-8',
			dataType : 'json'
		}).done(function(r) {
			if (r.statusCode == 200) {
				alert('수정 성공');
				location.href = '/';
			} else {
				alert('수정 실패');
			}
		}).fail(function(r) {
			console.log(r);
			$('#pw-check').html(r.responseJSON.password);
		});

	});

	function getClippings(userId){
		console.log(userId);
		$.ajax({
			type : 'GET',
			url : '/user/clipping/'+ userId,
			dataType : 'json'
		}).done(function(r) {
			console.log(r);
			if(r.length != 0){
				var res = '';
			for(i=0; i<r.length; i++){
				console.log(r[i].image1);
				var reviewId = r[i].id;
				var Image = r[i].image1;
				var location = r[i].location;
				var rating = r[i].rating;
				var likeCount = r[i].likeCount;
				var clippingCount = r[i].clippingCount;
				
				res +='<div class="col-md-3">';
				res += '<div class="card review" style="position: relative;" >';
				res += '<a href="/review/'+reviewId+'"><img class="card-img-top" src="/media/'+Image+'" width="250" height="250">';
				res += '<div class="card-img-overlay">';
				res += '<span class="badge badge-dark" style="opacity: 80%; position:absolute; top:20px; left:20px;"><i class="fas fa-map-marker-alt" style="font-size: 12px; "></i>'+location+'</span></div></a>';
				res += '<div class="card-header text-center">';
				res += '<p id="star_grade" class="mb-0">';
				if(rating==0){
						res+='<a><i class="fas fa-star mr-1"></i></a><a><i class="fas fa-star mr-1"></i></a><a><i class="fas fa-star mr-1"></i></a><a><i class="fas fa-star mr-1"></i></a><a><i class="fas fa-star mr-1"></i></a>';
					}
				if(rating==1){
						res+='<a class="on"><i class="fas fa-star mr-1"></i></a><a><i class="fas fa-star mr-1"></i></a><a><i class="fas fa-star mr-1"></i></a><a><i class="fas fa-star mr-1"></i></a><a><i class="fas fa-star mr-1"></i></a>';
					}
				if(rating==2){
						res+='<a class="on"><i class="fas fa-star mr-1"></i></a><a class="on"><i class="fas fa-star mr-1"></i></a><a><i class="fas fa-star mr-1"></i></a><a><i class="fas fa-star mr-1"></i></a><a><i class="fas fa-star mr-1"></i></a>';
					}
				if(rating==3){
						res+='<a class="on"><i class="fas fa-star mr-1"></i></a><a class="on"><i class="fas fa-star mr-1"></i></a><a class="on"><i class="fas fa-star mr-1"></i></a><a><i class="fas fa-star mr-1"></i></a><a><i class="fas fa-star mr-1"></i></a>';
					}
				if(rating==4){
						res+='<a class="on"><i class="fas fa-star mr-1"></i></a><a class="on"><i class="fas fa-star mr-1"></i></a><a class="on"><i class="fas fa-star mr-1"></i></a><a class="on"><i class="fas fa-star mr-1"></i></a><a><i class="fas fa-star mr-1"></i></a>';
					}
				if(rating==5){
						res+='<a class="on"><i class="fas fa-star mr-1"></i></a><a class="on"><i class="fas fa-star mr-1"></i></a><a class="on"><i class="fas fa-star mr-1"></i></a><a class="on"><i class="fas fa-star mr-1"></i></a><a class="on"><i class="fas fa-star mr-1"></i></a>';
					}
				res += '</p></div>';
				res += '<div class="card-body d-flex justify-content-between align-items-center" style="height: 10px;">';
				res += '<i class="far fa-heart ml-3"> '+likeCount+'</i>';
				res += '<i class="far fa-bookmark mr-3"> '+clippingCount+'</i>';
				res += '</div></div></div>';

			}
			$('#review-container').html(res);

				}else{
					$('#review-cards').remove();
					$('#review-container').attr('class','row justify-content-center');
					$('#review-container').text('보관한 리뷰가 없습니다.');
					

					}
			
		});
	}; 

	
	
</script>

<%@include file="../modal/followModal.jsp"%>
</body>
</html>
