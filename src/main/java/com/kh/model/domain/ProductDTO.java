package com.kh.model.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductDTO {
	private int p_id;
	private String p_name;
	private int p_price;
	private int p_stock;
	private String p_category;
	private String c_Name;
	private String p_date;
}
