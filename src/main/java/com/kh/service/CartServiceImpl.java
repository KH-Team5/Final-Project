package com.kh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.model.CartRepository;
import com.kh.model.ProductRepository;
import com.kh.model.domain.AttachImageDTO;
import com.kh.model.domain.CartDTO;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartRepository cartRepository;

	@Autowired
	private ProductRepository productRepository;

	@Override
	public int addCart(CartDTO cartDTO) {
		CartDTO chkCart = cartRepository.selectCartChk(cartDTO);
		if (chkCart != null)
			return 2;
		return cartRepository.insertCart(cartDTO);
	}

	@Override
	public List<CartDTO> getCartList(String m_Id) {
		List<CartDTO> cart = cartRepository.selectCartInfo(m_Id);
		for (CartDTO cartDTO : cart) {
			cartDTO.initSaleTotal();
			int p_Id = cartDTO.getP_Id();
			List<AttachImageDTO> imageList = productRepository.selectImage(p_Id);
			cartDTO.setImageList(imageList);
		}
		return cart;
	}

	@Override
	public int ChangeP_Cnt(CartDTO cartDTO) {
		return cartRepository.updateCartp_Cnt(cartDTO);
	}

	@Override
	public int deleteCart(int ca_Id) {
		return cartRepository.deleteCart(ca_Id);
	}
}
