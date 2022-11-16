package com.kh.controller;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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

	@PostMapping
	public void enrollPOST(ReviewDTO reviewDTO) {
		reviewService.enrollReview(reviewDTO);
	}

	@GetMapping
	public String checkPOST(ReviewDTO reviewDTO) {
		return reviewService.checkReview(reviewDTO);
	}

	@GetMapping("/list")
	public ReviewPageDTO reviewListGET(Criteria criteria) {
		ReviewPageDTO result = reviewService.reviewList(criteria);
		return result;
	}

	@PutMapping("/{r_Id}")
	public void updatePOST(@RequestBody ReviewDTO reviewDTO) {
		reviewService.updateReview(reviewDTO);
	}

	@DeleteMapping("/{r_Id}")
	public void deletePOST(@PathVariable int r_Id) {
		reviewService.deleteReview(r_Id);
	}
}
