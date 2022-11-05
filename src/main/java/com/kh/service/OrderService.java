package com.kh.service;

import java.util.List;

import com.kh.model.domain.Criteria;
import com.kh.model.domain.OrderDTO;
import com.kh.model.domain.OrderItemDTO;

public interface OrderService {
	public List<OrderItemDTO> getProductInfo(List<OrderItemDTO> orders);

	void order(OrderDTO ord);

	List<OrderDTO> getOrderList(Criteria criteria);

	List<OrderDTO> getOrderListByM_Id(Criteria criteria, String m_Id);

	int getOrderTotal(Criteria criteria);
}
