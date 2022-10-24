package com.kh.model;

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

}
