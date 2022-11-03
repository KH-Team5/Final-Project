package com.kh.config.Auth;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
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
		// username = M_id
		MemberDTO memberDTO = memberRepository.get(username);
		UserDetailsImpl userDetailsImpl = new UserDetailsImpl();
		if (memberDTO != null) {
			userDetailsImpl.setName(memberDTO.getM_name());
			userDetailsImpl.setUsername(memberDTO.getM_Id());
			userDetailsImpl.setPassword(memberDTO.getM_pwd());
			userDetailsImpl.setAuthorities(Arrays.asList(new SimpleGrantedAuthority(memberDTO.getRole())));
		}
		// 여기서 return된 UserDetails는 SecurityContext의 Authentication에 등록되어 인증 정보를 갖고 있는다.
		return userDetailsImpl;
	}

}
