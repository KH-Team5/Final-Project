package com.kh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.model.CartRepository;
import com.kh.model.domain.CartDTO;



@Service
public class CartServiceimpl implements CartService{
	
	@Autowired
	private CartRepository cartRepository;
	 
	
	@Override
	public int addCart(CartDTO cart) {
		return cartRepository.addCart(cart);
	}
	@Override
	public List<CartDTO>getCartList(String M_id) {
		
		return null;
	}
	


	
		

	}
	

