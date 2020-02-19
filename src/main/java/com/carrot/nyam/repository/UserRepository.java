package com.carrot.nyam.repository;

import org.springframework.web.multipart.MultipartFile;

import com.carrot.nyam.model.user.User;
import com.carrot.nyam.model.user.dto.ReqJoinDto;
import com.carrot.nyam.model.user.dto.ReqLoginDto;

public interface UserRepository {
	int save(ReqJoinDto dto);
	int findByUsername(String username);
	User findByUsernameAndPassword(ReqLoginDto dto);
	User authentication(String username);
	int updateProfile(int id, String password, String address);
	int updateUserinfo(int id, String profile, String introduction, String insta, String blog);
	User findById(int id);
}
