package com.kh.service;

import java.util.List;

import com.kh.model.domain.CartDTO;

public interface CartService {

	public int addCart(CartDTO cart);

	public List<CartDTO> getCartList(String m_Id);

	public int ChangeP_Cnt(CartDTO cartDTO);
	
	public int deleteCart(int ca_Id);
}
