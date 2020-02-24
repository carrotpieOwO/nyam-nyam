package com.carrot.nyam.model.follow.dto;

import com.carrot.nyam.model.RespCM;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReqFollowDto {
	private RespCM status;
	private int id;
	private int fromUser;
	private int toUser;
}
