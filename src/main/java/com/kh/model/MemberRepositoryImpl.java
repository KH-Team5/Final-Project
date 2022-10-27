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
		return sqlSession.selectOne("member.getByM_id", userid);
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
	public int selectById(String M_id) {
		int count = sqlSession.selectOne("member.selectById", M_id);
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
	public int selectByEmailandId(String email, String M_id) {
		Map<String, String>map = new HashMap<>();
		map.put("email", email);
		map.put("M_id", M_id);
		return sqlSession.selectOne("member.selectByEmailandId", map);
	}

	@Override
	public int memberUpdate(String M_id) {
		int count = sqlSession.update("member.update", M_id);
		return count;
	}
	
	@Override
	public int memberDelete(String M_id) {
		int count = sqlSession.delete("member.delete", M_id);
		return count;
		
	}

}
	

