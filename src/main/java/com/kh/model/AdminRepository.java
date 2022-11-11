package com.kh.model;

import java.util.List;

import com.kh.model.domain.CategoryDTO;
import com.kh.model.domain.Criteria;
import com.kh.model.domain.MemberDTO;
import com.kh.model.domain.ProductDTO;
import com.kh.model.domain.userPagingDTO;

public interface AdminRepository {

	public MemberDTO get(String username);

	public int productModify(ProductDTO productDTO);
	
	public int productDelete(int p_Id);
		
	public int getTotal(Criteria cri); 

	public List<MemberDTO> selectMemberList(Criteria cri);

	public MemberDTO selectMemberInfo(String m_Id);

	public int searchCount(String searchType, String keyword) ;

	public List<MemberDTO> listPageSearch(userPagingDTO vo, String searchType, String keyword) ;

	//게시물 목록 + 페이징
	public List<MemberDTO> listPage(userPagingDTO vo);

	//게시물 총개수
	public int count();

	public List<MemberDTO> list();

	public int userDelete(String m_Id);

	public int deleteImageAll(int p_Id);



	
}
