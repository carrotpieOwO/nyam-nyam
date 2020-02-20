<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/etc_nav.jsp"%>
<%@include file="../include/nav.jsp"%>
<!--프로필 바-->
<section>
	<div id="user_header_mini" class="stickyUi ">
		<div class="container" style="width: 60%;">
			<div class="row align-items-center" style="height: 80px;">
				<i class="fas fa-camera-retro" style="font-size: 50px;"></i>
				<h4 class="my-auto ml-2">글쓰기</h4>
			</div>
		</div>
	</div>
</section>

<!--디테일 -->
<section>
	<div class="container" style="margin-top: 16px;">
		<div class="row justify-content-center">
			<!--사진선택-->
			<div class="card bg-light" style="width: 80%">
				<div class="card-header">
					<h4 class="card-title mb-0">사진선택</h4>
				</div>
				<div class="card-body">
					<div class="row  justify-content-center">
						<!-- 이미지 1 -->
						<div class=" card bg-light mr-2" style="width: 250px; hegit: 250px">
							<img src="media/" id="img1" class="card-img-top" width="250" height="250" onError="javascript:this.src='/img/null.png'" />
							<div id="file-button" class="card-img-overlay d-flex justify-content-center align-items-center">
								<div id="upload" class="filebox ">
									<label for="input_img" class="btn btn-warning rounded-circle "><i class="fas fa-plus"></i></label> 
									<input type="file" id="input_img" multiple/>
								</div>
							</div>
						</div>
						<!-- 이미지 2 -->
						<div class=" card bg-light mr-2" style="width: 250px; hegit: 250px">
							<img src="media/" id="img1" class="card-img-top" width="250" height="250" onError="javascript:this.src='/img/null.png'" />
							<div id="file-button" class="card-img-overlay d-flex justify-content-center align-items-center">
								<div id="upload" class="filebox ">
									<label for="input_img" class="btn btn-warning rounded-circle "><i class="fas fa-plus"></i></label> <input type="file" id="input_img">
								</div>
							</div>
						</div>
						<!-- 이미지 3 -->
						<div class=" card bg-light mr-2" style="width: 250px; hegit: 250px">
							<img src="media/" id="img1" class="card-img-top" width="250" height="250" onError="javascript:this.src='/img/null.png'" />
							<div id="file-button" class="card-img-overlay d-flex justify-content-center align-items-center">
								<div id="upload" class="filebox ">
									<label for="input_img" class="btn btn-warning rounded-circle "><i class="fas fa-plus"></i></label> <input type="file" id="input_img">
								</div>
							</div>
						</div>
					<!-- 이미지 끝  -->
					</div>
				</div>
			</div>

			<!--내용입력-->
			<div class="card bg-light mt-2" style="width: 80%">
				<div class="card-header">
					<h4 class="card-title mb-0">내용입력</h4>
				</div>
				<div class="card-body">
					<!--별점,가격대-->
					<div class="row ml-1">
						<p id="star_grade">
							<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
								class="fas fa-star"></i></a>
						</p>

						<div class="ml-3 dropdown">
							<button type="button" class="btn btn-sm btn-warning dropdown-toggle" data-toggle="dropdown">가격대</button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="#">1만원 이하</a> <a class="dropdown-item" href="#">1만원~3만원</a> <a class="dropdown-item" href="#">3만원~5만원</a> <a class="dropdown-item" href="#">5만원~10만원</a> <a
									class="dropdown-item" href="#">10만원 이상</a>
							</div>
						</div>

					</div>
					<!--가게이름-->
					<div class="form-group">
						<label for="comment">가게이름:</label> <input type="text" class="form-control" id="store_name" style="width: 60%;">
						</textarea>
					</div>
					<!--후기-->
					<div class="form-group">
						<label for="comment">후기:</label>
						<textarea class="form-control" rows="5" id="review"></textarea>
					</div>
					<!--태그-->
					<label for="comment" class="mb-1">태그:</label><br>
					<p class="tag mb-1">
						광안리 <strong>X</strong>
					</p>
					<div class="input-group input-group-sm col-6 row">
						<input type="text" class="form-control" placeholder="태그입력">
						<div class="input-group-append">
							<button class="btn btn-warning" type="submit">추가</button>
						</div>
					</div>
					<!--가격대-->
				</div>
			</div>
			<!--위치정보-->
			<div class="card bg-light mt-2" style="width: 80%">
				<div class="card-header">
					<h4 class="card-title mb-0">위치정보</h4>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-6">
							<div class="input-group input-group-sm">
								<input type="text" class="form-control" placeholder="주소">
								<div class="input-group-append">
									<button class="btn btn-warning" type="submit">검색</button>
								</div>
							</div>
							<input type="text" class="form-control form-control-sm mt-1" placeholder="상세주소">
						</div>
						<div class="col-6">
							<!-- * 카카오맵 - 지도퍼가기 -->
							<!-- 1. 지도 노드 -->
							<div id="daumRoughmapContainer1582003892727" class="root_daum_roughmap root_daum_roughmap_landing"></div>
						</div>
					</div>

				</div>
			</div>
			<!--끝-->

		</div>
		<div class="row justify-content-center">
			<button class="btn btn-warning mt-3 mb-3" style="width: 200px;">업로드</button>
		</div>
	</div>
	</div>
</section>
<script>
	var sel_file;
	$(document).ready(function() {
		$('#input_img').on("change", handleImgFileSelect);
	});

	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr
				.forEach(function(f) {
					if (!f.type.match("image.*")) {
						alert("확장자는 이미지 확장자만 가능합니다.");
						return;
					}/* 
					if(filesArr.lenght>3){
							alert("사진은 3장까지 올릴 수 있습니다.");
							return;
						} */
					sel_file = f;
					var reader = new FileReader();
					reader.onload = function(e) {
						$('#img1').attr('src', e.target.result);
					}
					reader.readAsDataURL(f);
					$('#upload').remove();
					var btnDel = "<button type='button' id='btn-del' class='btn btn-danger btn-sm rounded-circle'><i class='fas fa-times'></i></button>"
					$('#file-button').attr('class', 'card-img-overlay');
					$('#file-button').append(btnDel);
				});
	}

	$(document).on("click","#btn-del",function(){  
		$('#img1').attr('src', '/img/null.png');
		$('#input_img').val("");
		$('#btn-del').remove();
		$('#file-button').attr('class', 'card-img-overlay d-flex justify-content-center align-items-center');
		$('#file-button').append($('.filebox'));
	});
	
	$('#star_grade a').click(function() {
		$(this).parent().children("a").removeClass("on"); /* 별점의 on 클래스 전부 제거 */
		$(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
		return false;
	});
</script>
</body>
</html>