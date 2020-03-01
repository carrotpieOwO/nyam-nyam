package com.carrot.nyam.repository;

import java.util.List;

import com.carrot.nyam.model.review.dto.ReqAllDto;
import com.carrot.nyam.model.review.dto.ReqLikeRankingDto;
import com.carrot.nyam.model.review.dto.ReqNearbyDto;
import com.carrot.nyam.model.review.dto.ReqUpdateDto;
import com.carrot.nyam.model.review.dto.ReqWriteDto;
import com.carrot.nyam.model.review.dto.RespDetailDto;
import com.carrot.nyam.model.tag.dto.ReqSearchTagDto;
import com.carrot.nyam.model.user.dto.ReqSearchUserDto;

public interface ReviewRepository {
	public int write(ReqWriteDto dto);
	public  RespDetailDto findByReviewId(int id);
	public List<ReqNearbyDto> findByLocation(String location, int id);
	public int update(ReqUpdateDto dto);
	public int delete(int id);
	public List<ReqLikeRankingDto> findLikeRanking();
	public List<ReqAllDto> findAll();
	public List<ReqAllDto> findByFollow(int userId);
	public List<ReqAllDto> SortByLocation(String location);
	public List<ReqAllDto> SortByEtc();
	public List<ReqAllDto> findLocationByLike(String location);
	public List<ReqAllDto> findLocationByClip(String location);
	public List<ReqAllDto> findByCategory(String location, String category);
	public List<ReqAllDto> findAllCategory(String category);
	public List<ReqAllDto> findEtcCategory(String category);
	public List<ReqSearchUserDto> searchByUsername(String username);
	public List<ReqAllDto> searchByShopname(String shopName);
	public List<ReqSearchTagDto> searchByTag(String tag);
}
