<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/etc_nav.jsp"%>
<%@include file="../include/nav.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
		<div class="row justify-content-center col-12">
			<form:form action="/review/write" method="post"
				enctype="multipart/form-data" class="row justify-content-center col-12">
				<input type="hidden" name="userId" value="${principal.id}">

				<!--사진선택-->
				<div class="card bg-light" style="width: 80%">
					<div class="card-header">
						<h4 class="card-title mb-0">사진선택</h4>
					</div>
					<div class="card-body">
						<div class="row">
						 <div id="upload" class="filebox ">
								<label for="uploadFile" class="btn btn-warning ml-5"><i
									class="fas fa-camera"></i> 사진업로드</label> 
									<input type="file" id="uploadFile" name="images" class="multi" maxlength="3" multiple="multiple" />
									
							</div>
							 
							 
							<!-- <input type="file" id="input_img" name="images"
									class="form-control-file border mt-1" style="width: 50%;" multiple="multiple"><br> -->
							
						</div>
						<div class="row justify-content-center">
							<div id="preview" class="preview">
								<div id="no-image" class=" text-center">
									<i class="mt-5 far fa-images" style="font-size: 50px"></i><br>
									<p class="mb-5 mt-1" style="display: block; font-size: 12px">사진은
										3장까지 업로드 가능합니다.</p>
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
								<input type="hidden" name="rating" id="rating" value="" /> <a
									href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a>
							</p>

							<!-- 가격대  -->
							<div class="ml-3 dropdown">
								<button type="button" id="dropdown-btn"
									class="btn btn-sm btn-warning dropdown-toggle"
									data-toggle="dropdown">가격대</button>
								<div id="price" class="dropdown-menu">
									<a class="dropdown-item" name="price" value=1>1만원 이하</a> <a
										class="dropdown-item" name="price" value=2>1만원~3만원</a> <a
										class="dropdown-item" name="price" value=3>3만원~5만원</a> <a
										class="dropdown-item" name="price" value=4>5만원~10만원</a> <a
										class="dropdown-item" name="price" value=5>10만원 이상</a>
								</div>
								<input id="selected-item" type="hidden" name="price" value=""/>
							</div>

						</div>
						<!--가게이름-->
						<div class="form-group">
							<label for="comment">가게이름:</label> <input type="text" name="shopName"
								class="form-control" id="store_name" style="width: 60%;">
						</div>
						<!--후기-->
						<div class="form-group">
							<label for="comment">후기:</label>
							<textarea name="content" class="form-control" rows="5" id="review"></textarea>
						</div>
						<!--태그-->
						<label for="comment" class="mb-1">태그:</label><br>
						<div id="tags">
							
						</div>
						<div class="input-group input-group-sm col-6 row">
							<input type="text" id="tag-input" class="form-control"
								placeholder="태그입력">
							<div class="input-group-append">
								<button class="btn btn-warning" type="button" id="tag-btn">추가</button>
							</div>
						</div>
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
								<input type="text" name="location" class="form-control form-control-sm mt-1"
									placeholder="상세주소">
							</div>
							<div class="col-6">
								<!-- * 카카오맵 - 지도퍼가기 -->
								<!-- 1. 지도 노드 -->
								<div id="daumRoughmapContainer1582003892727"
									class="root_daum_roughmap root_daum_roughmap_landing"></div>
							</div>
						</div>

					</div>
				</div>
				<div class="row justify-content-center">
			<button class="btn btn-warning mt-3 mb-3" style="width: 200px;">업로드</button>
		</div>
				</form:form>
				<!--끝-->
		</div>
		
	</div>
</section>
<script>

	//다중파일 업로드
	$(document).ready( function() {
 
        $("input[type=file]").change(function () {
            
            var fileInput = document.getElementById("uploadFile");
            
            var files = fileInput.files;
            var file;
            
            for (var i = 0; i < files.length; i++) {
                
                file = files[i];
 
                alert(file.name);
            }
            
        });
 
    });
    
	$(document)
			.ready(
					function(e) {
						$('#uploadFile').change(function(e) {

							var files = e.target.files;
							var arr = Array.prototype.slice.call(files);
							console.log($('uploadFile').val());
							console.log(e.target.files);
							$('uploadFile').val(files);
							preview(arr);

						});//file change

						function preview(arr) {
							var sel_files = [];
							arr
									.forEach(function(f) {
										//div에 이미지 추가
										var str = '<div id="img" style="display: inline-flex; padding: 12px;">';
										var g_count = 0;
										//이미지 파일 미리보기
										if (f.type.match('image.*')) {
											if (arr.lenght > 3) {
												alert('사진은 3장까지 올릴 수 있습니다.');
												return;
											}
											sel_files.push(f);
											var reader = new FileReader();
											reader.onload = function(e) {
												if ($("img").length > 3) {
													alert('이미지는 3장까지 업로드 가능합니다.');
													return;
												}
												if ($("img").length) {
													$('#no-image').hide();

												}

												str += '<div id="card" class="card bg-light" style="width: 250px; hegit: 250px">';
												str += '<img src="'+e.target.result+'"class="card-img-top" title="'+f.name+'" width=250 height=250 />';
												str += '<div class="card-img-overlay">';
												str += '<button type="button" onclick="deleteImage()" class="float-right btn btn-danger btn-sm rounded-circle"><i class="fas fa-times"></i></button>';
												str += '</div></div>';

												$(str).appendTo('#preview');
											//	$('#uploadFile').append("<input type='file' name='file_"+(g_count++)+"'/>");
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

	//파일 삭제
	function deleteImage() {

		$('#card').remove();
		$('#uploadFile').val("");

		if (!$('#card').length) {
			console.log($("img").length);
			$('#no-image').show();
		}
	};

	//별점주기
	$('#star_grade a').click(function() {
		$(this).parent().children("a").removeClass("on"); /* 별점의 on 클래스 전부 제거 */
		$(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
		var rating = $('.on').length;
		$('#rating').val(rating);
		return false;
	});

	//드롭다운
	$('#price > a').on('click', function() {
		// 버튼에 선택된 항목 텍스트 넣기 
		$('#dropdown-btn').text($(this).text());
		$('#selected-item').val($(this).text());
		// 선택된 항목 값(value) 얻기
		// alert($(this).attr('value'));
	});

	//태그
	$('#tag-btn')
			.on(
					'click',
					function() {

						var str = '<p id="tag" class="tag mb-1 mr-1">';
						str += $('#tag-input').val();
						str += '<a onclick="deleteTag()" class="ml-2"><strong>X</strong></a></p>';

						$('#tags').append(str);
						$('#tag-input').val("");

					});

	function deleteTag() {

		$('#tag').remove();

		if (!$('#card').length) {
			console.log($("img").length);
			$('#no-image').show();
		}
	};
</script>
</body>
</html>