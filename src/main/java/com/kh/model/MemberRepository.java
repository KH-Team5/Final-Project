package com.kh.model;

import org.springframework.stereotype.Repository;

import com.kh.model.domain.MemberDTO;

public interface MemberRepository {
	public MemberDTO get(String username);
}
