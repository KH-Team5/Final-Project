package com.kh.service;

import java.util.List;

import com.kh.model.domain.Criteria;
import com.kh.model.domain.ProductDTO;

public interface AdminService {
	public boolean regProduct(ProductDTO productDTO);

	public List<ProductDTO> productGetList(Criteria cri);

	public int productGetTotal(Criteria cri);
}
