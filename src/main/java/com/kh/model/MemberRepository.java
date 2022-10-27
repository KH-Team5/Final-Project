package com.kh.model;

import com.kh.model.domain.MemberDTO;

public interface MemberRepository {
	public MemberDTO get(String username);

	public boolean insert(MemberDTO memberDTO);

	public int selectById(String M_id);

	public String selectIdByEmail(String email);

	public int selectByEmail(String email);

	public int selectByEmailandId(String email, String M_id);

	public int memberUpdate(String m_id);
	
	public int memberDelete(String M_id);

}
