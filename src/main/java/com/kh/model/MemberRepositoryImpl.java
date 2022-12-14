package com.kh.model;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.model.domain.MemberDTO;

@Repository
public class MemberRepositoryImpl implements MemberRepository {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDTO get(String userid) {
		return sqlSession.selectOne("member.getByM_Id", userid);
	}

	@Override
	public boolean insert(MemberDTO memberDTO) {
		int count = sqlSession.insert("member.insert", memberDTO);
		if (count == 1)
			return true;
		else
			return false;
	}

	@Override
	public int selectById(String m_Id) {
		int count = sqlSession.selectOne("member.selectById", m_Id);
		return count;
	}

	@Override
	public int selectByEmail(String email) {
		int count = sqlSession.selectOne("member.selectByEmail", email);
		return count;
	}

	@Override
	public String selectIdByEmail(String email) {
		return sqlSession.selectOne("member.selectIdByEmail", email);
	}

	@Override
	public int selectByEmailandId(String email, String m_Id) {
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("m_Id", m_Id);
		return sqlSession.selectOne("member.selectByEmailandId", map);
	}

	@Override
	public int memberUpdate(MemberDTO memberDTO) {
		int count = sqlSession.update("member.update", memberDTO);
		return count;
	}

	@Override
	public int memberDelete(String m_Id) {
		int count = sqlSession.delete("member.delete", m_Id);
		return count;

	}

	public int updatePwdById(String m_Id, String M_pwd) {
		Map<String, String> map = new HashMap<>();
		map.put("M_pwd", M_pwd);
		map.put("m_Id", m_Id);
		return sqlSession.update("member.updatePwdById", map);
	}
}
