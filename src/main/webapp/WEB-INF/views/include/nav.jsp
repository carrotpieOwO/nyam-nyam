<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()"> <!-- 트루, 펄스 리턴 -->
    <sec:authentication property="principal" var="principal" /> <!-- principal변수에 principal 담음 principal->userdetail타입을 담은 객체-->
</sec:authorize>

<a id="logo" class="navbar-brand" href="/">Nyam-Nyam</a>
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
	Menu <i class="fas fa-bars"></i>
</button>
<div class="collapse navbar-collapse " id="collapsibleNavbar">
	<div>
		<form class="form-inline input-group" action="/search" method="get">
			<div class="input-group-prepend">
				<select id="search-btn" name="searchMenu" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" required>
					<option value="장소" class="dropdown-item" href="#">장소</option> 
					<option value="유저명" class="dropdown-item" href="#">유저명</option> 
					<option value="태그" class="dropdown-item" href="#">태그</option>
				</select>
			</div>
			<input  class="form-control" type="text" name="searchContent" placeholder="Search" />
			<div class="input-group-append">
				<button class="btn btn-warning" type="submit">
					<i class="fas fa-search"></i>
				</button>
			</div>
	
	</form>
	</div>
	<ul id="nav-right" class="navbar-nav text-uppercase ml-auto  align-items-center">
		
			
			<c:choose>
					<c:when test="${not empty principal}">
					
					<li class="nav-item dropdown ">
						<a class="nav-link dropdown-toggle d-flex align-items-center justify-content-center" data-toggle="dropdown" href="#">
							<img src="/media/${principal.profile}"  width="30px" height="30px" class="rounded-circle border" onError="javascript:this.src='/img/unknown.png'"/>
							<p class="my-auto ml-1">${principal.username}</p>
						</a>
					<div class="dropdown-menu" style="font-size:12px; width:30px;">
						<a class="dropdown-item" href="/review/write">리뷰작성</a> 
						<a class="dropdown-item" href="/user/mypage/${principal.username}">마이페이지</a> 
						<a class="dropdown-item" href="/user/userinfo/${principal.id}">프로필 수정</a> 
						<a class="dropdown-item" href="/logout">로그아웃</a>
					</div></li>
						<a class="nav-link mr-3" data-toggle="modal" data-target="#alertModal" data-submit="${principal.id}">
						<i class="far fa-bell" style="font-size:20px"></i></a></li>
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

<script>
//드롭다운
/* $('#search > a').on('click', function() {
	// 버튼에 선택된 항목 텍스트 넣기 
	$('#search-btn').text($(this).text());
	$('#selected-search').val($(this).text());
	// 선택된 항목 값(value) 얻기
	// alert($(this).attr('value'));
}); */
</script>
<%@include file="../modal/alertModal.jsp"%>
