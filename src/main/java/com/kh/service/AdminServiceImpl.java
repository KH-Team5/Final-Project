package com.kh.service;

import java.util.List;

//import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.model.AdminRepository;
import com.kh.model.ProductRepository;
import com.kh.model.domain.AttachImageDTO;
import com.kh.model.domain.CategoryDTO;
import com.kh.model.domain.Criteria;
import com.kh.model.domain.MemberDTO;
//import com.kh.model.domain.Criteria;
//import com.kh.model.domain.MemberDTO;
import com.kh.model.domain.ProductDTO;
import com.kh.model.domain.userPagingDTO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private AdminRepository adminRepository;
	
	@Transactional
	@Override
	public void regProduct(ProductDTO productDTO) {
		System.out.println("AdminServiceImpl regProduct()");
		productRepository.insert(productDTO);
		if (productDTO.getImageList() == null || productDTO.getImageList().size() <= 0)
			return;
		int idx = 0;
		for (AttachImageDTO attach : productDTO.getImageList()) {
			System.out.println("regProduct() ["+(idx++)+"]productDTO.getP_Id() : " + productDTO.getP_Id());
			attach.setP_Id(productDTO.getP_Id());
			productRepository.insertImage(attach);
		}
	}

	@Override
	public int productModify(ProductDTO productDTO) {
		System.out.println("AdminServiceImpl productModify()");
		if (productDTO != null) {
			System.out.println("productDTO is not null");
			if(productDTO.getImageList() != null) System.out.println("productDTO.getImageList().size() : " + productDTO.getImageList().size());
			else System.out.println("productDTO.getImageList() is null");
		}else {
			System.out.println("productDTO is null");
		}
				
		if (productDTO.getImageList() != null & productDTO.getImageList().size() > 0) {
			System.out.println("productDTO.getImageList() is not null");
			int idx = 0;
			
			for (AttachImageDTO attach : productDTO.getImageList()) {
				System.out.println("ProductDTO() ["+(idx++)+"]productDTO.getP_Id() : " + productDTO.getP_Id() + "  " + attach.getFileName());
				attach.setP_Id(productDTO.getP_Id());
				productRepository.insertImage(attach);
			}
		}else {
			System.out.println("productDTO.getImageList() is null");
		}
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
	public MemberDTO getUserInfo(String m_Id) {
		return adminRepository.selectMemberInfo(m_Id);
	}

	@Override
	public int searchCount(String searchType, String keyword)  {
		return adminRepository.searchCount(searchType,keyword);
	}

	@Override
	public List<MemberDTO> listPageSearch(userPagingDTO vo, String searchType, String keyword) {
		return adminRepository.listPageSearch(vo,searchType,keyword);
	}

	@Override
	public int count() {
		return adminRepository.count();
	}

	@Override
	public List<MemberDTO> listPage(userPagingDTO vo) {
		return adminRepository.listPage(vo);
	}

	@Override
	public List<MemberDTO> list() {
		return adminRepository.list();
	}

	@Override
	public int userDelete(String m_Id) {
		return adminRepository.userDelete(m_Id);
	}

	@Override
	public int deleteImageAll(int p_Id) {
		return adminRepository.deleteImageAll(p_Id);
	}



}
