package com.kh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.model.ProductRepository;
import com.kh.model.domain.ProductDTO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private ProductRepository productRepository;

	@Override
	public boolean regProduct(ProductDTO productDTO) {
		return productRepository.insert(productDTO);
	}

}
