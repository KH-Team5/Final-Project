package com.kh.service;

import com.kh.model.domain.MemberDTO;

public interface MemberService {
	public boolean joinMember(MemberDTO memberDTO);

	public int idChk(String M_id);

	void sendEmail(String toMail, String title, String content);

	public int emailOverlapChk(String email);

	public String findId(String email);

	public int findPwdChk(String email, String M_id);

	public int resetPwd(String M_id, String M_pwd);

	public MemberDTO memberInfo(String M_id);

	public int memberUpdate(MemberDTO memberDTO);

	public int memberDelete(String M_id);
}