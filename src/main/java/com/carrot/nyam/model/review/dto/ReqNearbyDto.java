package com.carrot.nyam.model.review.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReqNearbyDto {
	private int id;
	private String image1;
	private int rating;
	private String shopName;
	private String location;
	private String username;
	private int count;
}
