package com.carrot.nyam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrot.nyam.model.review.dto.ReqWriteDto;
import com.carrot.nyam.repository.ReviewRepository;

@Service
public class ReviewService {

	@Autowired
	private ReviewRepository reviewRepository;

	// 글쓰기
	public int write(String image1, String image2, String image3, String shopName, String Content, int rating, String prce, String location, int userId) {
		return reviewRepository.write(image1, image2, image3, shopName, Content, rating, prce, location, userId);
	}
	
	
}