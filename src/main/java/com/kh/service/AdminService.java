package com.kh.service;

import java.util.List;

import com.kh.model.domain.Criteria;
import com.kh.model.domain.MemberDTO;

//import java.util.List;

//import com.kh.model.domain.Criteria;
//import com.kh.model.domain.MemberDTO;
import com.kh.model.domain.ProductDTO;
import com.kh.model.domain.userPagingDTO;

public interface AdminService {
	
	/* 상품 등록 */
	public void regProduct(ProductDTO productDTO);

	/* 상품 수정 */
	public int productModify(ProductDTO productDTO);
	
	/* 상품 삭제 */
	public int productDelete(int p_Id); 
	
	/* 모든 회원조회 */
	public int usersGetTotal(Criteria cri);
	
	
	public List<MemberDTO> userGetList(Criteria cri);

	
	/* 회원상세정보 */
	public MemberDTO getUserInfo(String M_id);

	
	/* 게시물 총갯수 */
	public int searchCount(String searchType, String keyword);

	/* 리스트 페이지 서치*/
	public List<MemberDTO> listPageSearch(userPagingDTO vo, String searchType, String keyword);

	public int count();
	
	public List<MemberDTO> list();

	public List<MemberDTO> listPage(userPagingDTO vo); 
	
	/* 유저 아이디 삭제 */
	public int userDelete(String M_id); 
	
	
}
