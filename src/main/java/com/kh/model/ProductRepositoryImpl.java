package com.kh.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
