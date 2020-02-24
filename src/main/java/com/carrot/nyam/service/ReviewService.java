package com.carrot.nyam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrot.nyam.model.review.dto.ReqNearbyDto;
import com.carrot.nyam.model.review.dto.ReqUpdateDto;
import com.carrot.nyam.model.review.dto.ReqWriteDto;
import com.carrot.nyam.model.review.dto.RespDetailDto;
import com.carrot.nyam.repository.ReviewRepository;

@Service
public class ReviewService {

	@Autowired
	private ReviewRepository reviewRepository;

	// 글쓰기
	public int write(ReqWriteDto dto) {
		return reviewRepository.write(dto);
	}
	
	public RespDetailDto detail(int id) {
		return reviewRepository.findByReviewId(id);
	}
	
	public List<ReqNearbyDto> locations(String location, int id){
		return reviewRepository.findByLocation(location, id);
	}
	
	public int update(ReqUpdateDto dto) {
		return reviewRepository.update(dto);
	}
	
	public int delete(int id) {
		return reviewRepository.delete(id);
	}

}