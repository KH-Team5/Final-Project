package com.kh.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.model.domain.CartDTO;
import com.kh.model.domain.MemberDTO;

@Repository
public class CartRepositoryImpl implements CartRepository{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int addCart(CartDTO cart) {
		int count = sqlSession.insert("cart.insert", cart);
		return count;
	}

	@Override
	public int deleteCart(int cartId) {
		int count = sqlSession.delete("cart.delete", cartId);
		return count;
	}

	@Override
	public int modifyCount(CartDTO cart) {
		int count = sqlSession.update("cart.modifyCount", cart);
		return count;
	}

	@Override
	public List<CartDTO> getCart(String M_id) {
		
		return sqlSession.selectList("cart.getCart", M_id);
	
	}
	@Override
	public CartDTO checkCart(CartDTO cart) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cart.checkCart", cart);
	}
	

}
