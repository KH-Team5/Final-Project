package com.kh.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.model.domain.Criteria;
import com.kh.model.domain.MemberDTO;
//import com.kh.model.domain.Criteria;
//import com.kh.model.domain.MemberDTO;
import com.kh.model.domain.ProductDTO;

@Repository
public class AdminRepositoryImpl implements AdminRepository {
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public int productModify(ProductDTO productDTO) {
		int count = sqlSession.update("admin.modify", productDTO);
		return count;
	
	}

	@Override
	public MemberDTO get(String userid) {
		return sqlSession.selectOne("admin.getByM_id", userid);
	}

	@Override
	public int productDelete(int p_Id) {
		int count1 = sqlSession.delete("admin.delete1",p_Id);
		int count2 = sqlSession.delete("admin.delete2",p_Id);
		return count1 + count2;
	}

	@Override
	public int getTotal(Criteria cri) {
		return sqlSession.selectOne("admin.getTotal", cri);
	}

	@Override
	public List<MemberDTO> selectMemberList(Criteria cri) {
		return sqlSession.selectList("admin.selectMemberList", cri);
	}

	@Override
	public MemberDTO selectMemberInfo(String M_id) {
		MemberDTO memberView = sqlSession.selectOne("admin.selectMemberinfo", M_id);
		
		return memberView;
	}







}
