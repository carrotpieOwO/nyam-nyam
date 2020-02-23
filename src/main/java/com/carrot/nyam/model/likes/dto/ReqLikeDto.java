package com.carrot.nyam.model.likes.dto;

import com.carrot.nyam.model.RespCM;
import com.carrot.nyam.model.comment.dto.ReqWriteDto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReqLikeDto {
	private RespCM status;
	private int id;
	private int userId;
	private int reviewId;

}
