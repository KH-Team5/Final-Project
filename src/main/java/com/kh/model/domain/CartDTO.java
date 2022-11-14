package com.kh.model.domain;

import java.util.List;

import lombok.Data;

@Data
public class CartDTO {

	private int ca_Id;

	private String m_Id;

	private int p_Id;

	private int p_Cnt;

	private String p_Name;

	private int p_Price;

	private int totalPrice;

	private List<AttachImageDTO> imageList;

	public void initSaleTotal() {
		this.totalPrice = this.p_Price * this.p_Cnt;
	}
}
