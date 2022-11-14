package com.kh.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.model.domain.Criteria;
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
	public OrderItemDTO selectBym_Id(String m_Id) {
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

	@Override
	public List<OrderDTO> selectOrderList(Criteria criteria) {
		return sqlSession.selectList("order.selectOrderList", criteria);
	}

	@Override
	public List<OrderDTO> selectOrderListByM_Id(HashMap<String, Object> map) {
		return sqlSession.selectList("order.selectOrderListByM_Id", map);
	}

	@Override
	public int getOrderTotal(Criteria criteria) {
		return sqlSession.selectOne("order.getOrderTotal", criteria);
	}

	@Override
	public int updateOrder(String o_Id) {
		return sqlSession.update("order.updateOrder", o_Id);
	}

	@Override
	public List<OrderItemDTO> selectOrderItemByO_Id(String o_Id) {
		return sqlSession.selectList("order.selectOrderItemByO_Id", o_Id);
	}

	@Override
	public OrderDTO selectOrderByO_Id(String o_Id) {
		return sqlSession.selectOne("order.selectOrderByO_Id", o_Id);
	}

}
