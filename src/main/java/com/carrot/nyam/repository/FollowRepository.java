package com.carrot.nyam.repository;

import com.carrot.nyam.model.follow.Follow;

public interface FollowRepository {
	public int follow(int fromUserId, int toUserId);
	public Follow findByFromUserAndToUser(int fromUserId, int toUserId);
	public int unfollow(int id);

}
