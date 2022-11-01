package com.kh.model.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class CartDTO {
	private int C_id;
	private int P_id;
	private int C_qty;
	private String P_name;
	private int P_price;
	private String M_id;
	private int totalPrice;

}
