package com.kh.model;

import java.util.List;

import com.kh.model.domain.CartDTO;

public interface CartRepository {
	
    //카트 추가
	public int addCart(CartDTO cart)throws Exception;
	
	//카트 삭제
	public int deleteCart(int cartId);
	
	//카트 수량 수정
	public int modifyCount(CartDTO cart);
	
	//카트 목록
	public List<CartDTO> getCart(String M_id);
	
	//카트 확인
	public CartDTO checkCart(CartDTO cart);
	

}
