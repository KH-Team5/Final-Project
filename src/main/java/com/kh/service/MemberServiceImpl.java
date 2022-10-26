package com.kh.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.model.MemberRepository;
import com.kh.model.domain.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberRepository memberRepository;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private JavaMailSender javaMailSender;

	@Override
	public boolean joinMember(MemberDTO memberDTO) {
		memberDTO.setM_pwd(passwordEncoder.encode(memberDTO.getM_pwd()));
		return memberRepository.insert(memberDTO);
	}

	@Override
	public int idChk(String M_id) {
		return memberRepository.selectById(M_id);
	}

	@Override
	public void sendEmail(String toMail, String title, String content) {
		try {
			MimeMessage message = javaMailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom("kh5mailtest@gmail.com");
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			javaMailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int emailOverlapChk(String email) {
		return memberRepository.selectByEmail(email);
	}

	@Override
	public String findId(String email) {
		return memberRepository.selectIdByEmail(email);
	}

	@Override
	public int findPwdChk(String email, String M_id) {
		return memberRepository.selectByEmailandId(email, M_id);
	}

	@Override
	public int resetPwd(String M_id, String M_pwd) {
		return memberRepository.updatePwdById(M_id, M_pwd);
	}

	@Override
	public MemberDTO memberInfo(String M_id) {
		return memberRepository.get(M_id);
	}

}
