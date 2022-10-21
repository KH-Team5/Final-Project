package com.kh.config.Auth;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.kh.model.MemberRepository;
import com.kh.model.domain.MemberDTO;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
	@Autowired
	private MemberRepository memberRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberDTO memberDTO = memberRepository.get(username);
		UserDetailsImpl userDetailsImpl = new UserDetailsImpl();
		if (memberDTO != null) {
			userDetailsImpl.setName(memberDTO.getM_name());
			userDetailsImpl.setUsername(memberDTO.getM_id());
			userDetailsImpl.setPassword(memberDTO.getM_pwd());
			List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
			authorities.add(new SimpleGrantedAuthority(memberDTO.getRole()));
			userDetailsImpl.setAuthorities(authorities);
		}
		// 여기서 return된 UserDetails는 SecurityContext의 Authentication에 등록되어 인증 정보를 갖고 있는다.
		return userDetailsImpl;
	}

}
