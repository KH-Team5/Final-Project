package com.kh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.model.AdminRepository;
import com.kh.model.ProductRepository;
import com.kh.model.domain.AttachImageDTO;
import com.kh.model.domain.ProductDTO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private AdminRepository adminRepository;
	
	@Transactional
	@Override
	public void regProduct(ProductDTO productDTO) {
		productRepository.insert(productDTO);
		if (productDTO.getImageList() == null || productDTO.getImageList().size() <= 0)
			return;
		for (AttachImageDTO attach : productDTO.getImageList()) {
			attach.setP_Id(productDTO.getP_Id());
			productRepository.insertImage(attach);
		}
	}

	@Override
	public int productModify(ProductDTO productDTO) {
		return adminRepository.productModify(productDTO);
	}

	@Override
	public int productDelete(String P_id) {
		return 0;
	}

}
