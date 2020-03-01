package com.carrot.nyam.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.carrot.nyam.model.RespCM;
import com.carrot.nyam.model.ReturnCode;
import com.carrot.nyam.model.comment.dto.ReqCommentMeDto;
import com.carrot.nyam.model.follow.Follow;
import com.carrot.nyam.model.follow.dto.ReqFollowInfoDto;
import com.carrot.nyam.model.follow.dto.ReqFollowMeDto;
import com.carrot.nyam.model.likes.dto.ReqLikeMeDto;
import com.carrot.nyam.model.review.dto.RespListDto;
import com.carrot.nyam.model.user.User;
import com.carrot.nyam.model.user.dto.ReqJoinDto;
import com.carrot.nyam.model.user.dto.ReqProfileDto;
import com.carrot.nyam.model.user.dto.RespAlertDto;
import com.carrot.nyam.repository.ClippingRepository;
import com.carrot.nyam.repository.CommentRepository;
import com.carrot.nyam.repository.FollowRepository;
import com.carrot.nyam.repository.LikesRepository;
import com.carrot.nyam.repository.UserRepository;
import com.carrot.nyam.service.MyUserDetailService;
import com.carrot.nyam.service.UserService;

@Controller
public class UserController {
	@Value("${file.path}")
	private String fileRealPath;

	@Autowired
	private UserService userService;
	
	@Autowired
	private MyUserDetailService userDetailService;
	
	@Autowired
	private LikesRepository likesRepository;
	
	@Autowired
	private ClippingRepository clippingRepository;
	
	@Autowired
	private  UserRepository userRepository;
	
	@Autowired
	private FollowRepository followRepository;
	
	@Autowired
	private CommentRepository commentRepository;
	
	//화면이동
	@GetMapping("user/join")
	public String join() {
		return "/user/join";
	}

	@GetMapping("user/login")
	public String login() {
		return "/user/login";
	}

	  @GetMapping("user/profile/{id}") public String profile(@PathVariable int id, @AuthenticationPrincipal User principal) {		  
		  if(principal.getId()==id) {
			  return "/user/profile";
		  }else {
			  return "/user/login";
		  }
	  }
	 
	  @GetMapping("user/userinfo/{id}") public String userinfo(@PathVariable int id, @AuthenticationPrincipal User principal) {			  
			  if(principal.getId()==id) {
				  return "/user/userinfo";
			  }else {
				  return "/user/login";
			  }
		  }
	  
	  @GetMapping("user/mypage/{username}")
		public String mypage(Model model, @PathVariable String username, @AuthenticationPrincipal User principal) {
		  User user = userRepository.authentication(username);

		  List<RespListDto> dtos = userService.myPageList(username, user.getId());
		  List<String> locations = new ArrayList<>();
		  ReqFollowInfoDto followInfo = new ReqFollowInfoDto();
		 		  
		  for(RespListDto dto : dtos) {
			  String[] loc = dto.getLocation().split("\\s");
			  dto.setLocation(loc[2]);
			  int likeCount = likesRepository.likeCount(dto.getId());
			  dto.setLikeCount(likeCount);
			  int clippingCount = clippingRepository.clippingCount(user.getId());
			  dto.setClippingCount(clippingCount);
			 
		  }
		  	if(principal!=null) {
		  		Follow follow = followRepository.findByFromUserAndToUser(principal.getId(),user.getId());
		  		if(follow != null) {
					  followInfo.setFromUser(principal.getId());
					  followInfo.setToUser(user.getId());
					  followInfo.setFollow(true);
					  
				  }
		  	}
			  
			  int followCount = followRepository.followCount(user.getId());
			  int followerCount = followRepository.followerCount(user.getId());
			  followInfo.setFollowCount(followCount);
			  followInfo.setFollowerCount(followerCount);
			  
			  
			  
			  
			  System.out.println(followInfo);
		    System.out.println(dtos);
		  	model.addAttribute("user", user);
			model.addAttribute("reviews", dtos);
			model.addAttribute("followInfo",followInfo);
			
			return "/user/mypage";
		}
	
