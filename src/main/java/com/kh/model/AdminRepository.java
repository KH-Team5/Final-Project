package com.kh.model;

import com.kh.model.domain.ProductDTO;

public interface AdminRepository {

	public int productModify(ProductDTO productDTO);
	public int productDelete1(int p_Id);
	public int productDelete2(int p_Id);
}
