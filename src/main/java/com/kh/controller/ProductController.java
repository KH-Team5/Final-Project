package com.kh.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.model.domain.Criteria;
import com.kh.model.domain.PageDTO;
import com.kh.model.domain.ProductDTO;
import com.kh.service.ProductService;

@Controller
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String productManage(Criteria cri, Model model) {
		logger.info("search");
		List<ProductDTO> list = productService.productGetList(cri);
		if (!list.isEmpty())
			model.addAttribute("list", list);
		else {
			model.addAttribute("listCheck", "empty");
			return "search";
		}
		model.addAttribute("paging", new PageDTO(cri, productService.productGetTotal(cri)));
		return "search";
	}
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model) {
		model.addAttribute("Inner", productService.getSubInnerCategory());
		model.addAttribute("Pants", productService.getSubPantsCategory());
		model.addAttribute("Outer", productService.getSubOuterCategory());
		return "/main";
	}

	/*
	 * @RequestMapping(value = "/category", method = RequestMethod.GET) public
	 * String category(Model model) { model.addAttribute("Inner",
	 * productService.getSubInnerCategory()); model.addAttribute("Pants",
	 * productService.getSubPantsCategory()); model.addAttribute("Outer",
	 * productService.getSubOuterCategory()); return "/category"; }
	 */

	@RequestMapping(value = "/productInfo/{p_Id}", method = RequestMethod.GET)
	public String productInfo(@PathVariable("p_Id") int p_Id, Model model) {
		model.addAttribute("productInfo", productService.getProductInfo(p_Id));
		return "/productInfo";
	}
}
