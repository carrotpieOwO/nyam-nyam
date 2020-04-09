<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/home_nav.jsp"%>
<%@include file="../include/nav.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Header -->
<header class="masthead" style="background-image: url(/img/background.jpg); ">
	
	<div class="intro-lead-in mx-auto">
	<img src="/img/logo.png" width="25%" height="25%">
	<p>Nyam-Nyam</p></div>
</header>


<div id="switch_sex_type">
	<nav>
		<ul id="category" class="mx-auto">
			<li class="yellow underline"><a class="under text-secondary" style="text-decoration: none;" href="/">ALL</a></li>
			<li class="yellow underline"><a class="under" onclick="locationFeed('seoul')">SEOUL</a></li>
			<li class="yellow underline"><a class="under" onclick="locationFeed('daejeon')">DAEJEON</a></li>
			<li class="yellow underline"><a class="under" onclick="locationFeed('daegu')">DAEGU</a></li>
			<li class="yellow underline"><a class="under" onclick="locationFeed('busan')">BUSAN</a></li>
			<li class="yellow underline"><a class="under" onclick="locationFeed('etc')">ETC</a></li>
		</ul>
	</nav>
</div>
<br>

<section>
<div class="container">
	<div class="row">
		<div class="btn-group btn-group-toggle mx-auto" data-toggle="buttons">
			<a href="/" type="button" id="explore" class="btn btn-outline-dark active" style="width: 130px;">탐색</a>
			<button type="button" id="feed" onclick="privateFeed(${principal.id})" class="btn btn-outline-dark" style="width: 130px;">피드</button>
		</div>
	</div>
	<br>
	<div id="feed-container" class="row">
		<div id="sidebar" class="col-md-3">
			<section id="user" >
				<h2 class="title mt-5 text-center mb-2">유저랭킹</h2>
				<ul class="mt-2 mb-2 pt-4 pb-2 border rounded">
					<c:forEach var="userRank" items="${userRanks}">
					<li class="clearfix ">
					<div class="row">
						<p class="rank${userRank.rank} mr-2">${userRank.rank}</p>
						<div class="d-flex align-items-center">
							<div class="sub mr-2">
								<p id="user" class="img float-left">
									<a href="/user/mypage/${userRank.username}" class="over">
									<img src="/media/${userRank.profile}" class="border rounded-circle" onError="javascript:this.src='/img/unknown.png'" width="36" height="36"></a>
								</p>
							</div>
							<div class="main ">
								<p class="name clearfix float-right mb-0">${userRank.username}</p>
								<br>
								<p class="txt icon_font">
									<i class="fas fa-user"></i> ${userRank.count}
								</p>
							</div>
						</div>
						</div>
					</li>
					</c:forEach>
					
				</ul>
			</section>
		</div>
		<div class="col-md-9">


			<!--카드-->
			<div class="row">
				<h1>Ranking</h1>
			</div>
			<div class="row">
			<c:forEach var="likeRank" items="${likeRanks}">
				<div class="col-md-4 my-3">
				
					<div class="card bg-light">
					<a href="/review/${likeRank.id}">
					<div class="nearby" style="position:relative">
					<img src="/media/${likeRank.image1}" class="card-img-top nearby_photo" style="cursor:pointer; z-index:11;" width=300px height=300px />
						<div class="row nearby_info align-items-center justify-content-center" style="width:80%">
						<p class="ml-4"><i class="fas fa-heart"></i> ${likeRank.likeCount}</p>
						<p class="ml-3"><i class="fas fa-bookmark right-float"></i> ${likeRank.clippingCount}</p>
						</div>
					
						<div class="card-img-overlay ">
							<div class="list-badge">
								<span class="badge badge-light">${likeRank.location}</span> 
								<span class="badge badge-dark">${likeRank.category}</span>
							</div>
							<p class="rank${likeRank.rank} mr-2 float-left" style="width: 30px; height: 30px; font-size: 1.5em;">${likeRank.rank}</p>

