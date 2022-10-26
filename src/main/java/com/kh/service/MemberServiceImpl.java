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

	@Override
	public int idChk(String M_id) {
		return memberRepository.selectById(M_id);
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

}
