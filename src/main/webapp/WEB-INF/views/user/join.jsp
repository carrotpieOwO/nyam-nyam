<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/etc_nav.jsp"%>
<%@include file="../include/nav.jsp"%>
<section>
	<div id="user_header_mini" class="stickyUi ">
		<div class="container" style="width: 60%;">
			<div class="row align-items-center" style="height: 80px;">
				<i class="fas fa-users" style="font-size: 50px;"></i>
				<h4 class="my-auto ml-2">회원가입</h4>
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
					<h4 class="card-title mb-0">기본정보</h4>
				</div>
				<div class="card-body">
					<form>
						<div class="form-group mb-3">
							<input type="text" id="username" class="form-control" placeholder="Enter username" required>
							<p id="id-check" class="text-danger" style="font-size:11px;"></p>
						</div>

						<div class="form-group">
							<input type="password" id="password" class="form-control" placeholder="Enter password" id="pwd" required>
							<p id="pw-check" class="text-danger" style="font-size:11px;"></p>
						</div>

						<div class="form-group">
							<input type="email" id="email" class="form-control" placeholder="Enter email" id="email" required>
							<p id="email-check" class="text-danger" style="font-size:11px;"></p>
						</div>
						<div class="input-group mb-3">
							<input type="text" id="address" class="form-control" placeholder="Enter address">
							<div class="input-group-append">
								<button class="btn btn-warning" type="button">주소찾기</button>
							</div>
						</div>

						<div class="row justify-content-center">
							<button type="button" id="join-submit" class="btn btn-warning mt-5" style="width: 30%;">회원가입</button>
							
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
$('#join-submit').on("click",function(){
	var data = {
			username : $('#username').val(),
			password : $('#password').val(),
			email : $('#email').val(),
			address : $('#address').val()
		};
		$.ajax({
			type : 'POST',
			url : '/user/join',
			data : JSON.stringify(data), 
			contentType : 'application/json; charset=utf-8',
			dataType : 'json'
		}).done(function(r) {
			if (r.statusCode == 200) {
				alert('회원가입 성공');
				location.href = '/user/login';
			} else {
				if (r.msg == '아이디중복') {
					$('#id-check').html('아이디가 중복되었습니다.');
				} else {
					alert('회원가입 실패');
				}
			}
		}).fail(function(r) {
			console.log(r);
			$('#id-check').html(r.responseJSON.username);
			$('#pw-check').html(r.responseJSON.password);
			$('#email-check').html(r.responseJSON.email);

		});
	
});
</script>


</body>
</html>
