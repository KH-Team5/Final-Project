package com.kh.controller;


import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.model.domain.Criteria;
import com.kh.model.domain.ReviewDTO;
import com.kh.model.domain.ReviewPageDTO;
import com.kh.service.ReviewService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/review")
@RequiredArgsConstructor
public class ReviewController {

	private final ReviewService reviewService;

	@RequestMapping(value = "/enroll", method = RequestMethod.POST)
	public void enrollPOST(ReviewDTO reviewDTO) {
		reviewService.enrollReview(reviewDTO);
	}

	@RequestMapping(value = "/check", method = RequestMethod.POST)
	public String checkPOST(ReviewDTO reviewDTO) {
		return reviewService.checkReview(reviewDTO);
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ReviewPageDTO reviewListGET(Criteria criteria) {
		ReviewPageDTO result = reviewService.reviewList(criteria);
		return result;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public void updatePOST(ReviewDTO reviewDTO) {
		reviewService.updateReview(reviewDTO);
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public void deletePOST(ReviewDTO reviewDTO) {
		reviewService.deleteReview(reviewDTO);
	}
}
