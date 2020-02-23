package com.carrot.nyam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrot.nyam.repository.TagRepository;

@Service
public class TagService {

	@Autowired
	private TagRepository tagRepository;

	// 글쓰기
	public int write(String tag, int reviewId) {
		try {
			return tagRepository.write(tag, reviewId);


		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();

		}
	}
	
	// 불러오기
	public List<String> tags(int reviewId){
		return tagRepository.findById(reviewId);
	}
	
	
}