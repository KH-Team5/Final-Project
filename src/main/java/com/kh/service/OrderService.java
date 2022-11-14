package com.kh.service;

import java.util.List;

import com.kh.model.domain.OrderDTO;
import com.kh.model.domain.OrderItemDTO;

public interface OrderService {
	public List<OrderItemDTO> getProductInfo(List<OrderItemDTO> orders);

	void order(OrderDTO ord);
}
