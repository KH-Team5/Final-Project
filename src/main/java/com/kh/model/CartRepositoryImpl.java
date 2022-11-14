package com.kh.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.model.domain.CartDTO;

@Repository
public class CartRepositoryImpl implements CartRepository {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertCart(CartDTO cartDTO) {
		return sqlSession.insert("cart.insertCart", cartDTO);
	}

	@Override
	public int deleteCart(int ca_Id) {
		return sqlSession.delete("cart.deleteCart", ca_Id);
	}

	@Override
	public int updateCartp_Cnt(CartDTO cartDTO) {
		return sqlSession.update("cart.updateCartp_Cnt", cartDTO);
	}

	@Override
	public List<CartDTO> selectCartInfo(String m_Id) {
		return sqlSession.selectList("cart.selectCartInfo", m_Id);
	}

	@Override
	public CartDTO selectCartChk(CartDTO cartDTO) {
		return sqlSession.selectOne("cart.selectCartChk", cartDTO);
	}

	@Override
	public int deleteOrderCart(CartDTO cartDTO) {
		return sqlSession.delete("cart.deleteOrderCart", cartDTO);
	}

}
