package com.kh.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.model.domain.Criteria;
import com.kh.model.domain.ProductDTO;
import com.kh.service.MemberService;

@Controller
public class MyPageController {
	@Autowired
	private MemberService memberservice;
	
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	

	
	@RequestMapping(value = "/member/mypage", method = RequestMethod.GET)
	public String memberinfo(Model model) {
		model.addAttribute("key1", memberservice.memberInfo("user01"));
		logger.info("마이페이지 진입");
		logger.info("회원 정보 출력");
		
		return "/member/mypage";
	}
	@RequestMapping(value = "/member/mypage", method = RequestMethod.POST)
	public String memberinfo2(Model model, String id) {
		model.addAttribute("key1", memberservice.memberInfo(id));
		logger.info("마이페이지 진입");
		logger.info("회원 정보 출력");
		
		return "/member/mypage";
	}
	@RequestMapping(value = "/member/memberUpdate", method = RequestMethod.GET)
	public String memberupdate(Model model) {
		model.addAttribute("key1", memberservice.memberInfo("user01"));
		logger.info("회원정보 수정 진입");
		
		return "/member/memberUpdate";
	}
	
	@RequestMapping(value = "/member/memberUpdate", method = RequestMethod.POST)
	public String memberupdate2(Model model) {
		model.addAttribute("key1", memberservice.memberInfo("user01"));
		logger.info("회원정보 수정 진입");
		
		return "/member/memberUpdate";
	}
	
	


	}

