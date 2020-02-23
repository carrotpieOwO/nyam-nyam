package com.carrot.nyam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrot.nyam.model.likes.dto.ReqLikeDto;
import com.carrot.nyam.repository.LikesRepository;

@Service
public class LikeService {

	@Autowired
	private LikesRepository likesRepository;

	// 글쓰기
	public int write(int reviewId, int userId) {
		
		try {
			return likesRepository.like(reviewId,userId);

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();

		}
	}
	
	// 불러오기
//	public List<String> tags(int reviewId){
//		return tagRepository.findById(reviewId);
//	}
	
	
}