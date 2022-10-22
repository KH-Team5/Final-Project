package com.kh.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.model.domain.MemberDTO;

@Repository
public class MemberRepositoryImpl implements MemberRepository {
	/*
	 * @Autowired private SqlSession sqlSession;
	 */

	@Override
	public MemberDTO get(String userid) {

		MemberDTO member = new MemberDTO();
		member.setM_id("user");
		member.setM_name("차라친");
		member.setM_pwd("1234");
		member.setEmail("12@34");
		member.setRole("ROLE_USER");
		return member;

		/* return sqlSession.selectOne("user.getM_id", userid); */
	}

}
