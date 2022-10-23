package com.kh.model;

import com.kh.model.domain.MemberDTO;

public interface MemberRepository {
	public MemberDTO get(String username);
	public Boolean insert(MemberDTO memberDTO); 
	int selectById(String M_id);
}
