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
			<!-- 사이드바 -->
			<div class="col-4">
				<div class="btn-group-vertical mt-5 float-right" style="width: 70%;">
					<a type="button" class="btn btn-outline-secondary active mb-2">프로필</a>
					<a href="/user/profile/${principal.id}" type="button"
						class="btn btn-outline-secondary">기본정보</a>

				</div>
			</div>

			<!-- 폼 -->
			<div class="col-8">
				<form:form action="/user/userinfo" method="PUT"
					enctype="multipart/form-data">
					<input type="hidden" name="id" value="${principal.id}">

					<!--프로필 사진-->
					<div class="card bg-light">
						<div class="card-header">
							<h4 class="card-title mb-0">프로필</h4>
						</div>

						<div class="card-body">
							<div class="row justify-content-center img-wrap">
								<img src="/media/${principal.profile}" id="img"
									class="rounded-circle" width="200" height="200"
									onError="javascript:this.src='/img/unknown.png'" />
							</div>
							<div class="row justify-content-center mt-2">
								<input type="file" id="input_img" name="profile"
									class="form-control-file border mt-1" style="width: 50%;"><br>
								<button type="button"
									id="profile-delete" class="btn btn-secondary btn-sm ml-2"
									style="width: 60px;">삭제</button>
							</div>
							<!--자기소개-->
							<div class="card bg-light mt-3">
								<div class="card-header ">
									<h4 class="card-title mb-0">자기소개</h4>
								</div>

								<div class="card-body">
									<div class="form-group">
										<textarea class="form-control" rows="5" name="introduction">${principal.introduction}</textarea>
									</div>

								</div>
							</div>

							<!--외부 사이트-->
							<div class="card bg-light mt-2">
								<div class="card-header ">
									<h4 class="card-title mb-0">외부 사이트</h4>
								</div>

								<div class="card-body">
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text ">instagram</span>
										</div>
										<input type="text" id="insta" class="form-control" name="insta"
											value="${principal.insta}"
											placeholder="ex) https://www.instagram.com/nyam-nyamy">

									</div>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text ">HP · Blog</span>
										</div>
										<input type="text" id="blog" class="form-control" name="blog"
											value="${principal.blog}"
											placeholder="ex) https://blog.naver.com/nyam-nyamy">
									</div>

								</div>
							</div>


							<div class="row justify-content-center">
								<button type="submit" class="btn btn-warning mt-5"
									style="width: 30%;">수정</button>
							</div>
				</form:form>

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
$('#profile-delete').on('click', function() {
	/* $('img').src='/img/unknown.png'; */
	$('#img').attr('src','/img/unknown.png');
	$('#input_img').val("");
});

	var sel_file;
	$(document).ready(function() {
		$('#input_img').on("change", handleImgFileSelect);
	});
	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			sel_file = f;
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#img').attr('src', e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}

$('#insta').focus(function(){
	$('#insta').val('https://www.instagram.com/');
});

$('#blog').focus(function(){
	$('#blog').attr('placeholder','');
});
</script>

</body>
</html>
