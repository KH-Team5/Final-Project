package com.kh.config.Auth;

import org.springframework.security.core.SpringSecurityCoreVersion;

public class UserDetailsAdapter extends UserDetailsImpl {
	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;
	private Account account;

	public UserDetailsAdapter(Account account) {
		this.account = account;
	}

	@Override
	public String getUsername() {
		return account.getUsername();
	}

	@Override
	public String getPassword() {
		return account.getPassword();
	}
}
