package com.kh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.model.ReviewRepository;
import com.kh.model.domain.Criteria;
import com.kh.model.domain.PageDTO;
import com.kh.model.domain.ReviewDTO;
import com.kh.model.domain.ReviewPageDTO;
import com.kh.model.domain.UpdateRatingDTO;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewRepository reviewRepository;

	@Override
	public int enrollReview(ReviewDTO reviewDTO) {
		int result = reviewRepository.insertReview(reviewDTO);
		setRating(reviewDTO.getP_Id());
		return result;
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

	@Override
	public int updateReview(ReviewDTO reviewDTO) {
		int result = reviewRepository.updateReview(reviewDTO);
		setRating(reviewDTO.getP_Id());
		return result;
	}

	@Override
	public ReviewDTO updateReviewInfo(int r_Id) {
		return reviewRepository.selectByR_Id(r_Id);
	}

	@Override
	public int deleteReview(ReviewDTO reviewDTO) {
		int result = reviewRepository.deleteReview(reviewDTO.getR_Id());
		setRating(reviewDTO.getP_Id());
		return result;
	}

	@Override
	public void setRating(int p_Id) {
		Double p_RatingAvg = reviewRepository.selectRatingAvg(p_Id);
		p_RatingAvg = (double) (Math.round(p_RatingAvg * 10));
		p_RatingAvg = p_RatingAvg / 10;
		UpdateRatingDTO updateRatingDTO = new UpdateRatingDTO();
		updateRatingDTO.setP_Id(p_Id);
		updateRatingDTO.setP_RatingAvg(p_RatingAvg);
		reviewRepository.updateRating(updateRatingDTO);
	}
}
