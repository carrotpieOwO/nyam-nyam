package com.carrot.nyam.repository;

import java.util.List;

import com.carrot.nyam.model.review.dto.ReqNearbyDto;
import com.carrot.nyam.model.review.dto.ReqUpdateDto;
import com.carrot.nyam.model.review.dto.ReqWriteDto;
import com.carrot.nyam.model.review.dto.RespDetailDto;

public interface ReviewRepository {
	public int write(ReqWriteDto dto);
	public  RespDetailDto findByReviewId(int id);
	public List<ReqNearbyDto> findByLocation(String location, int id);
	public int update(ReqUpdateDto dto);
	public int delete(int id);
}
