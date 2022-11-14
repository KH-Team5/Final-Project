package com.kh.model;

import java.util.List;

import com.kh.model.domain.Criteria;
import com.kh.model.domain.ReviewDTO;
import com.kh.model.domain.UpdateRatingDTO;

public interface ReviewRepository {

	int insertReview(ReviewDTO reviewDTO);

	Integer selectById(ReviewDTO reviewDTO);

	List<ReviewDTO> selectReviewList(Criteria criteria);

	int countReviewTotal(int p_Id);

	int updateReview(ReviewDTO reviewDTO);

	ReviewDTO selectByR_Id(int r_Id);

	int deleteReview(int r_Id);

	double selectRatingAvg(int p_Id);

	int updateRating(UpdateRatingDTO updateRatingDTO);

}
