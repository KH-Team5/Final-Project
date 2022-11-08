package com.kh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.model.domain.Criteria;
import com.kh.model.domain.ProductDTO;
import com.kh.service.ProductService;

@Controller
public class HomeController {
	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		Criteria cri = new Criteria(1, 8);
		List<ProductDTO> list = productService.productGetList(cri);
		model.addAttribute("productInfo", list);
		/*
		 * model.addAttribute("Inner", productService.getSubInnerCategory());
		 * model.addAttribute("Pants", productService.getSubPantsCategory());
		 * model.addAttribute("Outer", productService.getSubOuterCategory());
		 */
		return "main";
	}

}
