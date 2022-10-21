package com.kh.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping(value = "/member")
@AllArgsConstructor
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		logger.info("회원가입 페이지 진입");
		return "/member/join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPost() {
		logger.info("회원가입 페이지 진입");
		return "/member/join";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		logger.info("로그인 페이지 진입");
		return "/member/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPost() {
		logger.info("로그인 페이지 진입");
		return "/member/login";
	}
	
	@RequestMapping(value = "/memberTest", method = RequestMethod.GET)
	public String memberTest() {
		logger.info("회원 전용 페이지 진입");
		return "/member/memberTest";
	}

	@RequestMapping(value = "/memberTest", method = RequestMethod.POST)
	public String memberTestPost() {
		logger.info("회원 전용 페이지 진입");
		return "/member/memberTest";
	}
}
