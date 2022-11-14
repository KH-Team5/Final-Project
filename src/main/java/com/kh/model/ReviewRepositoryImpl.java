package com.kh.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.model.domain.Criteria;
import com.kh.model.domain.ReviewDTO;
import com.kh.model.domain.UpdateRatingDTO;

@Repository
public class ReviewRepositoryImpl implements ReviewRepository {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertReview(ReviewDTO reviewDTO) {
		return sqlSession.insert("review.insertReview", reviewDTO);
	}

	@Override
	public Integer selectById(ReviewDTO reviewDTO) {
		return sqlSession.selectOne("review.selectById", reviewDTO);
	}

	@Override
	public List<ReviewDTO> selectReviewList(Criteria criteria) {
		return sqlSession.selectList("review.selectReviewList", criteria);
	}

	@Override
	public int countReviewTotal(int p_Id) {
		return sqlSession.selectOne("review.countReviewTotal", p_Id);
	}

	@Override
	public int updateReview(ReviewDTO reviewDTO) {
		return sqlSession.update("review.updateReview", reviewDTO);
	}

	@Override
	public ReviewDTO selectByR_Id(int r_Id) {
		return sqlSession.selectOne("review.selectByR_Id", r_Id);
	}

	@Override
	public int deleteReview(int r_Id) {
		return sqlSession.delete("review.deleteReview", r_Id);
	}

	@Override
	public double selectRatingAvg(int p_Id) {
		Double p_RatingAvg = sqlSession.selectOne("review.selectRatingAvg", p_Id);
		if (p_RatingAvg == null)
			p_RatingAvg = 0.0;
		return p_RatingAvg;
	}

	@Override
	public int updateRating(UpdateRatingDTO updateRatingDTO) {
		return sqlSession.update("review.updateRating", updateRatingDTO);
	}
}
