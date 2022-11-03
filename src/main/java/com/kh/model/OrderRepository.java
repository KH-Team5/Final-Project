package com.kh.model;

import com.kh.model.domain.OrderDTO;
import com.kh.model.domain.OrderItemDTO;

public interface OrderRepository {
	OrderItemDTO selectByp_Id(int p_Id);

	OrderItemDTO selectBym_Id(String m_Id);
	
	int insertOrder(OrderDTO orderDTO);

	int insertOrderItem(OrderItemDTO orderItemDTO);

	
}
