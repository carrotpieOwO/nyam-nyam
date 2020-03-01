package com.carrot.nyam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrot.nyam.model.review.dto.ReqAllDto;
import com.carrot.nyam.model.review.dto.ReqLikeRankingDto;
import com.carrot.nyam.model.review.dto.ReqNearbyDto;
import com.carrot.nyam.model.review.dto.ReqUpdateDto;
import com.carrot.nyam.model.review.dto.ReqWriteDto;
import com.carrot.nyam.model.review.dto.RespDetailDto;
import com.carrot.nyam.model.tag.dto.ReqSearchTagDto;
import com.carrot.nyam.model.user.dto.ReqSearchUserDto;
import com.carrot.nyam.repository.ReviewRepository;

@Service
public class ReviewService {

	@Autowired
	private ReviewRepository reviewRepository;

	// 글쓰기
	public int write(ReqWriteDto dto) {
		return reviewRepository.write(dto);
	}
	
	public RespDetailDto detail(int id) {
		return reviewRepository.findByReviewId(id);
	}
	
	public List<ReqNearbyDto> locations(String location, int id){
		return reviewRepository.findByLocation(location, id);
	}
	
	public int update(ReqUpdateDto dto) {
		return reviewRepository.update(dto);
	}
	
	public int delete(int id) {
		return reviewRepository.delete(id);
	}
	
	public List<ReqLikeRankingDto> likeRank(){
		return reviewRepository.findLikeRanking();
	}
	
	public List<ReqAllDto> findAll(){
		return reviewRepository.findAll();
	}
	
	public List<ReqAllDto> findByFollow(int userId){
		return reviewRepository.findByFollow(userId);
	}
	
	public List<ReqAllDto> sortByLocation(String location){
		return reviewRepository.SortByLocation(location);
	}
	
	public List<ReqAllDto> sortByEtc(){
		return reviewRepository.SortByEtc();
	}

	public List<ReqAllDto> findLocationByLike(String location){
		return reviewRepository.findLocationByLike(location);
	}
	
	public List<ReqAllDto> findLocationByClip(String location){
		return reviewRepository.findLocationByClip(location);
	}
	
	public List<ReqAllDto> findByCategory(String location, String category){
		return reviewRepository.findByCategory(location, category);
	}
	
	public List<ReqAllDto> findAllCategory(String category){
		return reviewRepository.findAllCategory(category);
	}
	
	public List<ReqAllDto> findEtcCategory(String category){
		return reviewRepository.findEtcCategory(category);
	}
	
	public List<ReqSearchUserDto> searchByUsername(String username){
		return reviewRepository.searchByUsername(username);
	}
	
	public List<ReqAllDto> searchByShopname (String shopName){
		return reviewRepository.searchByShopname(shopName);
	}
	
	public List<ReqSearchTagDto> searchByTag(String tag){
		return reviewRepository.searchByTag(tag);
	}
}