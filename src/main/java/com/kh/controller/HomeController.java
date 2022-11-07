package com.kh.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.service.MemberService;
import com.kh.service.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private ProductService productService;

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, Principal principal) {
		model.addAttribute("Inner", productService.getSubInnerCategory());
		model.addAttribute("Pants", productService.getSubPantsCategory());
		model.addAttribute("Outer", productService.getSubOuterCategory());
		if (principal != null)
			model.addAttribute("member", memberService.memberInfo(principal.getName()));

		return "main";
	}

}
