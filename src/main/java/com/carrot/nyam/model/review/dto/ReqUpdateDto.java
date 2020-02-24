package com.carrot.nyam.model.review.dto;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReqUpdateDto {
	private int id;
	private String image1;
	private String image2;
	private String image3;
	private String shopName;
	private String content;
	private int rating;
	private String price;
	private String location;
	private Timestamp createDate;
	private String tag;
}
