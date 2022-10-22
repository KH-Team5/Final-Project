package com.kh.service;

import org.springframework.beans.factory.annotation.Autowired;
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

	@Override
	public boolean joinMember(MemberDTO memberDTO) {
		memberDTO.setM_pwd(passwordEncoder.encode(memberDTO.getM_pwd()));
		return memberRepository.insert(memberDTO);
	}
}
