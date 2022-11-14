package com.kh.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.model.domain.OrderDTO;
import com.kh.model.domain.OrderListDTO;
import com.kh.service.MemberService;
import com.kh.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/member/order/{M_id}", method = RequestMethod.GET)
	public String  orderPgaeGET(@PathVariable("M_id") String M_id, OrderListDTO orderListDTO, Model model) {
		model.addAttribute("orderList", orderService.getProductInfo(orderListDTO.getOrders()));
		model.addAttribute("memberInfo", memberService.memberInfo(M_id));
		return "/member/order";
	}
	
	@RequestMapping(value = "/member/order", method = RequestMethod.POST)
	public String orderPagePost(OrderDTO od, HttpServletRequest request, Principal principal) {
		od.setM_Id(principal.getName());
		System.out.println(od);
		orderService.order(od);
		return "redirect:/main";
	}

}
