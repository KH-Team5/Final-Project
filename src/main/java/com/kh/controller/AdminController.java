package com.kh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.model.domain.Criteria;
import com.kh.model.domain.PageDTO;
import com.kh.model.domain.ProductDTO;
import com.kh.service.AdminService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping(value = "/admin")
@AllArgsConstructor
public class AdminController {

	@Autowired
	private AdminService adminService;

	@RequestMapping(value = "/productRegistration", method = RequestMethod.GET)
	public String productRegistration() {
		return "/admin/productRegistration";
	}

	@PostMapping("/productRegistration")
	public String productRegistrationPOST(ProductDTO productDTO, RedirectAttributes redirec) {
		adminService.regProduct(productDTO);
		redirec.addFlashAttribute("registration_result", productDTO.getP_name());
		return "redirect:/admin/productsManage";
	}

	@RequestMapping(value = "/productsManage", method = RequestMethod.GET)
	public void productManage(Criteria cri, Model model) {
		List<ProductDTO> list = adminService.productGetList(cri);
		if (!list.isEmpty())
			model.addAttribute("list", list);
		else {
			model.addAttribute("listCheck", "empty");
			return;
		}
		model.addAttribute("paging", new PageDTO(cri, adminService.productGetTotal(cri)));
	}

	@RequestMapping(value = "/adminTest", method = RequestMethod.GET)
	public String adminTest() {
		return "/admin/adminTest";
	}

}
