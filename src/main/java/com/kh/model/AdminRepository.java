package com.kh.model;

import java.util.List;

import com.kh.model.domain.Criteria;
import com.kh.model.domain.MemberDTO;
import com.kh.model.domain.ProductDTO;

public interface AdminRepository {

	public MemberDTO get(String username);

	public int productModify(ProductDTO productDTO);
	
	public int productDelete(int p_Id);
		
	public int getTotal(Criteria cri); 

	public List<MemberDTO> selectMemberList(Criteria cri);

	public MemberDTO selectMemberInfo(String M_id);



	
}
