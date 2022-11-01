package com.kh.model.domain;

import lombok.Data;

@Data
public class AttachImageDTO {

	private String uploadPath;
	private String uuid;
	private String fileName;
	private int p_Id;
}
