package com.carrot.nyam.repository;

import com.carrot.nyam.model.review.dto.ReqWriteDto;

public interface ReviewRepository {
	public int write(String image1, String image2, String image3, String shopName, String content, int rating, String price, String location, int userId);
}
