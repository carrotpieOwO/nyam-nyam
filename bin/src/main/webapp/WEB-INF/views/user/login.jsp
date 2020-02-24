<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/etc_nav.jsp"%>
<%@include file="../include/nav.jsp"%>

<!--프로필 바-->
<section>
	<div id="user_header_mini" class="stickyUi ">
		<div class="container" style="width: 60%;">
			<div class="row align-items-center" style="height: 80px;">
				<i class="fas fa-sign-in-alt" style="font-size: 50px;"></i>
				<h4 class="my-auto ml-2">로그인</h4>
			</div>
		</div>
	</div>
</section>

<!--디테일 -->
<section>
	<div class="container" style="margin-top: 16px;">
		<div class="row justify-content-center">
			<!--사진선택-->
			<div class="card bg-light" style="width: 60%">
				<div class="card-header">
					<h4 class="card-title mb-0 text-center">로그인</h4>
				</div>
				<div class="card-body">
					<form>
						<div class="input-group mb-3">
							<input type="text" name="username" id="username"
								class="form-control" placeholder="Enter username" required>

						</div>

						<div class="form-group">
							<input type="password" name="password" id="password"
								class="form-control" placeholder="Enter password" id="pwd"
								required>

						</div>
						<p id="login-check" class="text-danger" style="font-size: 11px;"></p>
						<div class="form-group form-check">
							<label class="form-check-label"> <input
								class="form-check-input" id="remember" type="checkbox">
								Remember me
							</label>
						</div>

						<div class="row justify-content-center">
							<button id="login-submit" type="button"
								class="btn btn-warning mt-5" style="width: 30%;">로그인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	</div>
</section>
<script>
	$('#login-submit').on('click', function(e) {
		e.preventDefault();
		/* if ($('#remember').prop('checked')) {
			$('#remember').val(1);
		} else {
			$('#remember').val(0);
		} */

		var data = {
			username : $('#username').val(),
			password : $('#password').val(),
			/* rememberMe : $('#remember').val() */
		};
		$.ajax({
			type : 'POST',
			url : '/user/login',
			data : data,
			contentType : 'application/x-www-form-urlencoded',
			dataType : 'json'
		}).done(function(r) {
			location.href = '/';
		}).fail(function(r) {
			$('#login-check').html('아이디 혹은 비밀번호를 확인하세요.');
		});
	});
</script>
</body>
</html>