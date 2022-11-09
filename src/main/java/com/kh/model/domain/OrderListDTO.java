package com.kh.model.domain;

import java.util.List;

import lombok.Data;

@Data
public class OrderListDTO {
	private List<OrderItemDTO> orders;
}
