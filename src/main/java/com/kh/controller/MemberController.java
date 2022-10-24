package com.kh.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.model.domain.MemberDTO;
import com.kh.service.MemberService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping(value = "/member")
@AllArgsConstructor
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		logger.info("회원가입 페이지 진입");
		return "/member/join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(MemberDTO member) throws Exception{
		logger.info("join Service 시작");
		if(memberService.joinMember(member))
			logger.info("join Service 성공");	
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public String idChkPOST(String M_id) throws Exception{
		int result = memberService.idChk(M_id);
		if(result != 0) 
			return "error";
		else 
			return "success";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		logger.info("로그인 페이지 진입");
		return "/member/login";
	}

	@RequestMapping(value = "/memberTest", method = RequestMethod.GET)
	public String memberTest() {
		logger.info("회원 전용 페이지 진입");
		return "/member/memberTest";
	}

}
