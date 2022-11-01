package com.kh.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.model.domain.CartDTO;
import com.kh.model.domain.MemberDTO;
import com.kh.service.CartService;

public class CartController {
	@Autowired
	private CartService cartService;
	
	
	
	
	@GetMapping("/cart/{M_Id}")
	public String cartPageGET(@PathVariable("M_Id") String M_id, Model model) {
		model.addAttribute("cartInfo", cartService.getCartList(M_id));

		
		return "/cart";
	}
	
	
	
	
	
	
	@PostMapping("/cart/add")
	@ResponseBody
	public String addCartPOST(CartDTO cart, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		if(memberDTO == null) {
			return "5";
		}
		int result = cartService.addCart(cart);
		
		return result + "";
	}

}
