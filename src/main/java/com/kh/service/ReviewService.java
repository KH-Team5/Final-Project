package com.kh.service;

import com.kh.model.domain.Criteria;
import com.kh.model.domain.ReviewDTO;
import com.kh.model.domain.ReviewPageDTO;

public interface ReviewService {
	public int enrollReview(ReviewDTO reviewDTO);

	String checkReview(ReviewDTO reviewDTO);

	ReviewPageDTO reviewList(Criteria criteria);
}
