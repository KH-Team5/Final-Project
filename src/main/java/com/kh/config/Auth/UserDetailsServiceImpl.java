package com.kh.config.Auth;

import java.util.Arrays;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.kh.model.MemberRepository;
import com.kh.model.domain.MemberDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserDetailsServiceImpl implements UserDetailsService {
	
	private final MemberRepository memberRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberDTO memberDTO = memberRepository.get(username);
		UserDetailsImpl userDetailsImpl = new UserDetailsImpl();
		if (memberDTO != null) {
			userDetailsImpl.setName(memberDTO.getM_name());
			userDetailsImpl.setUsername(memberDTO.getM_Id());
			userDetailsImpl.setPassword(memberDTO.getM_pwd());
			userDetailsImpl.setAuthorities(Arrays.asList(new SimpleGrantedAuthority(memberDTO.getRole())));
		}
		return userDetailsImpl;
	}

}