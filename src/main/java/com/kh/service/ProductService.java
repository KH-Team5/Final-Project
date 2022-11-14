package com.kh.service;

import java.util.List;

import com.kh.model.domain.CategoryDTO;
import com.kh.model.domain.Criteria;
import com.kh.model.domain.ProductDTO;

public interface ProductService {
	public List<ProductDTO> productGetList(Criteria cri);

	public int productGetTotal(Criteria cri);

	public List<CategoryDTO> categoryList();

	public List<CategoryDTO> getSubInnerCategory();

	public List<CategoryDTO> getSubPantsCategory();

	public List<CategoryDTO> getSubOuterCategory();

	public ProductDTO getProductInfo(int p_id);
}
