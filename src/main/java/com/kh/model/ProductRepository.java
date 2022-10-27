package com.kh.model;

import java.util.List;

import com.kh.model.domain.CategoryDTO;
import com.kh.model.domain.Criteria;
import com.kh.model.domain.ProductDTO;

public interface ProductRepository {
	public boolean insert(ProductDTO productDTO);

	public List<ProductDTO> selectProductList(Criteria cri);

	public int getTotal(Criteria cri);

	public List<CategoryDTO> selectCategoryListSortCode();
}
