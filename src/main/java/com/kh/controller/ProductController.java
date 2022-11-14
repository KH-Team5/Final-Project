package com.kh.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.security.Principal;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.model.domain.Criteria;
import com.kh.model.domain.PageDTO;
import com.kh.model.domain.ProductDTO;
import com.kh.model.domain.ReviewDTO;
import com.kh.service.MemberService;
import com.kh.service.ProductService;
import com.kh.service.ReviewService;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	private MemberService memberservice;
	@Autowired
	private ReviewService reviewService;

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String productManage(Criteria cri, Model model) {
		/*
		 * model.addAttribute("Inner", productService.getSubInnerCategory());
		 * model.addAttribute("Pants", productService.getSubPantsCategory());
		 * model.addAttribute("Outer", productService.getSubOuterCategory());
		 */
		cri.setAmount(12);
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

	@RequestMapping(value = "/productInfo/{p_Id}", method = RequestMethod.GET)
	public String productInfo(@PathVariable("p_Id") int p_Id, Model model, Principal principal) {
		model.addAttribute("productInfo", productService.getProductInfo(p_Id));
		if (principal != null)
			model.addAttribute("member", memberservice.memberInfo(principal.getName()));
		return "/productInfo";
	}

	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getImage(String fileName) {
		File file = new File("c:\\upload\\" + fileName);
		ResponseEntity<byte[]> result = null;
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping(value = "/review/reviewEnroll/{m_Id}", method = RequestMethod.GET)
	public String replyEnrollInfoGET(@PathVariable("m_Id") String m_Id, int p_Id, Model model) {
		ProductDTO productDTO = productService.getProductInfo(p_Id);
		model.addAttribute("productInfo", productDTO);
		model.addAttribute("memberId", m_Id);
		return "/review/reviewEnroll";
	}

	@RequestMapping(value = "/review/reviewUpdate", method = RequestMethod.GET)
	public String reviewUpdateInfoGET(ReviewDTO reviewDTO, Model model) {
		ProductDTO productDTO = productService.getProductInfo(reviewDTO.getP_Id());
		model.addAttribute("productInfo", productDTO);
		model.addAttribute("reviewInfo", reviewService.updateReviewInfo(reviewDTO.getR_Id()));
		return "/review/reviewUpdate";
	}
}
