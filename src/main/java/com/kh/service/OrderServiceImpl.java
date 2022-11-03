package com.kh.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.controller.MyPageController;
import com.kh.model.MemberRepository;
import com.kh.model.OrderRepository;
import com.kh.model.ProductRepository;
import com.kh.model.domain.AttachImageDTO;
import com.kh.model.domain.MemberDTO;
import com.kh.model.domain.OrderDTO;
import com.kh.model.domain.OrderItemDTO;
import com.kh.model.domain.ProductDTO;

@Service
public class OrderServiceImpl implements OrderService {
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	@Autowired
	private OrderRepository orderRepository;

	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private MemberRepository memberRepository;

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
		MemberDTO member = memberRepository.get(ord.getM_Id());
		List<OrderItemDTO> ords = new ArrayList<>();
		for (OrderItemDTO oit : ord.getOrders()) {
			OrderItemDTO orderItem = orderRepository.selectByp_Id(oit.getP_Id());
			orderItem.setP_Cnt(oit.getP_Cnt());
			orderItem.initSaleTotal();
			ords.add(orderItem);
		}
		ord.setOrders(ords);
		if (ord.getOrderSalePrice() >= 30000)
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
	}
}
