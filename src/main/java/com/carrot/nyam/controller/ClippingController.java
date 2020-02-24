package com.carrot.nyam.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.carrot.nyam.model.clipping.Clipping;
import com.carrot.nyam.model.clipping.dto.ReqClipDto;
import com.carrot.nyam.model.review.dto.RespDetailDto;
import com.carrot.nyam.repository.ClippingRepository;
import com.carrot.nyam.repository.LikesRepository;
import com.carrot.nyam.service.ReviewService;

@RestController
public class ClippingController {
	@Autowired
	private ClippingRepository clippingRepository;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private LikesRepository likesRepository;
	
	 @SuppressWarnings("null")
	@GetMapping("user/clipping/{userId}")
		public @ResponseBody List<RespDetailDto> mypage(Model model, @PathVariable int userId) {
		  List<Clipping> clippings = clippingRepository.findByUserId(userId);
		  System.out.println(clippings);
		  List<RespDetailDto> dtos = new ArrayList<>();
		  
		  
		  
		  for(Clipping clipping : clippings) {
			  RespDetailDto dto = reviewService.detail(clipping.getReviewId());
			  String[] loc = dto.getLocation().split("\\s");
			  dto.setLocation(loc[2]);
			  int likeCount = likesRepository.likeCount(dto.getId());
			  dto.setLikeCount(likeCount);
			  int clippingCount = clippingRepository.clippingCount(dto.getId());
			  dto.setClippingCount(clippingCount);
			  
			  System.out.println(dto);
			  
			  dtos.add(dto);
		  }
		    
		  	model.addAttribute("dtos", clippings);

			return dtos;
		}
	
	@PostMapping("/clipping/{reviewId}")
	public @ResponseBody String like(@RequestBody ReqClipDto dto) {
		int reviewId = dto.getReviewId();
		int userId = dto.getUserId();
		System.out.println(dto);
		Clipping oldClip = clippingRepository.findByUserIdAndReviewID(reviewId, userId);
		System.out.println(oldClip);
		
		try {
			if(oldClip==null) {
				clippingRepository.clipping(reviewId, userId);
			}else {
				clippingRepository.unClipping(oldClip.getId());
			}
				return "ok";
		}catch (Exception e){
			e.printStackTrace();
		}
		return "fail";
	}
}
