package com.carrot.nyam.model.review;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Review {
	private int id;
	private String images;
	private String shopName;
	private String content;
	private String price;
	private String location;
	private int userId;
	private int hits;
	private Timestamp createDate;
	
	@Builder
	public Review(String images, String shopName, String content, String price, String location, int userId, int hits,
			Timestamp createDate) {
		super();
		this.images = images;
		this.shopName = shopName;
		this.content = content;
		this.price = price;
		this.location = location;
		this.userId = userId;
		this.hits = hits;
		this.createDate = createDate;
	}
	
	
}
