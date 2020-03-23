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
		<div class="row ">
			<!-- 사이드 nav  -->
			<div class="col-4">
				<div class="btn-group-vertical mt-5  float-right" style="width: 70%;">
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
								<input type="text" id="address" class="form-control" value="${principal.address}" placeholder="Enter address">
								<div class="input-group-append">
									<button class="btn btn-warning" onclick="sample4_execDaumPostcode()" type="button">주소찾기</button>
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
	<%@include file="../include/footer.jsp"%>
	
</section>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
			$('#pw-check').html(r.responseJSON.errors[0].defaultMessage);
		});

	});

	//주소찾기
	 function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
               

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address").value = roadAddr;
                
            }
        }).open();
    }
</script>


</body>
</html>
