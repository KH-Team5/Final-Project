package com.kh.model;

import java.util.HashMap;
import java.util.List;

import com.kh.model.domain.Criteria;
import com.kh.model.domain.OrderDTO;
import com.kh.model.domain.OrderItemDTO;

public interface OrderRepository {
	OrderItemDTO selectByp_Id(int p_Id);

	OrderItemDTO selectBym_Id(String m_Id);

	int insertOrder(OrderDTO orderDTO);

	int insertOrderItem(OrderItemDTO orderItemDTO);

	List<OrderDTO> selectOrderList(Criteria criteria);

	int getOrderTotal(Criteria criteria);

	List<OrderDTO> selectOrderListByM_Id(HashMap<String, Object> map);

	int updateOrder(String o_Id);

	List<OrderItemDTO> selectOrderItemByO_Id(String o_Id);

	OrderDTO selectOrderByO_Id(String o_Id);

}
