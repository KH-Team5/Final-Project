package com.kh.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.model.domain.CartDTO;
import com.kh.service.CartService;

@Controller
public class CartController {
	@Autowired
	private CartService cartService;

	@ResponseBody
	@RequestMapping(value = "/cart/add", method = RequestMethod.POST)
	public String addCartPOST(CartDTO cartDTO, HttpServletRequest request) {
		if (!(request.isUserInRole("ROLE_USER") || request.isUserInRole("ROLE_ADMIN")))
			return "5";
		int result = cartService.addCart(cartDTO);
		return result + "";
	}

	@RequestMapping(value = "/cart/{m_Id}", method = RequestMethod.GET)
	public String cartPage(@PathVariable("m_Id") String m_Id, Model model) {
		model.addAttribute("cartInfo", cartService.getCartList(m_Id));
		model.addAttribute("m_Id", m_Id);
		return "/cart";
	}

	@RequestMapping(value = "/cart/update", method = RequestMethod.POST)
	public String updateCartPOST(CartDTO cartDTO) {
		cartService.ChangeP_Cnt(cartDTO);
		return "redirect:/cart/" + cartDTO.getM_Id();
	}

	@RequestMapping(value = "/cart/delete", method = RequestMethod.POST)
	public String deleteCartPOST(CartDTO cartDTO) {
		cartService.deleteCart(cartDTO.getCa_Id());
		return "redirect:/cart/" + cartDTO.getM_Id();
	}
}
