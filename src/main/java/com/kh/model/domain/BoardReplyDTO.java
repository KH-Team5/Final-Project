package com.kh.model.domain;

import java.util.Date;

import lombok.Data;
@Data
public class BoardReplyDTO{
/*
 * CREATE TABLE question_reply (
	rno number not null,
	q_index number not null,
	r_M_id varchar(30) not null,
	r_content varchar(600) not null,
	r_date DATE default sysdate,
	PRIMARY KEY(rno, q_index),
	FOREIGN KEY(q_index) REFERENCES question_tb(q_index));
 */
	
	private int rno;
	private int q_Index;
	private String m_Id;
	private String rp_content;
	private Date rp_Date;
}
