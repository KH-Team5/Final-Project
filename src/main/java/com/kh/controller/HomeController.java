package com.kh.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.model.domain.ProductDTO;
import com.kh.service.ProductService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {

	private final ProductService productService;

	@GetMapping(value = "/")
	public String home(Model model) {
		List<ProductDTO> list = productService.selectProductListOrderByRating();
		model.addAttribute("productInfo", list);
		/*
		 * model.addAttribute("Inner", productService.getSubInnerCategory());
		 * model.addAttribute("Pants", productService.getSubPantsCategory());
		 * model.addAttribute("Outer", productService.getSubOuterCategory());
		 */
		return "main";
	}

}
