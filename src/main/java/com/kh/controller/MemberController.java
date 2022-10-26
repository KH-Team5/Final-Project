package com.kh.controller;

import java.io.Console;
import java.security.Principal;
import java.util.Random;
import java.util.UUID;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		return "/member/join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(MemberDTO member) throws Exception {
		memberService.joinMember(member);
		return "redirect:/";
	}

	@ResponseBody
	@RequestMapping(value = "/join/idChk", method = RequestMethod.POST)
	public String idChkPOST(String M_id) throws Exception {
		int result = memberService.idChk(M_id);
		if (result != 0)
			return "error";
		else
			return "success";
	}

	@ResponseBody
	@RequestMapping(value = "/join/emailOverlapChk", method = RequestMethod.POST)
	public String emailOverlapChkPost(String email) throws Exception {
		logger.info("emailOverlapChkPost");
		int result = memberService.emailOverlapChk(email);
		if (result != 0)
			return "error";
		else
			return "success";
	}

	@ResponseBody
	@RequestMapping(value = "/join/mailChk", method = RequestMethod.GET)
	public String mailChk(String email) throws Exception {
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		String setForm = "kh5mailtest@gmail.com";
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
		return "/member/login";
	}

	@RequestMapping(value = "/findPage", method = RequestMethod.GET)
	public String findPage() {
		return "/member/findPage";
	}

	@ResponseBody
	@RequestMapping(value = "/findPage/findid", method = RequestMethod.POST)
	public String findid(String email) throws Exception {
		return memberService.findId(email);
	}

	@ResponseBody
	@RequestMapping(value = "/findPage/pwdReset", method = RequestMethod.POST)
	public String pwdReset(@RequestParam("email") String email, @RequestParam("id") String id) throws Exception {
		logger.info("찾기 진입");
		logger.info(email);
		logger.info(id);
		int result = memberService.findPwdChk(email, id);
		String temp = Integer.toString(result);
		logger.info(temp);
		if (result == 1) {
			String random = UUID.randomUUID().toString().replaceAll("-", "");
			String setForm = "kh5mailtest@gmail.com";
			String toMail = email;
			String title = "임시 비밀번호 입니다.";
			String content = "임시 비밀번호는		" + random + "	입니다.";
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
			return "success";
		} else
			return "error";
	}

	@RequestMapping(value = "/memberTest", method = RequestMethod.GET)
	public String memberTest() {
		return "/member/memberTest";
	}
}