	  //알림 모달
	  @GetMapping("/user/alert")
		public @ResponseBody List<RespAlertDto> followInfo(Model model, @AuthenticationPrincipal User principal) {
			List<ReqLikeMeDto> likeDtos = likesRepository.findByLikeMe(principal.getId());
			List<ReqFollowMeDto> followDtos = followRepository.findByFollowMe(principal.getId());
			List<ReqCommentMeDto> commentDtos = commentRepository.findByCommentMe(principal.getId());
			List<RespAlertDto> dtos = new ArrayList<>();
			
	
			  for(ReqLikeMeDto likeDto : likeDtos) {
				  RespAlertDto dto = new RespAlertDto();
				  dto.setReviewId(likeDto.getReviewId());
				  dto.setUsername(likeDto.getUsername());
				  dto.setProfile(likeDto.getProfile());
				  dto.setImage1(likeDto.getImage1());
				  dto.setCreateDate(likeDto.getCreateDate());
				  dto.setLike(true);
				  dtos.add(dto);
			  }

			  for(ReqFollowMeDto followDto : followDtos) {
				  RespAlertDto dto = new RespAlertDto();
				  int userId = followDto.getFromUser();
				  Follow follow = followRepository.findByFromUserAndToUser(principal.getId(), userId);
				  dto.setFromUser(followDto.getFromUser());
				  dto.setUsername(followDto.getUsername());
				  dto.setProfile(followDto.getProfile());
				  dto.setCreateDate(followDto.getCreateDate());
				  dto.setFollowMe(true);
				  if(follow!=null) {
					  dto.setFollow(true);
				  }
				  dtos.add(dto);
			  
		  }		
			  
			  for(ReqCommentMeDto commentDto : commentDtos) {
				  RespAlertDto dto = new RespAlertDto();
				  dto.setReviewId(commentDto.getReviewId());
				  dto.setFromUser(commentDto.getFromUser());
				  dto.setToUser(commentDto.getToUser());
				  dto.setUsername(commentDto.getUsername());
				  dto.setProfile(commentDto.getProfile());
				  dto.setContent(commentDto.getContent());
				  dto.setImage1(commentDto.getImage1());
				  dto.setCreateDate(commentDto.getCreateDate());
				  dto.setCommentMe(true);
				  dtos.add(dto);
			  }
			  
		  	System.out.println(followDtos);
		  	System.out.println(likeDtos);
			System.out.println(dtos);
			return dtos;
		}
	  
	//회원가입 구현
	@PostMapping("user/join")
	public ResponseEntity<?> join(@Valid @RequestBody ReqJoinDto dto, BindingResult bindingResult) {
		if(bindingResult.hasErrors()) {
			Map<String, String> errorMap = new HashMap<>();
			
			for(FieldError error:bindingResult.getFieldErrors()) {
				errorMap.put(error.getField(), error.getDefaultMessage());
			}
			System.out.println(errorMap);
			return new ResponseEntity<Map<String,String>>(errorMap,HttpStatus.BAD_REQUEST);
		}
		
		int result = userService.join(dto);

		if(result == -2) {
			return new ResponseEntity<RespCM>(new RespCM(ReturnCode.아이디중복,"아이디중복"), HttpStatus.OK);
		}else if(result == 1) {
			return new ResponseEntity<RespCM>(new RespCM(200,"ok"), HttpStatus.OK);
		}else {
			return new ResponseEntity<RespCM>(new RespCM(500,"fail"), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	//프로필 수정(기본정보)
	@PutMapping("user/profile")
	public ResponseEntity<?> profile (@RequestBody ReqProfileDto dto, @AuthenticationPrincipal User principal) {
		int result = userService.updateProfile(dto,principal);
		
		if(result==1) {
			return new ResponseEntity<RespCM>(new RespCM(200,"ok"), HttpStatus.OK);
		}else {
			return new ResponseEntity<RespCM>(new RespCM(500,"fail"), HttpStatus.INTERNAL_SERVER_ERROR);
		}		
	}
	
	//프로필 수정(자기소개)
	@PutMapping("user/userinfo")
	public @ResponseBody String userinfo
	(@RequestParam int id, @RequestParam MultipartFile profile, @RequestParam String introduction, 
			@RequestParam String insta, @RequestParam String blog, @AuthenticationPrincipal User principal) {
		System.out.println(id);
		UUID uuid = UUID.randomUUID();
		String uuidFilename;
				
		if(!profile.getOriginalFilename().equals("")) {
			uuidFilename= uuid+"_"+profile.getOriginalFilename();
		}else {
			uuidFilename="";
		}
		
		if(!uuidFilename.equals("")) {
			Path filePath = Paths.get(fileRealPath+uuidFilename);
			try {
				Files.write(filePath, profile.getBytes());
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		int result = userService.updateUserinfo(id, uuidFilename, introduction, insta, blog, principal);
		
		StringBuffer sb = new StringBuffer();
		if(result==1) {
			sb.append("<script>");
			sb.append("alert('수정완료');");
			sb.append("location.href='/';");
			sb.append("</script>");
			return sb.toString();
			
		}else {
			sb.append("<script>");
			sb.append("alert('수정실패');");
			sb.append("history.back();");
			sb.append("</script>");
			return sb.toString();
		}		

	}

}