</div>
						</div></a>

						<div id="user" class="card-body text-dark " style="height: 70px;">
							<div class="row align-items-center">
								<p class="img float-left mr-2">
									<img src="/media/${likeRank.profile}" class="border rounded-circle" onError="javascript:this.src='/img/unknown.png'" width="36" height="36">
								</p>
								<p class="name clearfix " style="font-size: 11px;">${likeRank.username}</p>					
								<a href="/user/mypage/${likeRank.username}" class="btn btn-warning mb-auto ml-auto" style="cursor: pointer; z-index:10"><i class="fas fa-home"></i></a>	
							</div>
							

						</div>
					</div>
				</div>
				</c:forEach>
				
</div>
</div>
				<!--now-->
				<div class="container mt-5">
					<div class="row mb-2">
						<h1>#Now</h1>
					</div>
					<div class="row scrollLocation" id="nowContainer">
					<c:forEach var="feed" items="${feeds}">
					<div class="col-md-4 my-3 listToChange">
					<div class="card bg-light scrolling" data-bno="${feed.id}">
						<a href="/review/${feed.id}">
						<div class="nearby" style="position:relative">
							<img src="/media/${feed.image1}" class="card-img-top nearby_photo" style="cursor:pointer; z-index:11;" width="300px" height="300px" />
							<div class="row nearby_info align-items-center justify-content-center" style="width:80%">
							<p class="ml-4"><i class="fas fa-heart"></i> ${feed.likeCount}</p>
							<p class="ml-3"><i class="fas fa-bookmark right-float"></i> ${feed.clippingCount}</p>
							</div>
						<div class="card-img-overlay ">
							<div class="list-badge">
								<span class="badge badge-light">${feed.location}</span> 
								<span class="badge badge-dark">${feed.category}</span>
							</div>
						</div>
						</a>


						</div>

						<div id="user" class="card-body text-dark " style="height: 70px;">
							<div class="d-flex align-items-center">
								<p class="card-text ">
								<p class="img float-left mr-2">
									<img src="/media/${feed.profile}" class="border rounded-circle" onError="javascript:this.src='/img/unknown.png'" width="36" height="36">
								</p>
								<p class="name clearfix " style="font-size: 11px;">${feed.username}</p>
								<a href="/user/mypage/${feed.username}" class="btn btn-warning mb-auto ml-auto" style="cursor: pointer; z-index:10"><i class="fas fa-home"></i></a>
							</div>
							</p>

						</div>

					</div>
				</div>
				</c:forEach>
				<!--카드끝-->
						</div>
				</div>
				

	</section>	
		
		<div class="dropdown dropleft float-right">
    
    <button id="dropdown-btn" type="button" class="btn btn-warning btn-lg rounded-circle" data-toggle="dropdown" 
    style="position:fixed; bottom:20px; right:20px; width:50px; height:50px;">
		<i class="fas fa-sliders-h "></i>
		</button> 

   	 
    
    <div id="dropdown-menu" class="dropdown-menu">
    <div class="d-flex ">
      <a class="dropdown-item text-center" onclick="mainCategory('cafe')"><i class="fas fa-coffee"></i><br><p class="my-0" style="font-size:10px;">카페</p></a>
      <a class="dropdown-item text-center" onclick="mainCategory('restorant')"><i class="fas fa-utensils"></i><br><p class="my-0 " style="font-size:10px;">음식점</p></a>
      
    </div>
    </div>
    
    </div>
 


<%@include file="../include/footer.jsp"%>

<script src="/js/nav-style.js"></script>
<script>
//호버로 정보보여주기

 $(document).on('mouseenter','.nearby',function(){

	$(this).find('.nearby_photo').css('filter', 'brightness(0.30)');
	$(this).find('.nearby_info').css('visibility', 'visible');
 });
 $(document).on('mouseleave','.nearby',function(){
	 $(this).find('.nearby_photo').css('filter','');
	 $(this).find('.nearby_info').css('visibility', 'hidden');
	 });



