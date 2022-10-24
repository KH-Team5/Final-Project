package com.kh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.model.ProductRepository;
import com.kh.model.domain.Criteria;
import com.kh.model.domain.ProductDTO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private ProductRepository productRepository;

	@Override
	public boolean regProduct(ProductDTO productDTO) {
		return productRepository.insert(productDTO);
	}

	@Override
	public List<ProductDTO> productGetList(Criteria cri) {
		return productRepository.selectProductList(cri);
	}

	@Override
	public int productGetTotal(Criteria cri) {
		return productRepository.getTotal(cri);
	}
}
