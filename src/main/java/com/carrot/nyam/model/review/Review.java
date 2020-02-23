package com.carrot.nyam.model.review;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Review {
	private int id;
	private String image1;
	private String image2;
	private String image3;
	private String shopName;
	private String content;
	private int rating;
	private String price;
	private String location;
	private int userId;
	private int hits;
	private Timestamp createDate;
	private Boolean like;
	
	@Builder
	public Review(String image1, String image2, String image3, String shopName, String content, int rating,
			String price, String location, int userId, int hits, Timestamp createDate) {
		super();
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.shopName = shopName;
		this.content = content;
		this.rating = rating;
		this.price = price;
		this.location = location;
		this.userId = userId;
		this.hits = hits;
		this.createDate = createDate;
	}
	
	
	
	
}