$(document).ready(function(){
	$(window).scroll(function(){
		
		
			if ($(window).scrollTop() >= $(document).height()-$(window).height()){
				let lastbno = $('.scrolling:last').attr('data-bno');
				console.log(lastbno);
				load_feed_box(lastbno);

			}
	});
});


async function load_feed_box(lastbno){
	let response = await fetch('/list/scrollDown/'+lastbno);
	let feeds = await response.json();
	
	
	console.log(feeds);

	feeds.forEach(function(feed){
		console.log(feed);
		let feed_box = make_feed_box(feed);
		$(".scrollLocation").append(feed_box);

		});
}


function make_feed_box(feed){
	let id = feed.id;
	let image = feed.image1;
	let username = feed.username;
	let location = feed.location;
	let profile = feed.profile;
	let likeCount = feed.likeCount;
	let category = feed.category;
	let clippingCount = feed.clippingCount;
	
	let str = '<div class="col-md-4 my-3 listToChange">';
	str += '<div class="card bg-light scrolling" data-bno="'+id+'">';
	str += '<a href="/review/'+id+'">';
	str += '<div class="nearby" style="position:relative">';
	str += '<img src="/media/'+image+'" class="card-img-top nearby_photo" style="cursor:pointer; z-index:11;" width="300px" height="300px" />';
	str += '<div class="row nearby_info align-items-center justify-content-center" style="width:80%">';
	str += '<p class="ml-4"><i class="fas fa-heart"></i>'+likeCount+'</p>';
	str += '<p class="ml-3"><i class="fas fa-bookmark right-float"></i>'+clippingCount+'</p></div>';
	str += '<div class="card-img-overlay ">';
	str += '<div class="list-badge">';
	str += '<span class="badge badge-light">'+location+'</span> ';
	str += '<span class="badge badge-dark">'+category+'</span></div></div></a></div>';
	str += '<div id="user" class="card-body text-dark " style="height: 70px;">';
	str += '<div class="d-flex align-items-center">';
	str += '<p class="card-text ">';
	str += '<p class="img float-left mr-2">';
	str += '<img src="/media/'+profile+'" class="border rounded-circle" onError="javascript:this.src=`/img/unknown.png`" width="36" height="36"></p>';
	str += '<p class="name clearfix " style="font-size: 11px;">'+username+'</p>';
	str += '<a href="/user/mypage/'+username+'" class="btn btn-warning mb-auto ml-auto" style="cursor: pointer; z-index:10"><i class="fas fa-home"></i></a>';
	str += '</div></p></div></div></div>';

	return str;
}
				


$(window).scroll(function(){
    var scrolltop = parseInt ( $(window).scrollTop() );
    if( scrolltop >= $(document).height() - $(window).height() - 5 ){
        $('#dropdown-btn').css('bottom','70px');
    }
});

$(window).scroll(function(){
    var scrolltop = parseInt ( $(window).scrollTop() );
    if( scrolltop <= $(document).height() - $(window).height() - 5 ){
        $('#dropdown-btn').css('bottom','20px');
    }
});





