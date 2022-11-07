package com.kh.service;

import java.util.List;

//import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.model.AdminRepository;
import com.kh.model.ProductRepository;
import com.kh.model.domain.AttachImageDTO;
import com.kh.model.domain.Criteria;
import com.kh.model.domain.MemberDTO;
//import com.kh.model.domain.Criteria;
//import com.kh.model.domain.MemberDTO;
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
	public int productDelete(int p_Id) {
		return adminRepository.productDelete(p_Id);
	}

	@Override
	public int usersGetTotal(Criteria cri) {
		return adminRepository.getTotal(cri);
	}

	@Override
	public List<MemberDTO> userGetList(Criteria cri) {
		return adminRepository.selectMemberList(cri);
	}

	@Override
	public MemberDTO getUserInfo(String M_id) {
		return adminRepository.selectMemberInfo(M_id);
	}



}
