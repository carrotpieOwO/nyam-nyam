package com.carrot.nyam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrot.nyam.model.ReturnCode;
import com.carrot.nyam.model.comment.dto.ReqWriteDto;
import com.carrot.nyam.model.comment.dto.RespDetailDto;
import com.carrot.nyam.model.user.User;
import com.carrot.nyam.repository.CommentRepository;


@Service
public class CommentService {
	@Autowired
	private CommentRepository commentRepository;
		
	public RespDetailDto write(ReqWriteDto dto) {
		int result = commentRepository.save(dto);
		
		if(result == 1) {
			//select 
			return commentRepository.findById(dto.getId());
		}else {
			return null;
		}
		
		
	}
	
	public List<RespDetailDto> list(int id) {
		List<RespDetailDto> respDetailDto = commentRepository.findByReviewId(id);
		return respDetailDto;
	}
	
	public int delete(int id, User principal) {
		RespDetailDto comment = commentRepository.findById(id);
		
		if(comment.getUserId()==principal.getId()) {
			return commentRepository.delete(id);	
		}else {
			return ReturnCode.권한없음;
		}
		
	}
}
