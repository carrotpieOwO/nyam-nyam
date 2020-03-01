package com.carrot.nyam.model.likes.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReqLikeMeDto {
	private int id;
	private int reviewId;
	private String username;
	private String profile;
	private String image1;
	private Timestamp createDate;
}
