package com.kh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.model.domain.CategoryDTO;
import com.kh.model.domain.Criteria;
import com.kh.model.domain.PageDTO;
import com.kh.model.domain.ProductDTO;
import com.kh.service.AdminService;
import com.kh.service.ProductService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping(value = "/admin")
@AllArgsConstructor
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@Autowired 
	private ProductService productService;

	@RequestMapping(value = "/productRegistration", method = RequestMethod.GET)
	public String productRegistration(Model model) throws Exception {
		
		List<CategoryDTO> list = productService.categoryList();
		ObjectMapper obj = new ObjectMapper();
		String categoryList = obj.writeValueAsString(list);
		model.addAttribute("categoryList", categoryList);
		
		return "/admin/productRegistration";
	}

	@PostMapping("/productRegistration")
	public String productRegistrationPOST(ProductDTO productDTO, RedirectAttributes redirec) {
		adminService.regProduct(productDTO);
		redirec.addFlashAttribute("registration_result", productDTO.getP_Name());
		return "redirect:/admin/productsManage";
	}

	@RequestMapping(value = "/productsManage", method = RequestMethod.GET)
	public void productManage(Criteria cri, Model model) {
		List<ProductDTO> list = productService.productGetList(cri);
		if (!list.isEmpty())
			model.addAttribute("list", list);
		else {
			model.addAttribute("listCheck", "empty");
			return;
		}
		model.addAttribute("paging", new PageDTO(cri, productService.productGetTotal(cri)));
	}

}
