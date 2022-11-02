package com.kh.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.model.domain.AttachImageDTO;
import com.kh.model.domain.CategoryDTO;
import com.kh.model.domain.Criteria;
import com.kh.model.domain.ProductDTO;

@Repository
public class ProductRepositoryImpl implements ProductRepository {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean insert(ProductDTO productDTO) {
		int count = sqlSession.insert("product.insert", productDTO);
		if (count == 1)
			return true;
		else
			return false;
	}

	@Override
	public List<ProductDTO> selectProductList(Criteria cri) {
		return sqlSession.selectList("product.selectProductList", cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return sqlSession.selectOne("product.getTotal", cri);
	}

	@Override
	public List<CategoryDTO> selectCategoryListSortCode() {
		return sqlSession.selectList("selectCategoryListSortCode");
	};

	@Override
	public List<CategoryDTO> selectInnerCategory() {
		return sqlSession.selectList("selectInnerCategory");
	}

	@Override
	public List<CategoryDTO> selectPantsCategory() {
		return sqlSession.selectList("selectPantsCategory");
	}

	@Override
	public List<CategoryDTO> selectOuterCategory() {
		return sqlSession.selectList("selectOuterCategory");
	}

	@Override
	public ProductDTO selectProductInfo(int p_Id) {
		ProductDTO productDTO = sqlSession.selectOne("selectProductInfo", p_Id);
		productDTO.setImageList(sqlSession.selectList("selectImage", p_Id));
		return productDTO;
	}

	@Override
	public void insertImage(AttachImageDTO imageDTO) {
		sqlSession.insert("product.insertImage", imageDTO);
	}

	@Override
	public List<AttachImageDTO> selectImage(int p_Id) {
		return sqlSession.selectList("product.selectImage", p_Id);
	}

	@Override
	public int updateProductStock(ProductDTO ProductDTO) {
		return sqlSession.update("product.updateProductStock", ProductDTO);
	}
}
