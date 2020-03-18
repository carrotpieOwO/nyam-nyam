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
							<input type="text" id="address" class="form-control" placeholder="Enter address" readonly>
							<div class="input-group-append">
								<button class="btn btn-warning" onclick="sample4_execDaumPostcode()" type="button">주소찾기</button>
							</div>				
						</div>
							<input type="text" id="detailAddres" class="form-control" placeholder="Enter detail-address">
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
		<%@include file="../include/footer.jsp"%>
	
</section>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
