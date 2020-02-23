package com.carrot.nyam.repository;

import com.carrot.nyam.model.likes.Likes;

public interface LikesRepository {
	public int like(int reviewId, int userId);
	public Likes findByUserIdAndReviewID(int reviewId, int userId);
	public int dislike(int id);
	public int likeCount(int id);
}
