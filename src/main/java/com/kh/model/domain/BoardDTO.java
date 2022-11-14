package com.kh.model.domain;



import java.security.Principal;
import java.util.Date;

import lombok.Data;

@Data
public class BoardDTO {
	private int rn = 0;
     private int q_Index;
     private String m_Id;
     private String q_Category;
     private String q_Title;
     private String q_Content;
     private Date q_Date;
     
}
