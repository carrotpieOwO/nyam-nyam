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
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.carrot.nyam.model.user.User;
import com.carrot.nyam.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService reviewService;

	@Value("${file.path}")
	private String fileRealPath;

	// 화면이동
	@GetMapping({ "", "/", "/review" })
	public String posts() {
		return "/review/list";
	}

	@GetMapping("/review/{id}")
	public String post() {
		return "/review/detail";
	}

	// 인증체크필요
	@GetMapping("/review/write")
	public String write() {

		return "/review/write2";
	}

	// 인증체크필요, 동일인 체크
	/*
	 * @GetMapping("/review/update/{postId}") public String update() { User
	 * principal = (User) session.getAttribute("principal");
	 * 
	 * if (principal.getId() != userId) { return "/user/login"; } return
	 * "/post/update"; }
	 */

	// Proc
	@PostMapping("/review/write")
	public @ResponseBody String write(@RequestParam MultipartFile[] images, @RequestParam String shopName, @RequestParam String content, 
			@RequestParam int rating, @RequestParam String price,
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
		
		int result = reviewService.write(uuidFilename1, uuidFilename2, uuidFilename3, shopName, content, rating, price, location, userId);
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
