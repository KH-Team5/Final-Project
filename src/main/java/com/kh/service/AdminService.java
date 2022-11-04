package com.kh.service;

import com.kh.model.domain.ProductDTO;

public interface AdminService {
	
	/* 상품 등록 */
	public void regProduct(ProductDTO productDTO);

	/* 상품 수정 */
	public int productModify(ProductDTO productDTO);
	
	/* 상품 삭제 */
	public int productDelete1(int p_Id);
	public int productDelete2(int p_Id);
	
}