function privateFeed(userId){
	$.ajax({
		type : 'GET',
		url : '/timeline/'+userId,
		dataType : 'json' //응답 데이터, 데이터 주고받을땐 무조건 스트링으로 인식해서 이렇게 해줘야 제이슨으로 인식함
	}).done(function(r) { //그래서 여기서 받을 때 잭슨이 제이슨을 자바스크립트로 바꿔줘서 자바스크립트 오브젝트화됨
		console.log(r);
		if (r.length != 0) {
			var res = '';
		for(i=0; i<r.length; i++){
			res += '<div class="col-md-4 my-3">';
			res += '<div class="card bg-light">';
			res += '<a href="/review/'+r[i].id+'">';
			res += '<div class="nearby" style="position:relative; z-index:10;">';
			res += '<img src="/media/'+r[i].image1+'" class="card-img-top nearby_photo" style="cursor:pointer; z-index:11;" width=300px height=300px />';
			res += '<div class="row nearby_info align-items-center justify-content-center" style="width:80%;">';
			res += '<p class="ml-4"><i class="fas fa-heart"></i> '+r[i].likeCount+'</p>';
			res += '<p class="ml-3"><i class="fas fa-bookmark right-float"></i> '+r[i].clippingCount+'</p></div>';
			res += '<div class="card-img-overlay ">';
			res += '<div class="list-badge">';
			res += '<span class="badge badge-light">'+r[i].location+'</span>';
			res += '<span class="badge badge-dark ml-1">'+r[i].category+'</span></div></div></div></a>';
			res += '<div id="user" class="card-body text-dark " style="height: 70px;">';
			res += '<div class="d-flex align-items-center">';
			res += '<p class="card-text ">';
			res += '<p class="img float-left mr-2">';
			res += '<img src="/media/'+r[i].profile+'" class="border rounded-circle" onError="javascript:this.src=\'/img/unknown.png\'" width="36" height="36"></p>';
			res += '<p class="name clearfix " style="font-size: 11px;">'+r[i].username+'</p>';
			res += '<a href="/user/mypage/'+r[i].username+'" class="btn btn-warning mb-auto ml-auto" style="cursor: pointer; z-index:10"><i class="fas fa-home"></i></a>';
			res += '</p></div></div></div></div>';
		}
	$('#feed-container').html(res);
	$('#dropdown-btn').css('visibility','hidden');
	$('#explore').attr('class','btn btn-outline-dark');
		}else{
			alert('팔로우 중인 유저가 없습니다.');
		}
	}).fail(function(r) {
		$(location).attr('href','user/login');
	});
	
}

