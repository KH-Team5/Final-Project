package com.kh.model;
 
import java.util.HashMap; 
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.model.domain.Criteria;
import com.kh.model.domain.MemberDTO;
//import com.kh.model.domain.Criteria;
//import com.kh.model.domain.MemberDTO;
import com.kh.model.domain.ProductDTO;
import com.kh.model.domain.userPagingDTO;
 
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
	public MemberDTO selectMemberInfo(String m_Id) {
		MemberDTO memberView = sqlSession.selectOne("admin.selectMemberinfo", m_Id);
		
		return memberView;
	}

	@Override
	public int searchCount(String searchType, String keyword)  {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("searchType", searchType);
		data.put("keyword",keyword);
		return sqlSession.selectOne("admin.searchCount", data);
	}

	@Override
	public List<MemberDTO> listPageSearch(userPagingDTO vo, String searchType, String keyword)  {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("start", vo.getStart());
		data.put("end",vo.getEnd());
		
		data.put("searchType",searchType);
		data.put("keyword", keyword);
		
		return sqlSession.selectList("admin.listPageSearch", data);
	}

	@Override
	public List<MemberDTO> listPage(userPagingDTO vo) {
		HashMap<String, Integer> data = new HashMap<String, Integer>();
	      data.put("start", vo.getStart());
	      data.put("end", vo.getEnd());
	      return sqlSession.selectList("admin.listPage", data);
	}

	@Override
	public int count() {
		return sqlSession.selectOne("admin.count");
	}

	@Override
	public List<MemberDTO> list() {
		return sqlSession.selectList("admin.list");
	}

	@Override
	public int userDelete(String m_Id) {
		int userDelete = sqlSession.delete("admin.userDelete",m_Id);
		return userDelete;
	}







}
