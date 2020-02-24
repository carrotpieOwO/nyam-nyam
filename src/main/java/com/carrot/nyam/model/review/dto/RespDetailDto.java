package com.carrot.nyam.model.review.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RespDetailDto {
	private int id;
	private String image1;
	private String image2;
	private String image3;
	private int rating;
	private String price;
	private String shopName;
	private String content;
	private String location;
	private String username;
	private String profile;
	private Timestamp createDate;
	private boolean like;
	private int likeCount;
	private boolean clipping;
	private int clippingCount;
}
