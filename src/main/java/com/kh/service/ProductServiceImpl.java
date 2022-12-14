package com.kh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.model.ProductRepository;
import com.kh.model.domain.AttachImageDTO;
import com.kh.model.domain.CategoryDTO;
import com.kh.model.domain.Criteria;
import com.kh.model.domain.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductRepository productRepository;

	@Override
	public List<ProductDTO> productGetList(Criteria cri) {
		List<ProductDTO> products = productRepository.selectProductList(cri);
		for (ProductDTO productDTO : products) {
			List<AttachImageDTO> imageList = productRepository.selectImage(productDTO.getP_Id());
			productDTO.setImageList(imageList);
		}
		return products;
	}

	@Override
	public int productGetTotal(Criteria cri) {
		return productRepository.getTotal(cri);
	}

	@Override
	public List<CategoryDTO> categoryList() {
		return productRepository.selectCategoryListSortCode();
	}

	@Override
	public List<CategoryDTO> getSubInnerCategory() {
		return productRepository.selectInnerCategory();
	}

	@Override
	public List<CategoryDTO> getSubPantsCategory() {
		return productRepository.selectPantsCategory();
	}

	@Override
	public List<CategoryDTO> getSubOuterCategory() {
		return productRepository.selectOuterCategory();
	}

	@Override
	public ProductDTO getProductInfo(int p_Id) {
		return productRepository.selectProductInfo(p_Id);
	}
	
	@Override
	public List<ProductDTO> selectProductListOrderByRating() {
		List<ProductDTO> products = productRepository.selectProductListOrderByRating();
		for (ProductDTO productDTO : products) {
			List<AttachImageDTO> imageList = productRepository.selectImage(productDTO.getP_Id());
			productDTO.setImageList(imageList);
		}
		return products;
	}

}
