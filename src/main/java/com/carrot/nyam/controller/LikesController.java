package com.carrot.nyam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.carrot.nyam.model.likes.Likes;
import com.carrot.nyam.model.likes.dto.ReqLikeDto;
import com.carrot.nyam.repository.LikesRepository;

@RestController
public class LikesController {
	
	@Autowired
	private LikesRepository likesRepository;
	
	@PostMapping("/like/{reviewId}")
	public @ResponseBody String like(@RequestBody ReqLikeDto dto) {
		int reviewId = dto.getReviewId();
		int userId = dto.getUserId();
		System.out.println(dto);
		Likes oldLike = likesRepository.findByUserIdAndReviewID(reviewId, userId);
		System.out.println(oldLike);
		
		try {
			if(oldLike==null) {
				likesRepository.like(reviewId, userId);
			}else {
				likesRepository.dislike(oldLike.getId());
			}
				return "ok";
		}catch (Exception e){
			e.printStackTrace();
		}
		return "fail";
	}
	
	//리턴타입 불리언으로 바꿔서 해보기
}
