package com.kh.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.model.domain.Criteria;
import com.kh.model.domain.MemberDTO;
import com.kh.model.domain.ProductDTO;
import com.kh.service.MemberService;

@Controller
public class MyPageController {
	@Autowired
	private MemberService memberservice;

	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);

	@RequestMapping(value = "/member/mypage", method = RequestMethod.GET)
	public String memberinfo(Model model, Principal principal) {
		model.addAttribute("key1", memberservice.memberInfo(principal.getName()));
		logger.info("마이페이지 진입");
		logger.info("회원 정보 출력");
		return "/member/mypage";
	}

	@RequestMapping(value = "/member/mypage", method = RequestMethod.POST)
	public String memberinfo2(Model model, Principal principal) {
		model.addAttribute("key1", memberservice.memberInfo(principal.getName()));
		logger.info("마이페이지 진입");
		logger.info("회원 정보 출력");

		return "/member/mypage";
	}

	@RequestMapping(value = "/member/memberUpdate", method = RequestMethod.GET)
	public String memberupdateGet(Model model, Principal principal) {
		model.addAttribute("key1", memberservice.memberInfo(principal.getName()));
		logger.info("회원정보 수정 진입");
		

		return "/member/memberUpdate";
	}
	
	@RequestMapping(value = "/member/memberUpdate", method = RequestMethod.POST)
	public String memberupdatePOST(Principal principal, MemberDTO memberDTO) {
		memberDTO.setM_id(principal.getName());
		memberservice.memberUpdate(memberDTO);
		logger.info("회원정보 수정 성공");

		return "redirect:/logout";
	}
	
	


	  @RequestMapping(value = "/member/memberDelete", method = RequestMethod.GET)
	  public String memberDelete(Principal principal) { 
		  String userid = principal.getName(); 
		  logger.info("회원 탈퇴 진입");
	  
	  
	  memberservice.memberDelete(userid); 
	  logger.info("회원 탈퇴 성공");
	  
	  
	  
	  return "redirect:/logout";
	  
	  }
	 
}
