package com.carrot.nyam.repository;

import java.util.List;

import com.carrot.nyam.model.follow.Follow;
import com.carrot.nyam.model.follow.dto.ReqFollowInfoDto;

public interface FollowRepository {
	public int follow(int fromUserId, int toUserId);
	public Follow findByFromUserAndToUser(int fromUserId, int toUserId);
	public int unfollow(int id);
	public List<ReqFollowInfoDto> followerInfo(int toUserId);
	public List<ReqFollowInfoDto> followInfo(int fromUserId);
	int followerCount(int toUserId);
	int followCount(int fromUserId);
}
