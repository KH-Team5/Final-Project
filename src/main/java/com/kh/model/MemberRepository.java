package com.kh.model;

import com.kh.model.domain.MemberDTO;

public interface MemberRepository {
	public MemberDTO get(String username);
	public boolean insert(MemberDTO memberDTO); 
	int selectById(String M_id);
}
