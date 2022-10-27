package com.kh.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
}
