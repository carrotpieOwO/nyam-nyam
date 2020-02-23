package com.carrot.nyam.repository;

import java.util.List;

public interface TagRepository {
	public int write(String tag, int reviewId);
	public List<String> findById(int reviewId);

}
