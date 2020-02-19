package com.carrot.nyam.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.carrot.nyam.model.user.User;

@Controller
public class ReviewController {

	// 화면이동
	@Autowired
	private HttpSession session;

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
		if (session.getAttribute("principal") != null) {
			return "/post/write";
		} else {
			return "redirect:/user/login";
		}
	}

	// 인증체크필요, 동일인 체크
	/*
	 * @GetMapping("/review/update/{postId}") public String update() { User
	 * principal = (User) session.getAttribute("principal");
	 * 
	 * if (principal.getId() != userId) { return "/user/login"; } return
	 * "/post/update"; }
	 */

}
