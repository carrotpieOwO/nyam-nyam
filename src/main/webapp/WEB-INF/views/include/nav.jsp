<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()"> <!-- 트루, 펄스 리턴 -->
    <sec:authentication property="principal" var="principal" /> <!-- principal변수에 principal 담음 principal->userdetail타입을 담은 객체-->
</sec:authorize>

<a id="logo" class="navbar-brand" href="/">Nyam-Nyami</a>
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
	Menu <i class="fas fa-bars"></i>
</button>
<div class="collapse navbar-collapse " id="collapsibleNavbar">
	<div>
		<form id="search" class="form-inline input-group" action="/action_page.php">
			<div class="input-group-prepend">
				<button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">검색조건</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">장소</a> 
					<a class="dropdown-item" href="#">유저명</a> 
					<a class="dropdown-item" href="#">태그</a>
				</div>
			</div>

			<input  class="form-control" type="text" placeholder="Search" />
			<div class="input-group-append">
				<button class="btn btn-warning" type="submit">
					<i class="fas fa-search"></i>
				</button>
			</div>
	</div>
	</form>
	<a id="logo-center" class="navbar-brand ml-auto" href="/">Nyam-Nyami</a>
	<ul id="nav-right" class="navbar-nav text-uppercase ml-auto  align-items-center">
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle text-center" data-toggle="dropdown" href="#">지역선택</a>
			<div class="dropdown-menu " id="selectCity">
				<a class="dropdown-item" href="#">Link 1</a> <a class="dropdown-item" href="#">Link 2</a> <a class="dropdown-item" href="#">Link 3</a>
			</div></li>
			
			<c:choose>
					<c:when test="${not empty principal}">
					
					<li class="nav-item dropdown ">
						<a class="nav-link dropdown-toggle d-flex align-items-center justify-content-center" data-toggle="dropdown" href="#">
							<img src="/media/${principal.profile}"  width="30px" height="30px" class="rounded-circle" onError="javascript:this.src='/img/unknown.png'"/>
							<p class="my-auto ml-1">${principal.username}</p>
						</a>
					<div class="dropdown-menu" style="font-size:12px; width:30px;">
						<a class="dropdown-item" href="/review/write">리뷰작성</a> 
						<a class="dropdown-item" href="#">마이페이지</a> 
						<a class="dropdown-item" href="/user/userinfo/${principal.id}">프로필 수정</a> 
						<a class="dropdown-item" href="/logout">로그아웃</a>
					</div></li>
					
						
						<a class="nav-link mr-3" href="/user/logout"><i class="far fa-bell" style="font-size:20px"></i></a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item">
						<a class="nav-link" href="/user/login">로그인</a></li>
						<li class="nav-item">
						<a class="nav-link" href="/user/join">회원가입</a></li>
					</c:otherwise>
				</c:choose>
	
	</ul>
</div>
</nav>
</div>