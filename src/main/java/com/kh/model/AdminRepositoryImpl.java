package com.kh.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.model.domain.ProductDTO;

@Repository
public class AdminRepositoryImpl implements AdminRepository {
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public int productModify(ProductDTO productDTO) {
		int count = sqlSession.update("admin.modify", productDTO);
		return count;
	
	}


	@Override
	public int productDelete1(int p_Id) {
		int count = sqlSession.delete("admin.delete1",p_Id);
		return count;
	}


	@Override
	public int productDelete2(int p_Id) {
		int count = sqlSession.delete("admin.delete2",p_Id);
		return count;
	}

}