function locationFeed(location){
	
	$.ajax({
		type : 'GET',
		url : '/list/location/'+location,
		dataType : 'json' //응답 데이터, 데이터 주고받을땐 무조건 스트링으로 인식해서 이렇게 해줘야 제이슨으로 인식함
	}).done(function(r) { //그래서 여기서 받을 때 잭슨이 제이슨을 자바스크립트로 바꿔줘서 자바스크립트 오브젝트화됨
		console.log(r);
		if (r.length != 0) {
			var cafe ='카페';
			var restorant = '음식점';
			var res = '';
		for(i=0; i<r.length; i++){
			res += '<div class="col-md-4 my-3">';
			res += '<div class="card bg-light">';
			res += '<a href="/review/'+r[i].id+'">';
			res += '<div class="nearby" style="position:relative">';
			res += '<img src="/media/'+r[i].image1+'"  class="card-img-top nearby_photo" style="cursor:pointer; z-index:11;" width=300px height=300px />';
			res += '<div class="row nearby_info align-items-center justify-content-center" style="width:80%;">';
			res += '<p class="ml-4"><i class="fas fa-heart"></i> '+r[i].likeCount+'</p>';
			res += '<p class="ml-3"><i class="fas fa-bookmark right-float"></i> '+r[i].clippingCount+'</p></div>';
			res += '<div class="card-img-overlay ">';
			res += '<div class="list-badge">';
			res += '<span class="badge badge-light">'+r[i].location+'</span>';
			res += '<span class="badge badge-dark ml-1">'+r[i].category+'</span></div></div></div></a>';
			res += '<div id="user" class="card-body text-dark " style="height: 70px;">';
			res += '<div class="d-flex align-items-center">';
			res += '<p class="card-text ">';
			res += '<p class="img float-left mr-2">';
			res += '<img src="/media/'+r[i].profile+'" class="border rounded-circle" onError="javascript:this.src=\'/img/unknown.png\'" width="36" height="36"></p>';
			res += '<p class="name clearfix " style="font-size: 11px;">'+r[i].username+'</p>';
			res += '<a href="/user/mypage/'+r[i].username+'" class="btn btn-warning mb-auto ml-auto" style="cursor: pointer; z-index:10"><i class="fas fa-home"></i></a>';
			res += '</div></p></div></div></div>';

			
		}
		var dropdown = '<div class="d-flex ">';
		dropdown += '<a class="dropdown-item text-center" onclick="filterCategory(\''+location+'\',\'cafe\')"><i class="fas fa-coffee"></i><br><p class="my-0" style="font-size:10px;">카페</p></a>';
		dropdown += '<a class="dropdown-item text-center" onclick="filterCategory(\''+location+'\',\'restorant\')"><i class="fas fa-utensils"></i><br><p class="my-0 " style="font-size:10px;">음식점</p></a>';
		dropdown += '<a class="dropdown-item text-center" onclick="filterLike(\''+location+'\')" ><i class="fas fa-heart"></i><br><p class="my-0" style="font-size:10px;">핫한</p></a>';
		dropdown += '<a class="dropdown-item text-center" onclick="filterClip(\''+location+'\')"><i class="fas fa-bookmark"></i><br><p class="my-0" style="font-size:10px;">보관많은</p></a>';
		dropdown += '</div>';


		
	$('#feed-container').html(res);
	$('#explore').attr('class','btn btn-outline-dark active');
	$('#feed').attr('class','btn btn-outline-dark');
	$('#dropdown-btn').css('visibility','visible');
	$('#dropdown-menu').html(dropdown);

	if(location == 'seoul'){
		$('.masthead').css('background-image','url(/img/SEOUL.jpg)');
		$('.intro-lead-in').text('SEOUL');
		$('.intro-lead-in').css('font-size','80px');
	}
	else if(location == 'daejeon'){
		$('.masthead').css('background-image','url(https://live.staticflickr.com/3665/10107093325_51225d96c5_b.jpg)');
		$('.intro-lead-in').text('DAEJEON');
		$('.intro-lead-in').css('font-size','80px');
	}
	else if(location == 'daegu'){
		$('.masthead').css('background-image','url(/img/daegu.jpg)');
		$('.intro-lead-in').text('DAEGU');
		$('.intro-lead-in').css('font-size','80px');
	}
	else if(location == 'busan'){
		$('.masthead').css('background-image','url(/img/busan.jpg)');
		$('.intro-lead-in').text('BUSAN');
		$('.intro-lead-in').css('font-size','80px');
	}
	else{
		$('.masthead').css('background-image','url(https://img1.daumcdn.net/thumb/R1280x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/40Qx/image/53AdCXE8CtpnBhSJIirg2jbKBP8.jpg)');
		$('.intro-lead-in').text('ETC');
		$('.intro-lead-in').css('font-size','80px');
	}
		}
		else{
			alert('없음');
		}
	}).fail(function(r) {
		alert('댓글 삭제 실패');
	});
	
}

