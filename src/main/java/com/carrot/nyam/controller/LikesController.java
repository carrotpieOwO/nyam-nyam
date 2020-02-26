package com.carrot.nyam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.carrot.nyam.model.follow.Follow;
import com.carrot.nyam.model.follow.dto.ReqFollowInfoDto;
import com.carrot.nyam.model.likes.Likes;
import com.carrot.nyam.model.likes.dto.ReqLikeDto;
import com.carrot.nyam.model.likes.dto.ReqLikeInfoDto;
import com.carrot.nyam.model.user.User;
import com.carrot.nyam.repository.FollowRepository;
import com.carrot.nyam.repository.LikesRepository;

@RestController
public class LikesController {
	
	@Autowired
	private LikesRepository likesRepository;
	
	@Autowired
	private FollowRepository followRepository;
	
	@GetMapping("/likeInfo/{reviewId}")
	public @ResponseBody List<ReqLikeInfoDto> likeInfo(Model model, @PathVariable int reviewId, @AuthenticationPrincipal User principal) {
		List<ReqLikeInfoDto> dtos = likesRepository.likeList(reviewId);
		
		for(ReqLikeInfoDto dto : dtos) {
			Follow follow = followRepository.findByFromUserAndToUser(principal.getId(), dto.getUserId());
			if(follow!=null) {
				dto.setFollow(true);
			}
			int followCount = followRepository.followCount(dto.getUserId());
			dto.setFollowCount(followCount);
			int followerCount = followRepository.followerCount(dto.getUserId());
			dto.setFollowerCount(followerCount);
		}
		System.out.println(dtos);
		return dtos;
	}
	
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
