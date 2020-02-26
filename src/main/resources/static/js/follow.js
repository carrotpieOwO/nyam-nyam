//팔로우
	function follow(fromUserId, toUserId){
		console.log(toUserId);
		console.log(fromUserId);

		console.log('#follow-true')
			var data = {
					fromUser: fromUserId,
					toUser: toUserId
				};
				console.log(data);
			 	$.ajax({
					type : 'POST',
					url : '/follow',
					data : JSON.stringify(data),
					contentType : 'application/json; charset=utf-8', //보내는 데이터
					dataType : 'text' //응답 데이터, 데이터 주고받을땐 무조건 스트링으로 인식해서 이렇게 해줘야 제이슨으로 인식함
				}).done(function(r) { //그래서 여기서 받을 때 잭슨이 제이슨을 자바스크립트로 바꿔줘서 자바스크립트 오브젝트화됨
					console.log(r);
					if (r == 'ok') {
						console.log(r);
						let followerCount = $('#followerCount').text()
						if($('#followBoolean').val() == 'true'){
							$('#follow-true').attr('class','btn btn-primary mx-auto mt-2  text-white');
							$('#follow-true').html('<i id="plus" class="fas fa-user-plus"></i> 팔로우');						
							$('#follow-true').attr('id','follow-false');
							$('#followBoolean').val('false');
							$('#followerCount').text( Number(followerCount)-1);               

						}else {
							$('#follow-false').attr('class','btn btn-outline-dark mx-auto mt-2');
							$('#follow-false').html('<i id="check" class="fas fa-user-check"></i> 팔로잉');						
							$('#follow-false').attr('id','follow-true');
							$('#followBoolean').val('true');
							$('#followerCount').text( Number(followerCount)+1);
							/* $('#like-item-'+reviewId).attr('class','far fa-heart float-right');
							$('#likeCount').text(Number(likeCount)-1);
							}	 */
					}
					}else{
							alert('좋아요 실패');
						}
				}).fail(function(r) {
					alert('댓글 삭제 실패');
				}); 
			
			}