package com.kh.model;

import org.springframework.stereotype.Repository;

import com.kh.model.domain.MemberDTO;

@Repository
public class MemberRepositoryImpl implements MemberRepository {

	@Override
	public MemberDTO get(String username) {
		MemberDTO member = new MemberDTO();
		member.setM_id("user");
		member.setM_name("차라친");
		member.setM_pwd("1234");
		member.setEmail("12@34");
		member.setRole("ROLE_USER");
		return member;
	}

}
