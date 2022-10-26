package com.kh.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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

	@Autowired
	private JavaMailSender javaMailSender;

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		logger.info("회원가입 페이지 진입");
		return "/member/join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(MemberDTO member) throws Exception {
		logger.info("join Service 시작");
		if (memberService.joinMember(member))
			logger.info("join Service 성공");
		return "redirect:/";
	}

	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public String idChkPOST(String M_id) throws Exception {
		int result = memberService.idChk(M_id);
		if (result != 0)
			return "error";
		else
			return "success";
	}

	@ResponseBody
	@RequestMapping(value = "/mailChk", method = RequestMethod.GET)
	public String mailChk(String email) throws Exception {
		logger.info("이메일 데이터 전송 확인");
		logger.info("인증번호 : " + email);
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		logger.info("인증번호 " + checkNum);
		String setForm = "myrtenaster@naver.com";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "인증 번호는 " + checkNum + "입니다.";
		try {
			MimeMessage message = javaMailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setForm);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			javaMailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return Integer.toString(checkNum);
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
