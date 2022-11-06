package com.kh.model.domain;

import lombok.Data;

@Data
public class OrderCancelDTO {
	private String m_Id;

	private String o_Id;

	private String keyword;

	private int amount;

	private int pageNum;
}
