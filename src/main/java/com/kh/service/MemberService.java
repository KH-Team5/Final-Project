package com.kh.service;

import com.kh.model.domain.MemberDTO;

public interface MemberService {
	public boolean joinMember(MemberDTO memberDTO);

	public int idChk(String M_id);

	public int emailOverlapChk(String email);

	public String findId(String email);

	public int findPwdChk(String email, String M_id);

}
