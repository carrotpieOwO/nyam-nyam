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
import com.carrot.nyam.model.review.dto.ReqAllDto;
import com.carrot.nyam.model.review.dto.ReqLikeRankingDto;
import com.carrot.nyam.model.review.dto.ReqNearbyDto;
import com.carrot.nyam.model.review.dto.ReqUpdateDto;
import com.carrot.nyam.model.review.dto.ReqWriteDto;
import com.carrot.nyam.model.review.dto.RespDetailDto;
import com.carrot.nyam.model.tag.Tag;
import com.carrot.nyam.model.tag.dto.ReqSearchTagDto;
import com.carrot.nyam.model.user.User;
import com.carrot.nyam.model.user.dto.ReqRankingDto;
import com.carrot.nyam.model.user.dto.ReqSearchUserDto;
import com.carrot.nyam.repository.ClippingRepository;
import com.carrot.nyam.repository.FollowRepository;
import com.carrot.nyam.repository.LikesRepository;
import com.carrot.nyam.service.CommentService;
import com.carrot.nyam.service.ReviewService;
import com.carrot.nyam.service.TagService;
import com.carrot.nyam.service.UserService;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private UserService userService;
	
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
	//메인화면
	@GetMapping({ "", "/", "/list" })
	public String posts(Model model) {
		//유저랭킹
		List<ReqRankingDto> userRanks = userService.userRank();
		List<ReqLikeRankingDto> likeRanks = reviewService.likeRank();
		List<ReqAllDto> feeds = reviewService.findAll();
		
		for(int i=0; i<userRanks.size(); i++) {
			userRanks.get(i).setRank(i+1);
		}
		for(int i=0; i<likeRanks.size(); i++) {
			likeRanks.get(i).setRank(i+1);
			 String[] loc = likeRanks.get(i).getLocation().split("\\s");
			 likeRanks.get(i).setLocation(loc[0]);	
			 int likeCount = likesRepository.likeCount(likeRanks.get(i).getId());
			  likeRanks.get(i).setLikeCount(likeCount);
			  int clippingCount = clippingRepository.clippingCount(likeRanks.get(i).getId());
			  likeRanks.get(i).setClippingCount(clippingCount);
		}
		for(int i=0; i<feeds.size(); i++) {
			 String[] loc = feeds.get(i).getLocation().split("\\s");
			 feeds.get(i).setLocation(loc[0]);
			 int likeCount = likesRepository.likeCount(feeds.get(i).getId());
			  feeds.get(i).setLikeCount(likeCount);
			  int clippingCount = clippingRepository.clippingCount(feeds.get(i).getId());
			  feeds.get(i).setClippingCount(clippingCount);
		}
		
		
		System.out.println(likeRanks);
		model.addAttribute("userRanks", userRanks);
		model.addAttribute("likeRanks", likeRanks);
		model.addAttribute("feeds", feeds);
		return "/review/list";
	}

	//메인화면-타임라인
		@GetMapping("/list/{userId}")
		public @ResponseBody List<ReqAllDto> feeds(@PathVariable int userId ) {
			List<ReqAllDto> feeds = reviewService.findByFollow(userId);
			
			for(int i=0; i<feeds.size(); i++) {
				 String[] loc = feeds.get(i).getLocation().split("\\s");
				 feeds.get(i).setLocation(loc[0]);		
			}
			
			
			return feeds;
		}
		
	//메인화면-지역별보기
		@GetMapping("/list/location/{location}")
		public @ResponseBody List<ReqAllDto> locations (@PathVariable String location ) {
			
			switch (location){
		    case "seoul" :
		        location = "서울";
		        break;
		    case "daejeon" :
		        location = "대전";
		        break;
		    case "daegu" :
		        location = "대구";
		        break;
		    case "busan" :
		        location = "부산";
		        break;
		    default :
		        location = "etc";
			}
			
		    System.out.println(location);

			List<ReqAllDto> locations = reviewService.sortByLocation(location);
			
			for(int i=0; i<locations.size(); i++) {
				 String[] loc = locations.get(i).getLocation().split("\\s");
				 locations.get(i).setLocation(loc[2]);	
			}
			
			return locations;
		}
		
		//메인화면-ETC 분류
	@GetMapping("/list/location/etc")
	public @ResponseBody List<ReqAllDto> locEtc () {
		
		List<ReqAllDto> locations = reviewService.sortByEtc();
		
		for(int i=0; i<locations.size(); i++) {
			 String[] loc = locations.get(i).getLocation().split("\\s");
			 locations.get(i).setLocation(loc[1]);	
		}
		
		return locations;
	}
	
	//메인화면-지역별보기-좋아요순
			@GetMapping("/list/like/{location}")
			public @ResponseBody List<ReqAllDto> locationByLike (@PathVariable String location ) {
				
				switch (location){
			    case "seoul" :
			        location = "서울";
			        break;
			    case "daejeon" :
			        location = "대전";
			        break;
			    case "daegu" :
			        location = "대구";
			        break;
			    case "busan" :
			        location = "부산";
			        break;
			    default :
			        location = "etc";
				}
				
			    System.out.println(location);

				List<ReqAllDto> locations = reviewService.findLocationByLike(location);
				
				for(int i=0; i<locations.size(); i++) {
					 String[] loc = locations.get(i).getLocation().split("\\s");
					 locations.get(i).setLocation(loc[2]);	
				}
				
				return locations;
			}
			
			//메인화면-지역별보기-보관순
			@GetMapping("/list/clip/{location}")
			public @ResponseBody List<ReqAllDto> locationByClip (@PathVariable String location ) {
				
				switch (location){
			    case "seoul" :
			        location = "서울";
			        break;
			    case "daejeon" :
			        location = "대전";
			        break;
			    case "daegu" :
			        location = "대구";
			        break;
			    case "busan" :
			        location = "부산";
			        break;
			    default :
			        location = "etc";
				}
				
			    System.out.println(location);

				List<ReqAllDto> locations = reviewService.findLocationByClip(location);
				
				for(int i=0; i<locations.size(); i++) {
					 String[] loc = locations.get(i).getLocation().split("\\s");
					 locations.get(i).setLocation(loc[2]);	
				}
				
				return locations;
			}
		
			//메인화면-지역별보기-카테고리
			@GetMapping("/list/category/{location}/{category}")
			public @ResponseBody List<ReqAllDto> locationByCategory (@PathVariable String location, @PathVariable String category  ) {
	
				switch (location){
			    case "seoul" :
			        location = "서울";
			        break;
			    case "daejeon" :
			        location = "대전";
			        break;
			    case "daegu" :
			        location = "대구";
			        break;
			    case "busan" :
			        location = "부산";
			        break;
			    default :
			        location = "etc";
				}
				
				switch(category) {
				case "cafe" : category = "카페"; break;
				case "restorant" : category = "음식점"; break;
				default : break;
				}
				
				List<ReqAllDto> locations = new ArrayList<>();
				if(location == "etc") {
					locations = reviewService.findEtcCategory(category);
					for(int i=0; i<locations.size(); i++) {
						 String[] loc = locations.get(i).getLocation().split("\\s");
						 locations.get(i).setLocation(loc[1]);	
					}
				}else {
					locations = reviewService.findByCategory(location, category);
					for(int i=0; i<locations.size(); i++) {
						 String[] loc = locations.get(i).getLocation().split("\\s");
						 locations.get(i).setLocation(loc[2]);	
					}
				}
				
				
				
				
				return locations;
			}
			
			//메인화면-카테고리
			@GetMapping("/list/category/{category}")
			public @ResponseBody List<ReqAllDto> locationAllCategory (@PathVariable String category  ) {
				switch(category) {
				case "cafe" : category = "카페"; break;
				case "restorant" : category = "음식점"; break;
				default : break;
				}
				
				List<ReqAllDto> dtos = reviewService.findAllCategory(category);
				
				for(int i=0; i<dtos.size(); i++) {
					 String[] loc = dtos.get(i).getLocation().split("\\s");
					 dtos.get(i).setLocation(loc[2]);	
				}
				
				return dtos;
			}

	//검색
			@GetMapping("/search")
			public String search (Model model, @RequestParam String searchMenu, @RequestParam String searchContent) {
				
				if (searchMenu.equals("장소")) {
					List<ReqAllDto> places = reviewService.searchByShopname(searchContent);
					for(ReqAllDto place : places) {
						  String[] loc = place.getLocation().split("\\s");
						  place.setLocation(loc[1]+loc[2]);
						  int likeCount = likesRepository.likeCount(place.getId());
						  place.setLikeCount(likeCount);
						  int clippingCount = clippingRepository.clippingCount(place.getId());
						  place.setClippingCount(clippingCount);
					  }
					System.out.println();
					model.addAttribute("searchContent",searchContent);
					model.addAttribute("places",places);
					return "search/places";
				}
				
				if (searchMenu.equals("유저명")) {
					List<ReqSearchUserDto> users = reviewService.searchByUsername(searchContent);
					model.addAttribute("users", users);
					model.addAttribute("searchContent",searchContent);
					System.out.println(users);
					return "search/users";
				}
				
				if(searchMenu.equals("태그")) {
					List<Tag> tagKeywords = reviewService.selectDistinctTag(searchContent);
					List<ReqSearchTagDto> tags = reviewService.searchByTag(searchContent);
					for(ReqSearchTagDto tag : tags) {
						  String[] loc = tag.getLocation().split("\\s");
						  tag.setLocation(loc[0]);
						  int likeCount = likesRepository.likeCount(tag.getId());
						  tag.setLikeCount(likeCount);
						  int clippingCount = clippingRepository.clippingCount(tag.getId());
						  tag.setClippingCount(clippingCount);
					  }
					model.addAttribute("searchContent",searchContent);
					model.addAttribute("tagKeywords", tagKeywords);
					model.addAttribute("tags", tags);
					System.out.println(tags);
					return "search/tags";
				}
				return "/";
	
			}
			
	//상세보기
	@GetMapping("/review/{id}")
	public String post(Model model, @PathVariable int id, @AuthenticationPrincipal User principal) {
		RespDetailDto dto = reviewService.detail(id);
		System.out.println("shopName:"+dto.getShopName());
		//좋아요 여부 체크
		if(principal != null) {
			Likes like = likesRepository.findByUserIdAndReviewID(id, principal.getId());
			if(like != null) {
				dto.setLike(true);
			}
			
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
		}
		
		//좋아요 카운트
		int likeCount = likesRepository.likeCount(id);
		dto.setLikeCount(likeCount);
		
		
		
		System.out.println(dto);

		//태그불러오기
		int reviewId = dto.getId();
	
		List<String> tags = tagService.tags(reviewId);
		
		//근처맛집 불러오기
		String shopName = dto.getShopName();
		
		String[] locations = dto.getLocation().split("\\s");
		String location = locations[1]+" "+locations[2];
		System.out.println("로케이션: "+location);
		
	    List<ReqNearbyDto> nearDtos = reviewService.locations(location, shopName);
		System.out.println(nearDtos);
		
		/*
		 * for(ReqNearbyDto nearDto : nearDtos) {
		 * 
		 * System.out.println("샵네임:"+shopName); String[] loc =
		 * dto.getLocation().split("\\s"); location.setLocation(loc[1]+loc[2]);
		 * location.setShopName(shopName); System.out.println(loc[1]+loc[2]);
		 * System.out.println(location);
		 * 
		 * }
		 */
		System.out.println(locations);
		
		
		model.addAttribute("review",dto);
		model.addAttribute("tags", tags);
		model.addAttribute("nearDtos", nearDtos);
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
	public @ResponseBody String write(@RequestParam MultipartFile image1, @RequestParam MultipartFile image2, @RequestParam MultipartFile image3, @RequestParam String shopName, @RequestParam String content, 
			@RequestParam int rating, @RequestParam String price, @RequestParam String tags,
			@RequestParam String location, @RequestParam int userId, @RequestParam String category, @AuthenticationPrincipal User principal) {

		
		System.out.println("이미지:"+image1);
		System.out.println("이미지:"+image2);
		System.out.println("이미지:"+image3);
		
		UUID uuid = UUID.randomUUID();
		
		String uuidFilename1 = "";
		String uuidFilename2 = "";
		String uuidFilename3 = "";
		//String uuidFilenames = null;
		
		List<MultipartFile> images = new ArrayList<>();
		if(!image1.getOriginalFilename().equals("")) {
			images.add(image1);
		}
		if(!image2.getOriginalFilename().equals("")) {
			images.add(image2);
		}
		if(!image3.getOriginalFilename().equals("")) {
			images.add(image3);	
		}
		
		
		List<String> uuidFilenames = new ArrayList<>();

		for(int i=0; i<images.size(); i++) {	
			System.out.println(images.get(i).getOriginalFilename());
			if(images.get(i).getOriginalFilename()!=null || !images.get(i).getOriginalFilename().equals("")) {
				uuidFilenames.add (uuid+"_"+images.get(i).getOriginalFilename());
				Path filePath = Paths.get(fileRealPath+uuidFilenames.get(i));
				
				try {
					Files.write(filePath, images.get(i).getBytes());
				}catch (IOException e) {
					e.printStackTrace();
				}
			}else {
				continue;
			}
			
		}
		
			System.out.println("파일이름사이즈: "+uuidFilenames.size());
			
		ReqWriteDto dto = new ReqWriteDto();
		
		if(uuidFilenames.size()==1) {
			System.out.println("여기옴?");
			dto.setImage1(uuidFilenames.get(0));
			dto.setImage2("");
			dto.setImage3("");
		}else if(uuidFilenames.size()==2) {
			dto.setImage1(uuidFilenames.get(0));
			dto.setImage2(uuidFilenames.get(1));
			dto.setImage3("");
		}else if(uuidFilenames.size()==3) {
			dto.setImage1(uuidFilenames.get(0));
			dto.setImage2(uuidFilenames.get(1));
			dto.setImage3(uuidFilenames.get(2));
		}
		
		dto.setShopName(shopName);
		dto.setContent(content);
		dto.setRating(rating);
		dto.setPrice(price);
		dto.setLocation(location);
		dto.setUserId(userId);
		dto.setCategory(category);
		
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

		
