package com.carrot.nyam.repository;

import java.util.List;

import com.carrot.nyam.model.likes.Likes;
import com.carrot.nyam.model.likes.dto.ReqLikeInfoDto;
import com.carrot.nyam.model.likes.dto.ReqLikeMeDto;

public interface LikesRepository {
	public int like(int reviewId, int userId);
	public Likes findByUserIdAndReviewID(int reviewId, int userId);
	public int dislike(int id);
	public int likeCount(int id);
	public List<ReqLikeInfoDto> likeList(int reviewId);
	public List<ReqLikeMeDto> findByLikeMe(int userId);
}
