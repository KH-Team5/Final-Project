package com.kh.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.model.domain.OrderDTO;
import com.kh.model.domain.OrderItemDTO;

@Repository
public class OrderRepositoryImpl implements OrderRepository {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public OrderItemDTO selectByp_Id(int p_Id) {
		return sqlSession.selectOne("order.selectByp_Id", p_Id);
	}

	@Override
	public OrderItemDTO selectBym_Id(int m_Id) {
		return sqlSession.selectOne("order.selectBym_Id", m_Id);
	}

	@Override
	public int insertOrder(OrderDTO orderDTO) {
		return sqlSession.insert("order.insertOrder", orderDTO);
	}

	@Override
	public int insertOrderItem(OrderItemDTO orderItemDTO) {
		return sqlSession.insert("order.insertOrderItem", orderItemDTO);
	}
}
