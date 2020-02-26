package com.carrot.nyam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.carrot.nyam.model.ReturnCode;
import com.carrot.nyam.model.review.dto.RespListDto;
import com.carrot.nyam.model.user.User;
import com.carrot.nyam.model.user.dto.ReqJoinDto;
import com.carrot.nyam.model.user.dto.ReqLoginDto;
import com.carrot.nyam.model.user.dto.ReqProfileDto;
import com.carrot.nyam.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private MyUserDetailService userDetailService;

	// 회원가입
	@Transactional
	public int join(ReqJoinDto dto) {
		try {
			int result = userRepository.findByUsername(dto.getUsername());

			if (result == 1) {
				return ReturnCode.아이디중복;
			} else {
				String encodePassword = passwordEncoder.encode(dto.getPassword());
				dto.setPassword(encodePassword);
				return userRepository.save(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();

		}
	}

	// 테스트 해보고 지우기
	public User login(ReqLoginDto dto) {
		return userRepository.findByUsernameAndPassword(dto);
	}

	// 프로필수정(기본정보)
	public int updateProfile(ReqProfileDto dto, User principal) {
		String encodePassword = passwordEncoder.encode(dto.getPassword());
		try {
			int result = userRepository.updateProfile(dto.getId(), encodePassword, dto.getAddress());

			if (result == 1) {
				principal.setPassword(encodePassword);
				principal.setAddress(dto.getAddress());
				return 1;
			} else {
				return -1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
		
	}

	// 프로필수정(자기소개)
	public int updateUserinfo(int id, String profile, String introduction, String insta, String blog, User principal) {
		int result = userRepository.updateUserinfo(id, profile, introduction, insta, blog);

		if (result == 1) {
			principal.setProfile(profile);
			principal.setIntroduction(introduction);
			principal.setInsta(insta);
			principal.setBlog(blog);
			return 1;
		} else {
			return -1;
		}

	}
	
	//마이페이지 리스트
	public List<RespListDto> myPageList(String username, int userId){
		return userRepository.findReviewAll(username, userId);
	}
	

	
	
}