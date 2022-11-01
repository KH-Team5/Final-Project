package com.kh.model.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberUpdateDTO {
	
	private String M_pwd;
	private String M_name;
	private String contact;
	private int zipcode;
	private String address;
	private String detail_address;
	private String joined_date;
	

}
