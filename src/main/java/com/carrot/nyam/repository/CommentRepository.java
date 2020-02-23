package com.carrot.nyam.repository;

import java.util.List;

import com.carrot.nyam.model.comment.dto.RespDetailDto;
import com.carrot.nyam.model.comment.dto.ReqWriteDto;

public interface CommentRepository {
	public int save(ReqWriteDto dto);
	public List<RespDetailDto> findByReviewId(int id);
	public RespDetailDto findById(int id);
	public int delete(int id);
}
