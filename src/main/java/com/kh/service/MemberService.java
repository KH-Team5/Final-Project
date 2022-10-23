package com.kh.service;

import com.kh.model.domain.MemberDTO;

public interface MemberService {
	public boolean joinMember(MemberDTO memberDTO);

	public int idChk(String M_id);
}
