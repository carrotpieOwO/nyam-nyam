<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/home_nav.jsp"%>
<%@include file="../include/nav.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Header -->
<header class="masthead" style="background-image: url(https://t1.daumcdn.net/brunch/service/user/3fy/image/io3TsRxvhNY4StFYDU8UEky6_H0.jpg);">
	<div class="intro-lead-in">SEOUL</div>
</header>


<div id="switch_sex_type">
	<nav>
		<ul id="category" class="mx-auto">
			<li class="yellow underline"><a class="under" href="?c=SwitchTabType">ALL</a></li>
			<li class="yellow underline"><a class="under" href="?c=SwitchTabType&amp;sex_id=1">CAFE</a></li>
			<li class="yellow underline"><a class="under" href="?c=SwitchTabType&amp;sex_id=2">LUNCH</a></li>
			<li class="yellow underline"><a class="under" href="?c=SwitchTabType&amp;sex_id=3">DINING</a></li>
			<li class="yellow underline"><a class="under" href="?c=SwitchTabType&amp;sex_id=4">WORLD</a></li>
		</ul>
	</nav>
</div>
<br>

<div class="container bg-light">
	<div class="row">
		<div class="btn-group btn-group-toggle mx-auto" data-toggle="buttons">
			<button type="button" class="btn btn-outline-dark active" style="width: 130px;">추천</button>
			<button type="button" class="btn btn-outline-dark" style="width: 130px;">타임라인</button>
		</div>
	</div>
	<br>
	<div class="row">
		<div id="sidebar" class="col-md-3">
			<section id="user">
				<h2 class="title mt-5">유저랭킹</h2>
				<ul>
					<li class="clearfix ">
						<p class="rank1 mr-2">1</p>
						<div class="d-flex align-items-center">
							<div class="sub mr-2">
								<p id="user" class="img float-left">
									<a href="/wearofficial/" class="over"><img src="//cdn.wimg.jp/profile/kzighc/20170309105820975_80.jpg" alt="WEAR Official&#12373;&#12435;" width="36" height="36"></a>
								</p>
							</div>
							<div class="main ">
								<p class="name clearfix float-right mb-0">WEAR Official</p>
								<br>
								<p class="txt icon_font">
									<i class="fas fa-user"></i> 281,767
								</p>
							</div>
						</div>
					</li>

					<li class="clearfix ">
						<p class="rank2 mr-2">2</p>
						<div class="d-flex align-items-center">
							<div class="sub mr-2">
								<p class="img float-left">
									<a href="/wearofficial/" class="over"><img src="//cdn.wimg.jp/profile/kzighc/20170309105820975_80.jpg" alt="WEAR Official&#12373;&#12435;" width="36" height="36"></a>
								</p>
							</div>
							<div class="main ">
								<p class="name clearfix float-right mb-0">WEAR Official</p>
								<br>
								<p class="txt icon_font  ">281,767</p>
							</div>
						</div>
					</li>
					<li class="clearfix ">
						<p class="rank3 mr-2">3</p>
						<div class="d-flex align-items-center">
							<div class="sub mr-2">
								<p class="img float-left">
									<a href="/wearofficial/" class="over"><img src="//cdn.wimg.jp/profile/kzighc/20170309105820975_80.jpg" alt="WEAR Official&#12373;&#12435;" width="36" height="36"></a>
								</p>
							</div>
							<div class="main ">
								<p class="name clearfix float-right mb-0">WEAR Official</p>
								<br>
								<p class="txt icon_font  ">281,767</p>
							</div>
						</div>
					</li>
					<li class="clearfix ">
						<p class="rank mr-2">4</p>
						<div class="d-flex align-items-center">
							<div class="sub mr-2">
								<p class="img float-left">
									<a href="/wearofficial/" class="over"><img src="//cdn.wimg.jp/profile/kzighc/20170309105820975_80.jpg" alt="WEAR Official&#12373;&#12435;" width="36" height="36"></a>
								</p>
							</div>
							<div class="main ">
								<p class="name clearfix float-right mb-0">WEAR Official</p>
								<br>
								<p class="txt icon_font  ">281,767</p>
							</div>
						</div>
					</li>
					<li class="clearfix ">
						<p class="rank mr-2">5</p>
						<div class="d-flex align-items-center">
							<div class="sub mr-2">
								<p class="img float-left">
									<a href="/wearofficial/" class="over"><img src="//cdn.wimg.jp/profile/kzighc/20170309105820975_80.jpg" alt="WEAR Official&#12373;&#12435;" width="36" height="36"></a>
								</p>
							</div>
							<div class="main ">
								<p class="name clearfix float-right mb-0">WEAR Official</p>
								<br>
								<p class="txt icon_font  ">281,767</p>
							</div>
						</div>
					</li>
				</ul>
			</section>
		</div>
		<div class="col-md-9">


			<!--카드-->
			<div class="row">
				<h1>Ranking</h1>
			</div>
			<div class="row">
				<div class="col-md-4 my-3">
					<div class="card bg-light">
						<img src="img/food1.jpg" class="card-img-top" />
						<div class="card-img-overlay ">
							<div class="tag-badge">
								<span class="badge badge-light">광안리</span> <span class="badge badge-dark">카페</span>
							</div>
							<p class="rank1 mr-2 float-left" style="width: 30px; height: 30px; font-size: 1.5em;">1</p>


						</div>

						<div id="user" class="card-body text-dark " style="height: 70px;">
							<div class="d-flex align-items-center">
								<p class="card-text ">
								<p class="img float-left mr-2">
									<img src="//cdn.wimg.jp/profile/kzighc/20170309105820975_80.jpg" width="36" height="36">
								</p>
								<p class="name clearfix " style="font-size: 11px;">WEAR Official</p>
								<p class="btn btn-sm btn-info ml-auto">팔로우</p>
							</div>
							</p>

						</div>

					</div>
				</div>
				<!--카드끝-->
				<div class="col-md-4 my-3">
					<div class="card bg-light">
						<img src="img/food2.jpg" class="card-img-top" />
						<div class="card-img-overlay ">
							<div class="tag-badge">
								<span class="badge badge-light">광안리</span> <span class="badge badge-dark">카페</span>
							</div>
							<p class="rank2 mr-2 float-left" style="width: 30px; height: 30px; font-size: 1.5em;">2</p>


						</div>

						<div id="user" class="card-body text-dark " style="height: 70px;">
							<div class="d-flex align-items-center">
								<p class="card-text ">
								<p class="img float-left mr-2">
									<img src="//cdn.wimg.jp/profile/kzighc/20170309105820975_80.jpg" width="36" height="36">
								</p>
								<p class="name clearfix " style="font-size: 11px;">WEAR Official</p>
								<p class="btn btn-sm btn-info ml-auto">팔로우</p>
							</div>
							</p>

						</div>

					</div>
				</div>
				<!--카드끝-->
				<div class="col-md-4 my-3">
					<div class="card bg-light">
						<img src="img/food3.jpg" class="card-img-top" />
						<div class="card-img-overlay ">
							<div class="tag-badge">
								<span class="badge badge-light">광안리</span> <span class="badge badge-dark">카페</span>
							</div>
							<p class="rank3 mr-2 float-left" style="width: 30px; height: 30px; font-size: 1.5em;">3</p>


						</div>

						<div id="user" class="card-body text-dark " style="height: 70px;">
							<div class="d-flex align-items-center">
								<p class="card-text ">
								<p class="img float-left mr-2">
									<img src="//cdn.wimg.jp/profile/kzighc/20170309105820975_80.jpg" width="36" height="36">
								</p>
								<p class="name clearfix " style="font-size: 11px;">WEAR Official</p>
								<p class="btn btn-sm btn-info ml-auto">팔로우</p>
							</div>
							</p>

						</div>

					</div>
				</div>


				<!--tag-->
				<div class="container mt-5">
					<div class="row mb-2">
						<h1>#Trend HashTag</h1>
					</div>
					<div class="row text-center ml-auto justify-content-center mb-2 mr-5">


						<div class="card mr-2 col-md-3">
							<div class="card-body">#Basic card</div>
						</div>
						<div class="card mr-2 col-md-3">
							<div class="card-body">#Basic card</div>
						</div>
						<div class="card mr-2 col-md-3">
							<div class="card-body">#Basic card</div>
						</div>


					</div>
					<div class="row text-center ml-auto justify-content-center">


						<div class="card mr-2 col-md-3">
							<div class="card-body">#Basic card</div>
						</div>
						<div class="card mr-2 col-md-3">
							<div class="card-body">#Basic card</div>
						</div>
						<div class="card mr-2 col-md-3">
							<div class="card-body">#Basic card</div>
						</div>


					</div>
				</div>
				<!--editor-->
				<div class="container">
					<div class="row mt-5">
						<h1>Editor's Pick</h1>
					</div>
					<div class="row justify-content-center ">
						<div id="demo" class="carousel slide" data-ride="carousel">

							<!-- Indicators -->
							<ul class="carousel-indicators">
								<li data-target="#demo" data-slide-to="0" class="active"></li>
								<li data-target="#demo" data-slide-to="1"></li>
								<li data-target="#demo" data-slide-to="2"></li>
							</ul>

							<!-- The slideshow -->
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img src="https://www.agoda.com/wp-content/uploads/2019/03/Best-restaurants-in-Seoul-Fine-dining-Jungsik-Seoul-Mingles-restaurant.jpg" alt="Los Angeles" style="width: 600px; height: 400px;">
									<div class="carousel-caption">
										<h3>Los Angeles</h3>
										<p>We had such a great time in LA!</p>
									</div>
								</div>
								<div class="carousel-item">
									<img src="https://www.hanbit.co.kr/data/editor/20190819134502_voahpmrs.jpg" alt="Chicago" style="width: 600px; height: 400px;">
								</div>
								<div class="carousel-item">
									<img src="https://www.travel141.co.kr/wp-content/uploads/2017/02/dscf5729.jpg" alt="New York" style="width: 600px; height: 400px;">
								</div>
							</div>

							<!-- Left and right controls -->
							<a class="carousel-control-prev" href="#demo" data-slide="prev"> <span class="carousel-control-prev-icon"></span>
							</a> <a class="carousel-control-next" href="#demo" data-slide="next"> <span class="carousel-control-next-icon"></span>
							</a>

						</div>
					</div>
				</div>
			</div>

		</div>
		<script src="/js/nav-style.js"></script>
		</body>
		</html>