package com.carrot.nyam.model.tag;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Tag {
	private int id;
	private String tag;
	private int userId;
	private int reviewId;
	private Timestamp createDate;
	
	@Builder
	public Tag(String tag, int userId, int reviewId, Timestamp createDate) {
		super();
		this.tag = tag;
		this.userId = userId;
		this.reviewId = reviewId;
		this.createDate = createDate;
	}

	
}
