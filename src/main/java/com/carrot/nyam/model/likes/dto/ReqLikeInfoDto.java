package com.carrot.nyam.model.likes.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReqLikeInfoDto {
	private int id;
	private int userId;
	private String username;
	private String profile;
	private int reviewId;
	private int followCount;
	private int followerCount;
	private boolean follow;
}
