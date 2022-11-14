package com.kh.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.model.CartRepository;
import com.kh.model.OrderRepository;
import com.kh.model.ProductRepository;
import com.kh.model.domain.AttachImageDTO;
import com.kh.model.domain.CartDTO;
import com.kh.model.domain.Criteria;
import com.kh.model.domain.OrderCancelDTO;
import com.kh.model.domain.OrderDTO;
import com.kh.model.domain.OrderItemDTO;
import com.kh.model.domain.ProductDTO;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderRepository orderRepository;

	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private CartRepository cartRepository;

	@Override
	public List<OrderItemDTO> getProductInfo(List<OrderItemDTO> orders) {
		List<OrderItemDTO> result = new ArrayList<>();
		for (OrderItemDTO ord : orders) {
			OrderItemDTO orderDTO = orderRepository.selectByp_Id(ord.getP_Id());
			orderDTO.setP_Cnt(ord.getP_Cnt());
			orderDTO.initSaleTotal();
			List<AttachImageDTO> imageList = productRepository.selectImage(orderDTO.getP_Id());
			orderDTO.setImageList(imageList);
			result.add(orderDTO);
		}
		return result;
	}

	@Override
	@Transactional
	public void order(OrderDTO ord) {
		List<OrderItemDTO> ords = new ArrayList<>();
		for (OrderItemDTO oit : ord.getOrders()) {
			OrderItemDTO orderItem = orderRepository.selectByp_Id(oit.getP_Id());
			orderItem.setP_Cnt(oit.getP_Cnt());
			orderItem.initSaleTotal();
			ords.add(orderItem);
		}
		ord.setOrders(ords);
		if (ord.getTotalPrice() >= 30000)
			ord.setO_delivery_charge(0);
		else
			ord.setO_delivery_charge(3000);

		orderRepository.insertOrder(ord);
		
		for (OrderItemDTO oit : ord.getOrders()) {
			orderRepository.insertOrderItem(oit);
		}
		
		for (OrderItemDTO oit : ord.getOrders()) {
			ProductDTO productDTO = productRepository.selectProductInfo(oit.getP_Id());
			productDTO.setP_Stock(productDTO.getP_Stock() - oit.getP_Cnt());
			productRepository.updateProductStock(productDTO);
		}
		
		for (OrderItemDTO OrderItem : ord.getOrders()) {
			CartDTO cartDTO = new CartDTO();
			cartDTO.setM_Id(ord.getM_Id());
			cartDTO.setP_Id(OrderItem.getP_Id());
			cartRepository.deleteOrderCart(cartDTO);
		}
	}

	@Override
	public List<OrderDTO> getOrderList(Criteria criteria) {
		return orderRepository.selectOrderList(criteria);
	}

	@Override
	public List<OrderDTO> getOrderListByM_Id(Criteria criteria, String m_Id) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("m_Id", m_Id);
		map.put("amount", criteria.getAmount());
		map.put("pageNum", criteria.getPageNum());
		if (criteria.getKeyword() != null)
			map.put("keyword", criteria.getKeyword());
		return orderRepository.selectOrderListByM_Id(map);
	}

	@Override
	public int getOrderTotal(Criteria criteria) {
		return orderRepository.getOrderTotal(criteria);
	}

	@Override
	@Transactional
	public void orderCancle(OrderCancelDTO orderCancelDTO) {
		List<OrderItemDTO> OrderItems = orderRepository.selectOrderItemByO_Id(orderCancelDTO.getO_Id());
		
		for (OrderItemDTO OrderItem : OrderItems)
			OrderItem.initSaleTotal();
		OrderDTO Order = orderRepository.selectOrderByO_Id(orderCancelDTO.getO_Id());
		Order.setOrders(OrderItems);
		Order.getTotalPrice();
		orderRepository.updateOrder(orderCancelDTO.getO_Id());

		for (OrderItemDTO OrderItem : Order.getOrders()) {
			ProductDTO productDTO = productRepository.selectProductInfo(OrderItem.getP_Id());
			productDTO.setP_Stock(productDTO.getP_Stock() + OrderItem.getP_Cnt());
			productRepository.updateProductStock(productDTO);
		}
	}
}
