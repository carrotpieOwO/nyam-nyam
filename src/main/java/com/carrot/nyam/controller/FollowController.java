package com.carrot.nyam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.carrot.nyam.model.follow.Follow;
import com.carrot.nyam.model.follow.dto.ReqFollowDto;
import com.carrot.nyam.repository.FollowRepository;

@RestController
public class FollowController {
	@Autowired
	private FollowRepository followRepository;
	
	@PostMapping("/follow")
	public @ResponseBody String follow(@RequestBody ReqFollowDto dto) {
		System.out.println(dto);
		int fromUserId = dto.getFromUser();
		int toUserId = dto.getToUser();
		Follow oldFollow = followRepository.findByFromUserAndToUser(fromUserId, toUserId);
		System.out.println(oldFollow);
		try {
			if(oldFollow==null) {
				followRepository.follow(fromUserId, toUserId);
			}else {
				followRepository.unfollow(oldFollow.getId());
			}
			return "ok";
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "fail";
	}
}
