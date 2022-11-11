package com.kh.model.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberDTO {
	
	private String m_Id;
	private String M_pwd;
	private String M_name;
	private String email;
	private String contact;
	private int zipcode;
	private String address;
	private String detail_address;
	private String joined_date;
	private String role;

}