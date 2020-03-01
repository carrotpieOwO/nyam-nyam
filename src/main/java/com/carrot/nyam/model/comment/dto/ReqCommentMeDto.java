package com.carrot.nyam.model.comment.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReqCommentMeDto {
	private int id;
	private int reviewId;
	private int fromUser;
	private String content;
	private String username;
	private String profile;
	private int toUser;
	private String image1;
	private Timestamp createDate;
}
