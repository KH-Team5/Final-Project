package com.kh.model.domain;

import java.util.List;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
@Data
public class ProductDTO {
	private int p_Id;
	
	private String p_Name;
	
	private int p_Price;
	
	private int p_Stock;
	
	private String p_Category;
	
	private String c_Name;
	
	private String p_Date;
	
	private String p_Intro;
	
	private List<AttachImageDTO> imageList;
	
	private double p_RatingAvg;
}
