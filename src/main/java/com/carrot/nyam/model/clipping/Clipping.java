package com.carrot.nyam.model.clipping;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Clipping {
	private int id;
	private int userId;
	private int reviewId;
	private Timestamp createDate;
	
	@Builder
	public Clipping(int userId, int reviewId, Timestamp createDate) {
		super();
		this.userId = userId;
		this.reviewId = reviewId;
		this.createDate = createDate;
	}

	
}
