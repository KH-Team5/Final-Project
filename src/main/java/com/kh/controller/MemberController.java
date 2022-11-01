package com.kh.controller;

import java.util.Random;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		String title = "회원가입 인증 이메일 입니다.";
		String content = "인증 번호는 " + checkNum + "입니다.";
		memberService.sendEmail(email, title, content);
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
		int result = memberService.findPwdChk(email, id);
		if (result == 1) {
			String random = UUID.randomUUID().toString().replaceAll("-", "");
			String title = "임시 비밀번호 입니다.";
			String content = "임시 비밀번호는		" + random + "	입니다.";
			memberService.sendEmail(email, title, content);
			int resetPwd = memberService.resetPwd(id, random);
			if (resetPwd == 1)
				return "success";
			else
				return "error";
		} else
			return "error";
	}
}
