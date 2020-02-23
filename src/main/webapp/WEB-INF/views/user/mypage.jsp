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
            <a href="/user/mypage/${reviews[0].username}"><img src="/media/${reviews[0].profile}" 
               width="148" height="148" class="border rounded-circle" onError="javascript:this.src='/img/unknown.png'"></a></div>
             
          <!-- /.avatar --></div>
          <div>
         
            <div class="row align-items-center">
          <h3 class="ml-5 mb-2">@${reviews[0].username}</h3>
          <c:choose>
			<c:when test="${not empty reviews[0].insta}">
	          <a href="${reviews[0].insta}" target="_blank" class="border ml-3 text-center rounded-circle" style="width: 27px; height: 27px;">
	          <i class="fab fa-instagram" style="color: #aaa; "></i></a>
          	</c:when>
          </c:choose>
          <c:choose>
			<c:when test="${not empty reviews[0].blog}">
          <a href="${reviews[0].blog}" target="_blank" class="border ml-2 text-center rounded-circle" style="width: 27px; height: 27px;">
          <i class="fas fa-desktop" style="color: #aaa;"></i></a>
          	</c:when>
       	</c:choose>
        </div>
          <div class="ml-5 mb-3">
          <a type="button" class="tag" data-toggle="modal" data-target="#myModal" >팔로워 1,300</a>
          <a type="button" class="tag" data-toggle="modal" data-target="#myModal">팔로잉 1,300</a>
        </div>
     
      <div class="row ml-5">
          <p style="font-size: 14px;">${reviews[0].introduction}</p>
        </div> 
      </div>
      <div class="row ml-auto">
        <button class="btn btn-primary mx-auto mt-2"><i class="fas fa-user-plus"></i> 팔로우</button>
       </div> 
    </div>
        </div>
            </div>
    </div>
  </section>

  <!-- 카테고리바 -->
  <div id="switch_sex_type" >
    <nav>
  <ul id="category" class="d-flex justify-content-center" >
  
    <li style="width: 300px;" ><a href="?c=SwitchTabType" ><i class="far fa-images"></i> ${reviews[0].count} 개</a></li>
    <li style="width: 300px;">
      <a href="?c=SwitchTabType&amp;sex_id=1"><i class="fas fa-bookmark"></i> 53개</a>
    </li>
  </ul>  
</nav>
  </div>
    <!--디테일 -->
    <section>
    <div class="container mt-3">
      <div class="row">
      <c:forEach var="review" items="${reviews}">
        <!--카드시작-->
        <div class="col-md-3">
          <div class="card review" >
            <a href="/review/${review.id}"><img class="card-img-top" src="/media/${review.image1}" width="250" height="250">
            <div class="card-img-overlay">
              <span class="badge badge-dark" style="opacity: 80%;"><i class="fas fa-map-marker-alt" style="font-size: 12px;"></i> ${review.location}</span>
            </div></a>

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
              <i class="far fa-bookmark mr-3"> 40</i>
            </div>
  
          </div>
        </div>
          <!--카드 끝-->
          </c:forEach>
        </div>
      </div>
   
  </section>
<script>
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
</script>


</body>
</html>
