package com.kh.service;

import java.util.List;

import com.kh.model.domain.CartDTO;

public interface CartService {
	
	//장바구니 추가
	public int addCart(CartDTO cart);
	
	//장바구니 조회
	public List<CartDTO> getCartList(String M_id);

}
