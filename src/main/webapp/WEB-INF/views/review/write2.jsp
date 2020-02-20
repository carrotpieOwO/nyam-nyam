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
					<div class="row">
						<div id="upload" class="filebox ">
							<label for="uploadFile" class="btn btn-warning ml-5"><i class="fas fa-camera">사진업로드</i></label> 
							<input type="file" id="uploadFile"  class="multi" maxlength="3" />
						</div>
					</div>
					<div class="row justify-content-center">
						<div id="preview" class="preview">
							<div id="no-image" class=" text-center">
								<i class="mt-5 far fa-images" style="font-size:50px"></i><br>
								<p class="mb-5" style="display: block">사진은 3장까지 업로드 가능합니다.</p>
							</div>
						</div>
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
	$(document).ready(function(e) {
		$("input[type='file']").change(function(e) {

			var files = e.target.files;
			var arr = Array.prototype.slice.call(files);

			preview(arr);

		});//file change

		function preview(arr) {
			var sel_files=[];
			arr.forEach(function(f) {
				//div에 이미지 추가
				var str = '<div id="img" style="display: inline-flex; padding: 12px;">';
			
				//이미지 파일 미리보기
				if (f.type.match('image.*')) {
					if(arr.lenght>3){
							alert('사진은 3장까지 올릴 수 있습니다.');
							return;
						}
					sel_files.push(f);
					var reader = new FileReader(); 
					reader.onload = function(e) { 
						if($("img").length > 3 ){
							alert('이미지는 3장까지 업로드 가능합니다.');
							return;
							}
						if($("img").length){
							$('#no-image').hide();

							}
						
						str += '<div id="card" class="card bg-light" style="width: 250px; hegit: 250px">';
						str += '<img src="'+e.target.result+'"class="card-img-top" title="'+f.name+'" width=250 height=250 />';
						str += '<div class="card-img-overlay">';
						str += '<button type="button" onclick="deleteImage()" class="float-right btn btn-danger btn-sm rounded-circle"><i class="fas fa-times"></i></button>';
						str += '</div></div>';
						
						$(str).appendTo('#preview');
						
					}
					console.log(sel_files);			
					reader.readAsDataURL(f);
				} else {
					alert('이미지 파일만 업로드 가능합니다.');
					return;
				}
			});//arr.forEach
		}
	});


	 function deleteImage(){
		 		
			$('#card').remove();
			$('#uploadFile').val("");

			if(!$('#card').length) {
				console.log($("img").length);
				$('#no-image').show();
			}
		};

	$('#star_grade a').click(function() {
		$(this).parent().children("a").removeClass("on"); /* 별점의 on 클래스 전부 제거 */
		$(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
		return false;
	});
	
</script>
</body>
</html>