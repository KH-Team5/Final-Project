package com.kh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.model.ReviewRepository;
import com.kh.model.domain.Criteria;
import com.kh.model.domain.PageDTO;
import com.kh.model.domain.ReviewDTO;
import com.kh.model.domain.ReviewPageDTO;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewRepository reviewRepository;

	@Override
	public int enrollReview(ReviewDTO reviewDTO) {
		return reviewRepository.insertReview(reviewDTO);
	}

	@Override
	public String checkReview(ReviewDTO reviewDTO) {
		Integer result = reviewRepository.selectById(reviewDTO);
		if (result == null)
			return "0";
		else
			return "1";
	}

	@Override
	public ReviewPageDTO reviewList(Criteria criteria) {
		ReviewPageDTO reviewPageDTO = new ReviewPageDTO();
		reviewPageDTO.setList(reviewRepository.selectReviewList(criteria));
		reviewPageDTO.setPageInfo(new PageDTO(criteria, reviewRepository.countReviewTotal(criteria.getP_Id())));
		return reviewPageDTO;
	}
}