function filterLike(location){
	$.ajax({
		type : 'GET',
		url : '/list/like/'+location,
		dataType : 'json' //응답 데이터, 데이터 주고받을땐 무조건 스트링으로 인식해서 이렇게 해줘야 제이슨으로 인식함
	}).done(function(r) { //그래서 여기서 받을 때 잭슨이 제이슨을 자바스크립트로 바꿔줘서 자바스크립트 오브젝트화됨
		console.log(r);
		if (r.length != 0) {
			var res = '';
		for(i=0; i<r.length; i++){
			res += '<div class="col-md-4 my-3">';
			res += '<div class="card bg-light">';
			res += '<a href="/review/'+r[i].id+'">';
			res += '<div class="nearby" style="position:relative">';
			res += '<img src="/media/'+r[i].image1+'" class="card-img-top nearby_photo" style="cursor:pointer; z-index:11;" width=300px height=300px />';
			res += '<div class="row nearby_info align-items-center justify-content-center" style="width:80%;">';
			res += '<p class="ml-4"><i class="fas fa-heart"></i> '+r[i].likeCount+'</p>';
			res += '<p class="ml-3"><i class="fas fa-bookmark right-float"></i> '+r[i].clippingCount+'</p></div>';
			res += '<div class="card-img-overlay ">';
			res += '<div class="list-badge">';
			res += '<span class="badge badge-light">'+r[i].location+'</span>';
			res += '<span class="badge badge-dark ml-1">'+r[i].category+'</span></div></div></div></a>';
			res += '<div id="user" class="card-body text-dark " style="height: 70px;">';
			res += '<div class="d-flex align-items-center">';
			res += '<p class="card-text ">';
			res += '<p class="img float-left mr-2">';
			res += '<img src="/media/'+r[i].profile+'" class="border rounded-circle" onError="javascript:this.src=\'/img/unknown.png\'" width="36" height="36"></p>';
			res += '<p class="name clearfix " style="font-size: 11px;">'+r[i].username+'</p>';
			res += '<a href="/user/mypage/'+r[i].username+'" class="btn btn-warning mb-auto ml-auto" style="cursor: pointer; z-index:10"><i class="fas fa-home"></i></a>';
			res += '</div></p></div></div></div>';
			
			
		}
		var dropdown = '<div class="d-flex ">';
		dropdown += '<a class="dropdown-item text-center" onclick="filterCategory(\''+location+'\',\'cafe\')"><i class="fas fa-coffee"></i><br><p class="my-0" style="font-size:10px;">카페</p></a>';
		dropdown += '<a class="dropdown-item text-center" onclick="filterCategory(\''+location+'\',\'restorant\')"><i class="fas fa-utensils"></i><br><p class="my-0 " style="font-size:10px;">음식점</p></a>';
		dropdown += '<a class="dropdown-item text-center" onclick="filterLike(\''+location+'\')" ><i class="fas fa-heart"></i><br><p class="my-0" style="font-size:10px;">핫한</p></a>';
		dropdown += '<a class="dropdown-item text-center" onclick="filterClip(\''+location+'\')"><i class="fas fa-bookmark"></i><br><p class="my-0" style="font-size:10px;">보관많은</p></a>';
		dropdown += '</div>';
		$('#dropdown-menu').html(dropdown);
		
	$('#feed-container').html(res);
	
		}else{
			alert('없음');
		}
	}).fail(function(r) {
		alert('댓글 삭제 실패');
	});
	
}

