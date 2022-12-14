package com.kh.model.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Criteria {
	private int pageNum;
	private int amount;
	private int p_Id;
	private String type;
	private String keyword;
	private String c_Code;

	public Criteria() {
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
}
