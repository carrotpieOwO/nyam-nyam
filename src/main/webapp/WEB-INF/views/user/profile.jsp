<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/etc_nav.jsp"%>
<%@include file="../include/nav.jsp"%>
<section>
	<div id="user_header_mini" class="stickyUi ">
		<div class="container" style="width: 60%;">
			<div class="row align-items-center" style="height: 80px;">
				<i class="fas fa-user-cog" style="font-size: 50px;"></i>
				<h4 class="my-auto ml-2">프로필 수정</h4>
			</div>
		</div>
	</div>
</section>

<!--디테일 -->
<section>
	<div class="container" style="margin-top: 16px;">
		<div class="row justify-content-center">
			<!-- 사이드 nav  -->
			<div class="col-4">
				<div class="btn-group-vertical mt-5" style="width: 70%;">
					<a href="/user/userinfo/${principal.id}" type="button" class="btn btn-outline-secondary mb-2">프로필</a> <a type="button" class="btn btn-outline-secondary active">기본정보</a>

				</div>
			</div>
			<!-- 입력폼 -->
			<div class="col-8">
				<div class="card bg-light">
					<div class="card-header">
						<h4 class="card-title mb-0">기본정보</h4>
					</div>
					<div class="card-body">
						<form>
							<input type="hidden" id="id" value="${principal.id}">
							<div class="form-group mb-3">
								<input type="text" id="username" class="form-control" placeholder="Enter username" value="${principal.username}" readonly>
							</div>

							<div class="form-group">
								<input type="password" id="password" class="form-control" placeholder="Enter password" required>
								<p id="pw-check" class="text-danger" style="font-size: 11px;"></p>
							</div>

							<div class="form-group">
								<input type="email" id="email" class="form-control" placeholder="Enter email" value="${principal.email}" readonly>
							</div>
							<div class="input-group mb-3">
								<input type="text" id="address" class="form-control" placeholder="Enter address">
								<div class="input-group-append">
									<button class="btn btn-warning" type="button">주소찾기</button>
								</div>
							</div>

							<div class="row justify-content-center">
								<button type="button" id="update-submit" class="btn btn-warning mt-5" style="width: 30%;">수정</button>

							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
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
