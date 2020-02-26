package com.carrot.nyam.model.review.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RespListDto {

	private int id;
	private String image1;
	private int rating;
	private String shopName;
	private String location;
	private int userId;
	private String username;
	private String profile;
	private String insta;
	private String blog;
	private String introduction;
	private int count;
	private int likeCount;
	private int clippingCount;
	
}
