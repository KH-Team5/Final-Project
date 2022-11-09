package com.kh.model;

import java.util.List;

import com.kh.model.domain.CartDTO;

public interface CartRepository {

	public int insertCart(CartDTO cartDTO);

	public int deleteCart(int ca_Id);

	public int updateCartp_Cnt(CartDTO cartDTO);

	public List<CartDTO> selectCartInfo(String m_Id);

	public CartDTO selectCartChk(CartDTO cartDTO);
	
	public int deleteOrderCart(CartDTO cartDTO);
}
