package com.kh.config.Auth;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserDetailsImpl implements UserDetails {
	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;
	private String username; // DB에서 PK 값(M_id)
	private String password; // 비밀번호 (M_pw)
	private String name; // (M_name)
	private Collection<GrantedAuthority> authorities; // 권한 목록

	/**
	 * 계정 만료 여부 true: 만료 안됨 false: 만료
	 */
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	/**
	 * 비밀번호 만료 여부 true: 만료 안됨 false: 만료
	 */
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	/**
	 * 계정 잠김 여부 true : 잠기지 않음 false : 잠김
	 */
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	/**
	 * 사용자 활성화 여부 ture: 활성화 false: 비활성화
	 */
	@Override
	public boolean isEnabled() {
		return true;
	}

}
