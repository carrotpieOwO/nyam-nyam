package com.carrot.nyam.repository;

import java.util.List;

import com.carrot.nyam.model.comment.dto.ReqCommentMeDto;
import com.carrot.nyam.model.comment.dto.ReqWriteDto;
import com.carrot.nyam.model.comment.dto.RespDetailDto;

public interface CommentRepository {
	public int save(ReqWriteDto dto);
	public List<RespDetailDto> findByReviewId(int id);
	public RespDetailDto findById(int id);
	public int delete(int id);
	public List<ReqCommentMeDto> findByCommentMe(int userId);
}
