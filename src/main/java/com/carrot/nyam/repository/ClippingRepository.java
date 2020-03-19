package com.carrot.nyam.repository;

import java.util.List;

import com.carrot.nyam.model.clipping.Clipping;

public interface ClippingRepository {
	public int clipping (int reviewId, int userId);
	public Clipping findByUserIdAndReviewID(int reviewId, int userId);
	public int unClipping(int id);
	public int clippingCount(int reviewId);
	public int myClippingCount(int userId);
	public List<Clipping> findByUserId(int userId);
}
