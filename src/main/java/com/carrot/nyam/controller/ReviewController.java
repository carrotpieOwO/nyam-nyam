package com.carrot.nyam.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.carrot.nyam.Utils;
import com.carrot.nyam.model.RespCM;
import com.carrot.nyam.model.clipping.Clipping;
import com.carrot.nyam.model.follow.Follow;
import com.carrot.nyam.model.likes.Likes;
import com.carrot.nyam.model.review.dto.ReqNearbyDto;
import com.carrot.nyam.model.review.dto.ReqUpdateDto;
import com.carrot.nyam.model.review.dto.ReqWriteDto;
import com.carrot.nyam.model.review.dto.RespDetailDto;
import com.carrot.nyam.model.tag.Tag;
import com.carrot.nyam.model.user.User;
import com.carrot.nyam.repository.ClippingRepository;
import com.carrot.nyam.repository.FollowRepository;
import com.carrot.nyam.repository.LikesRepository;
import com.carrot.nyam.service.CommentService;
import com.carrot.nyam.service.ReviewService;
import com.carrot.nyam.service.TagService;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private TagService tagService;
	
	@Autowired
	private LikesRepository likesRepository;
	
	@Autowired
	private ClippingRepository clippingRepository;
	
	@Autowired
	private FollowRepository followRepository;

	@Value("${file.path}")
	private String fileRealPath;

	// 화면이동
	//메인화면/피드
	@GetMapping({ "", "/", "/review" })
	public String posts() {
		return "/review/list";
	}

	//상세보기
	@GetMapping("/review/{id}")
	public String post(Model model, @PathVariable int id, @AuthenticationPrincipal User principal) {
		RespDetailDto dto = reviewService.detail(id);
		
		//좋아요 여부 체크
		Likes like = likesRepository.findByUserIdAndReviewID(id, principal.getId());
		if(like != null) {
			dto.setLike(true);
		}
		
		//좋아요 카운트
		int likeCount = likesRepository.likeCount(id);
		dto.setLikeCount(likeCount);
		
		//북마크 추가 여부 체크
		Clipping clipping = clippingRepository.findByUserIdAndReviewID(id, principal.getId());
		if(clipping!=null) {
			dto.setClipping(true);
		}
		//팔로우 여부
		Follow follow = followRepository.findByFromUserAndToUser(principal.getId(), dto.getUserId());
		if(follow!=null) {
			dto.setFollow(true);
		}
		System.out.println(dto);

		//태그불러오기
		int reviewId = dto.getId();
	
		List<String> tags = tagService.tags(reviewId);
		
		//근처맛집 불러오기
	    List<ReqNearbyDto> locations = reviewService.locations(dto.getLocation(), id);
		  for(ReqNearbyDto location : locations) {
			  String[] loc = dto.getLocation().split("\\s");
			  location.setLocation(loc[1]+loc[2]);
			  System.out.println(loc[1]+loc[2]);
			
		  }
		System.out.println(locations);
		
		
		model.addAttribute("review",dto);
		model.addAttribute("tags", tags);
		model.addAttribute("locations", locations);
		model.addAttribute("comments",commentService.list(reviewId));
		return "/review/detail";
	}

	//리뷰작성, 인증체크필요
	@GetMapping("/review/write")
	public String write() {

		return "/review/write";
	}

	// 인증체크필요, 동일인 체크
	/*
	 * @GetMapping("/review/update/{postId}") public String update() { User
	 * principal = (User) session.getAttribute("principal");
	 * 
	 * if (principal.getId() != userId) { return "/user/login"; } return
	 * "/post/update"; }
	 */
	
	//리뷰 수정
	@GetMapping({ "/review/modify/{id}" })
	public String modify(Model model, @PathVariable int id, @AuthenticationPrincipal User principal) {
		RespDetailDto dto = reviewService.detail(id);
		List<String> tags = tagService.tags(id);
		model.addAttribute("review", dto);
		model.addAttribute("tags", tags);
		return "/review/modify";
	}
	
	// Proc
	@SuppressWarnings("unused")
	@PostMapping("/review/write")
	public @ResponseBody String write(@RequestParam MultipartFile[] images, @RequestParam String shopName, @RequestParam String content, 
			@RequestParam int rating, @RequestParam String price, @RequestParam String tags,
			@RequestParam String location, @RequestParam int userId, @AuthenticationPrincipal User principal) {

		UUID uuid = UUID.randomUUID();
		
		System.out.println(images);
		String uuidFilename1 = null;
		String uuidFilename2 = null;
		String uuidFilename3 = null;
		String uuidFilenames = null;
		List<String> lists = new ArrayList<>();
		for(int i=0; i<images.length; i++) {
			

			if(!images[i].getOriginalFilename().equals("")) {
				uuidFilenames = uuid+"_"+images[i].getOriginalFilename();
				lists.add(uuidFilenames);
				Path filePath = Paths.get(fileRealPath+uuidFilenames);
				
				try {
					Files.write(filePath, images[i].getBytes());
				}catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			System.out.println(lists.get(i));
		}
		
		switch(images.length) {
	    case 1: uuidFilename1=lists.get(0);
	         break;
	    case 2: 
	    	uuidFilename1=lists.get(0);
	    	uuidFilename2=lists.get(1);
	         break;
	    case 3: 
	    	uuidFilename1=lists.get(0);
	    	uuidFilename2=lists.get(1);
	    	uuidFilename3=lists.get(2);

	         break;
	    default: 
	         break;
	}
		
		ReqWriteDto dto = new ReqWriteDto();
		dto.setImage1(uuidFilename1);
		dto.setImage2(uuidFilename2);
		dto.setImage3(uuidFilename3);
		dto.setShopName(shopName);
		dto.setContent(content);
		dto.setRating(rating);
		dto.setPrice(price);
		dto.setLocation(location);
		dto.setUserId(userId);
		
		int result = reviewService.write(dto);
		//모델 디티오에 담기
		
		int reviewId = dto.getId();
		
		
		List<String> tagList = Utils.tagParser(tags);
		
		
		for (String tag : tagList) {
			Tag t = new Tag();
			t.setTag(tag);
			t.setReviewId(reviewId);
			tagService.write(tag, reviewId);
		}

				
		StringBuffer sb = new StringBuffer();
		if(result==1) {
			sb.append("<script>");
			sb.append("alert('작성완료');");
			sb.append("location.href='/user/mypage/"+principal.getUsername()+"';");
			sb.append("</script>");
			return sb.toString();
			
		}else {
			sb.append("<script>");
			sb.append("alert('작성실패');");
			sb.append("history.back();");
			sb.append("</script>");
			return sb.toString();
		}	
		
		
		
		
			
		}

	@PutMapping("/review/modify")
	public ResponseEntity<?> update(@RequestBody ReqUpdateDto dto) {
		int reviewId = dto.getId();
		List<String> tagList = Utils.tagParser(dto.getTag());

		tagService.delete(reviewId);
				
		for (String tag : tagList) {
			Tag t = new Tag();
			t.setTag(tag);
			t.setReviewId(reviewId);
			tagService.write(tag, reviewId);
		}
		
		int result = reviewService.update(dto);

		if (result == 1) {
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		} else if (result == -3) {
			return new ResponseEntity<RespCM>(new RespCM(403, "fail"), HttpStatus.FORBIDDEN);
		} else {
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);

		}
	}
	
	@DeleteMapping("/review/delete/{id}")
	public @ResponseBody ResponseEntity<?> delete(@PathVariable int id) {
		int result = reviewService.delete(id);
		if (result == 1) {
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		} else if (result == -3) {
			return new ResponseEntity<RespCM>(new RespCM(403, "fail"), HttpStatus.FORBIDDEN);
		} else {
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);

		}

	}

}

		
