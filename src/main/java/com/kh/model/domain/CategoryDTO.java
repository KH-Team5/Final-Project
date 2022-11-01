package com.kh.model.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CategoryDTO {
	private int c_Tier;

	private String c_Name;

	private String c_Code;

	private String c_Parent;
}
