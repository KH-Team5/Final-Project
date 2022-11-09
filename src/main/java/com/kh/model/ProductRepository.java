package com.kh.model;

import java.util.List;

import com.kh.model.domain.AttachImageDTO;
import com.kh.model.domain.CategoryDTO;
import com.kh.model.domain.Criteria;
import com.kh.model.domain.ProductDTO;

public interface ProductRepository {
	public boolean insert(ProductDTO productDTO);

	public List<ProductDTO> selectProductList(Criteria cri);

	public int getTotal(Criteria cri);

	public List<CategoryDTO> selectCategoryListSortCode();

	public List<CategoryDTO> selectInnerCategory();

	public List<CategoryDTO> selectPantsCategory();

	public List<CategoryDTO> selectOuterCategory();

	public ProductDTO selectProductInfo(int p_Id);

	public void insertImage(AttachImageDTO imageDTO);

	public List<AttachImageDTO> selectImage(int p_Id);

	int updateProductStock(ProductDTO ProductDTO);

	List<ProductDTO> selectProductListOrderByRating();
}
