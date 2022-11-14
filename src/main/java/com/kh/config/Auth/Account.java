package com.kh.config.Auth;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class Account {
	private String username;

	private String password;

	private String name;
}
