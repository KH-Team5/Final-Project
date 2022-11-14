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
	public int idChk(String m_Id) {
		return memberRepository.selectById(m_Id);
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
	public int findPwdChk(String email, String m_Id) {
		return memberRepository.selectByEmailandId(email, m_Id);
	}

	@Override
	public int resetPwd(String m_Id, String M_pwd) {
		return memberRepository.updatePwdById(m_Id, M_pwd);
	}

	@Override
	public MemberDTO memberInfo(String m_Id) {
		return memberRepository.get(m_Id);
	}

	@Override
	public int memberUpdate(MemberDTO memberDTO) {
		return memberRepository.memberUpdate(memberDTO);
	}

	@Override
	public int memberDelete(String m_Id) {
		return memberRepository.memberDelete(m_Id);
	}

}