function filterClip(location){
	$.ajax({
		type : 'GET',
		url : '/list/clip/'+location,
		dataType : 'json' //응답 데이터, 데이터 주고받을땐 무조건 스트링으로 인식해서 이렇게 해줘야 제이슨으로 인식함
	}).done(function(r) { //그래서 여기서 받을 때 잭슨이 제이슨을 자바스크립트로 바꿔줘서 자바스크립트 오브젝트화됨
		console.log(r);
		if (r.length != 0) {
			var res = '';
		for(i=0; i<r.length; i++){
			res += '<div class="col-md-4 my-3">';
			res += '<div class="card bg-light">';
			res += '<a href="/review/'+r[i].id+'">';
			res += '<div class="nearby" style="position:relative">';
			res += '<img src="/media/'+r[i].image1+'" class="card-img-top nearby_photo" style="cursor:pointer; z-index:11;" width=300px height=300px />';
			res += '<div class="row nearby_info align-items-center justify-content-center" style="width:80%;">';
			res += '<p class="ml-4"><i class="fas fa-heart"></i> '+r[i].likeCount+'</p>';
			res += '<p class="ml-3"><i class="fas fa-bookmark right-float"></i> '+r[i].clippingCount+'</p></div>';
			res += '<div class="card-img-overlay ">';
			res += '<div class="list-badge">';
			res += '<span class="badge badge-light">'+r[i].location+'</span>';
			res += '<span class="badge badge-dark ml-1">'+r[i].category+'</span></div></div></div></a>';
			res += '<div id="user" class="card-body text-dark " style="height: 70px;">';
			res += '<div class="d-flex align-items-center">';
			res += '<p class="card-text ">';
			res += '<p class="img float-left mr-2">';
			res += '<img src="/media/'+r[i].profile+'" class="border rounded-circle" onError="javascript:this.src=\'/img/unknown.png\'" width="36" height="36"></p>';
			res += '<p class="name clearfix " style="font-size: 11px;">'+r[i].username+'</p>';
			res += '<a href="/user/mypage/'+r[i].username+'" class="btn btn-warning mb-auto ml-auto" style="cursor: pointer; z-index:10"><i class="fas fa-home"></i></a>';
			res += '</div></p></div></div></div>';
		
			
		}
		var dropdown = '<div class="d-flex ">';
		dropdown += '<a class="dropdown-item text-center" onclick="filterCategory(\''+location+'\',\'cafe\')"><i class="fas fa-coffee"></i><br><p class="my-0" style="font-size:10px;">카페</p></a>';
		dropdown += '<a class="dropdown-item text-center" onclick="filterCategory(\''+location+'\',\'restorant\')"><i class="fas fa-utensils"></i><br><p class="my-0 " style="font-size:10px;">음식점</p></a>';
		dropdown += '<a class="dropdown-item text-center" onclick="filterLike(\''+location+'\')" ><i class="fas fa-heart"></i><br><p class="my-0" style="font-size:10px;">핫한</p></a>';
		dropdown += '<a class="dropdown-item text-center" onclick="filterClip(\''+location+'\')"><i class="fas fa-bookmark"></i><br><p class="my-0" style="font-size:10px;">보관많은</p></a>';
		dropdown += '</div>';
		$('#dropdown-menu').html(dropdown);
	$('#feed-container').html(res);

		}else{
			alert('없음');
		}
	}).fail(function(r) {
		alert('댓글 삭제 실패');
	});
	
}
	
function filterCategory(location, category){
	
	console.log(category);
	$.ajax({
		type : 'GET',
		url : '/list/category/'+location+'/'+category,
		dataType : 'json' //응답 데이터, 데이터 주고받을땐 무조건 스트링으로 인식해서 이렇게 해줘야 제이슨으로 인식함
	}).done(function(r) { //그래서 여기서 받을 때 잭슨이 제이슨을 자바스크립트로 바꿔줘서 자바스크립트 오브젝트화됨
		console.log(r);
		if (r.length != 0) {
			var res = '';
		for(i=0; i<r.length; i++){
			res += '<div class="col-md-4 my-3">';
			res += '<div class="card bg-light">';
			res += '<a href="/review/'+r[i].id+'">';
			res += '<div class="nearby" style="position:relative">';
			res += '<img src="/media/'+r[i].image1+'" class="card-img-top nearby_photo" style="cursor:pointer; z-index:11;" width=300px height=300px />';
			res += '<div class="row nearby_info align-items-center justify-content-center" style="width:80%;">';
			res += '<p class="ml-4"><i class="fas fa-heart"></i> '+r[i].likeCount+'</p>';
			res += '<p class="ml-3"><i class="fas fa-bookmark right-float"></i> '+r[i].clippingCount+'</p></div>';
			res += '<div class="card-img-overlay ">';
			res += '<div class="list-badge">';
			res += '<span class="badge badge-light">'+r[i].location+'</span>';
			res += '<span class="badge badge-dark ml-1">'+r[i].category+'</span></div></div></div></a>';
			res += '<div id="user" class="card-body text-dark " style="height: 70px;">';
			res += '<div class="d-flex align-items-center">';
			res += '<p class="card-text ">';
			res += '<p class="img float-left mr-2">';
			res += '<img src="/media/'+r[i].profile+'" class="border rounded-circle" onError="javascript:this.src=\'/img/unknown.png\'" width="36" height="36"></p>';
			res += '<p class="name clearfix " style="font-size: 11px;">'+r[i].username+'</p>';
			res += '<a href="/user/mypage/'+r[i].username+'" class="btn btn-warning mb-auto ml-auto" style="cursor: pointer; z-index:10"><i class="fas fa-home"></i></a>';
			res += '</div></p></div></div></div>';
		
			
		}
		var dropdown = '<div class="d-flex ">';
		dropdown += '<a class="dropdown-item text-center" onclick="filterCategory(\''+location+'\',\'cafe\')"><i class="fas fa-coffee"></i><br><p class="my-0" style="font-size:10px;">카페</p></a>';
		dropdown += '<a class="dropdown-item text-center" onclick="filterCategory(\''+location+'\',\'restorant\')"><i class="fas fa-utensils"></i><br><p class="my-0 " style="font-size:10px;">음식점</p></a>';
		dropdown += '<a class="dropdown-item text-center" onclick="filterLike(\''+location+'\')" ><i class="fas fa-heart"></i><br><p class="my-0" style="font-size:10px;">핫한</p></a>';
		dropdown += '<a class="dropdown-item text-center" onclick="filterClip(\''+location+'\')"><i class="fas fa-bookmark"></i><br><p class="my-0" style="font-size:10px;">보관많은</p></a>';
		dropdown += '</div>';
		$('#dropdown-menu').html(dropdown);
	$('#feed-container').html(res);
	
		}else{
			alert('없음');
		}
	}).fail(function(r) {
		alert('댓글 삭제 실패');
	});
	
}


