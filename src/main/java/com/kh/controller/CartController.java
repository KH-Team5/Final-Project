package com.kh.controller;

import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.model.domain.CartDTO;
import com.kh.service.CartService;
import com.kh.service.MemberService;
@Controller
public class CartController {
	@Autowired
	private CartService cartService;
	@Autowired
	private MemberService memberService;
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	
	
	
	@ResponseBody
	@RequestMapping(value= "/cart/add", method = RequestMethod.POST)
	public String addCartPOST(CartDTO cart, Principal principal) {
		
		cart.setM_id(principal.getName());
		logger.info("로그인한 정보로 제품상세화면 접속");
		
		cartService.addCart(cart);
		logger.info("장바구니 추가");
		return "/cart/add";
	}
	
	
	@GetMapping("/cart/{M_id}")
	public String cartPageGET(@PathVariable("M_id") String M_id, Model model) {
		model.addAttribute("cartInfo", cartService.getCartList(M_id));

		
		return "/cart";
	}

}
