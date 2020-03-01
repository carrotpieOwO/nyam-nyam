package com.carrot.nyam.repository;

import java.util.List;

import com.carrot.nyam.model.review.dto.RespListDto;
import com.carrot.nyam.model.user.User;
import com.carrot.nyam.model.user.dto.ReqJoinDto;
import com.carrot.nyam.model.user.dto.ReqLoginDto;
import com.carrot.nyam.model.user.dto.ReqRankingDto;

public interface UserRepository {
	int save(ReqJoinDto dto);
	int findByUsername(String username);
	User findByUsernameAndPassword(ReqLoginDto dto);
	User authentication(String username);
	int updateProfile(int id, String password, String address);
	int updateUserinfo(int id, String profile, String introduction, String insta, String blog);
	User findById(int id);
	List<RespListDto> findReviewAll(String username, int userId);
	List<ReqRankingDto> findUserRanking();
	

}
