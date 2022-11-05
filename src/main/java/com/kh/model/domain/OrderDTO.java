package com.kh.model.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderDTO {
	private int o_Id;

	private String m_Name;

	private String m_Id;

	private String o_address;

	private String o_detail_address;

	private int o_Zipcode;

	private String o_state;

	private List<OrderItemDTO> orders;

	private Date o_Date;

	private int o_delivery_charge;

	private int orderSalePrice;

	private String p_Name;
}
