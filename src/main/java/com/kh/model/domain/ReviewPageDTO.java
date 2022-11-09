package com.kh.model.domain;

import java.util.List;

import lombok.Data;

@Data
public class ReviewPageDTO {
	List<ReviewDTO> list;
	PageDTO pageInfo;
}
