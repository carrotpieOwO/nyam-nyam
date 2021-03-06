package com.carrot.nyam.model.review.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReqAllDto {
	private int rank;
	private int id;
	private String image1;
	private String location;
	private String shopName;
	private String category;
	private String username;
	private String profile;
	private int likeCount;
	private int clippingCount;
}
