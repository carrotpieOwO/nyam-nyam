package com.carrot.nyam.model.comment;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Comment {
	private int id;
	private int userId;
	private int reviewId;
	private String content;
	private Timestamp createDate;
	
	@Builder
	public Comment(int userId, int reviewId, String content, Timestamp createD, Timestamp createDate) {
		super();
		this.userId = userId;
		this.reviewId = reviewId;
		this.content = content;
		this.createDate = createDate;
	};
	

}