function mainCategory(category){
	
	console.log(category);
	$.ajax({
		type : 'GET',
		url : '/list/category/'+category,
		dataType : 'json' //응답 데이터, 데이터 주고받을땐 무조건 스트링으로 인식해서 이렇게 해줘야 제이슨으로 인식함
	}).done(function(r) { //그래서 여기서 받을 때 잭슨이 제이슨을 자바스크립트로 바꿔줘서 자바스크립트 오브젝트화됨
		console.log(r);
		if (r.length != 0) {
			var res = '';
		for(i=0; i<r.length; i++){
			res += '<div class="col-md-4 my-3">';
			res += '<div class="card bg-light">';
			res += '<a href="/review/'+r[i].id+'">';
			res += '<div class="nearby" style="position:relative">';
			res += '<img src="/media/'+r[i].image1+'" class="card-img-top nearby_photo" style="cursor:pointer; z-index:11;" width="300px" height="300px"/>';
			res += '<div class="row nearby_info align-items-center justify-content-center" style="width:80%;">';
			res += '<p class="ml-4"><i class="fas fa-heart"></i> '+r[i].likeCount+'</p>';
			res += '<p class="ml-3"><i class="fas fa-bookmark right-float"></i> '+r[i].clippingCount+'</p></div>';
			res += '<div class="card-img-overlay ">';
			res += '<div class="list-badge">';
			res += '<span class="badge badge-light">'+r[i].location+'</span>';
			res += '<span class="badge badge-dark ml-1">'+r[i].category+'</span></div></div></div></a>';
			res += '<div id="user" class="card-body text-dark " style="height: 70px;">';
			res += '<div class="d-flex align-items-center">';
			res += '<p class="card-text ">';
			res += '<p class="img float-left mr-2">';
			res += '<img src="/media/'+r[i].profile+'" class="border rounded-circle" onError="javascript:this.src=\'/img/unknown.png\'" width="36" height="36"></p>';
			res += '<p class="name clearfix " style="font-size: 11px;">'+r[i].username+'</p>';
			res += '<a href="/user/mypage/'+r[i].username+'" class="btn btn-warning mb-auto ml-auto" style="cursor: pointer; z-index:10"><i class="fas fa-home"></i></a>';
			res += '</div></p></div></div></div>';

			
		}
	$('#nowContainer').html(res);
	
		}else{
			alert('없음');
		}
	}).fail(function(r) {
		alert('댓글 삭제 실패');
	});
	
}

</script>

		</body>
		</html>