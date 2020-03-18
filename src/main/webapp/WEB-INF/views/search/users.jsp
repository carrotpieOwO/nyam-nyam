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
         <h4 class="ml-auto"> ${fn:length(users)}건</h4>
        </div>
            </div>
    </div>
  </section>

<section>
<div class="container">
	<div class="mt-5">
	<c:forEach var="user" items="${users}">
	<div class="row mt-2 align-items-center mx-auto border" style="height: 70px; width: 50%;">
		<div class="ml-2 profile ">
			<img src="/media/${user.profile}" class="border rounded-circle" width="48" height="48" 
			onError="javascript:this.src='/img/unknown.png'"></div>
		<div class="ml-2">
			<p class="my-auto">@${user.username}</p>
			<p class="my-auto" style="font-size: 11px;">${user.introduction}</p>
		</div>
		<div class="ml-auto mr-2">
			<a href="/user/mypage/${user.username}" class="btn btn-warning"><i class="fas fa-home"></i></a>
		
		</div>
	</div>
	</c:forEach>
		
	<!--카드끝-->
			</div>
	</div>
	</section>
	<%@include file="../include/footer.jsp"%>
	
<script src="/js/nav-style.js"></script>
		</body>
		</html>