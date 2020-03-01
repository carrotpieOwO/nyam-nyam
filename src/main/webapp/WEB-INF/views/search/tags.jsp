<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/home_nav.jsp"%>
<%@include file="../include/nav.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!-- Header -->
<header class="masthead" style="background-image: url(/img/background.jpg); ">
	
	<div class="intro-lead-in mx-auto">
	<img src="/img/logo.png" width="25%" height="25%">
	<p>Nyam-Nyam</p></div>
</header>

<section>
    <div id="user_header_mini" style="margin-top: 30px">
      <div class="container" style="width: 70%;" >
        <div class="row align-items-center mt-0">
         <h4 class="mr-auto"><i class="fas fa-search"></i> "${searchContent}"에 대한 검색결과</h4> 
         <h4 class="ml-auto"> ${fn:length(tags)}건</h4>
        </div>
            </div>
    </div>
  </section>

<div class="container">
<div class="row text-center ml-auto justify-content-center mb-2 mr-5 mt-5" >
	<c:forEach var="tag" items="${tags}">
    
        	
        	<form class="mr-2" action="/search" method="get">
        	<input type="hidden" name="searchMenu" value="태그"/>
        	<input type="hidden" name="searchContent" value="${tag.tag}"/>
        	<button class="btn btn-outline-dark text-outline-light" type="submit">#${tag.tag}</button>
        	</form>
        	
      
    </c:forEach>
</div>
	<div class="mt-1 row">
	<c:forEach var="tag" items="${tags}">
	<div class="col-md-4 my-3">
		<div class="card bg-light">
		<a href="/review/${tag.id}">
			<div class="nearby" style="position:relative">
			<img src="/media/${tag.image1}" class="card-img-top nearby_photo" style="cursor:pointer; z-index:11;" width="300px" height="300px" />
			<div class="row nearby_info align-items-center justify-content-center" style="width:80%">
				<p class="ml-4"><i class="fas fa-heart"></i> ${tag.likeCount}</p>
				<p class="ml-3"><i class="fas fa-bookmark right-float"></i> ${tag.clippingCount}</p>
			</div>
			
			<div class="card-img-overlay ">
				<div class="list-badge">
					<span class="badge badge-light">${tag.location}</span> 
					<span class="badge badge-dark">${tag.category}</span>
				</div>

			</div>
			</div>
			</a>

			<div id="user" class="card-body text-dark " style="height: 70px;">
				<div class="d-flex align-items-center">
					<p class="card-text ">
					<p class="img float-left mr-2">
						<img src="/media/${tag.profile}" class="border rounded-circle" onError="javascript:this.src='/img/unknown.png'" width="36" height="36">
					</p>
					<p class="name clearfix " style="font-size: 11px;">${tag.username}</p>
				</div>
				

			</div>

		</div>
	</div>
	</c:forEach>
		
	<!--카드끝-->
			</div>
	</div>
	
<script src="/js/nav-style.js"></script>\
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

</script>
		</body>
		</html>