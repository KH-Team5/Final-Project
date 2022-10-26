
package com.kh.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.method.annotation.AuthenticationPrincipalArgumentResolver;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private UserDetailsService UserDetailsServiceImpl;

	@Bean
	public AuthenticationPrincipalArgumentResolver authenticationPrincipalArgumentResolver() {
		return new AuthenticationPrincipalArgumentResolver();
	}
	
	/**
	 * DB 패스워드 암호화 암호를 인코딩하거나, 인코딩된 암호와 사용자가 입력한 암호가 같은지 확인할 때 사용
	 */
	@Bean
	public PasswordEncoder passwordencoder() {
		return new BCryptPasswordEncoder();
	}
	
	
	/**
	 * 인코딩된 암호와 사용자가 입력한 암호가 같은지 확인
	 */
	@Bean
	public AuthenticationProvider authenticationProvider() {
		DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
		authProvider.setUserDetailsService(UserDetailsServiceImpl);
		authProvider.setPasswordEncoder(passwordencoder());
		return authProvider;
	}

	/**
	 * UserDetailService 설정 
	 * 사용자 세부 서비스를 설정
	 * Provider 설정
	 */
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(UserDetailsServiceImpl)
		.and()
		.authenticationProvider(authenticationProvider());
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
	}

	/**
	 * 경로별 접근 제한
	 */
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();
		http.authorizeRequests()
			// 페이지 권한 설정
			.antMatchers("/member/login", "/member/join/**", "/member/findPage/**").permitAll()
			// /admin 으로 시작하는 경로는 ADMIN 롤을 가진 사용자만접근 가능
			.antMatchers("/admin/**").hasRole("ADMIN")
			// /member 경로는 USER, ADMIN 롤을 가진 사용자만 접근 가능
			.antMatchers("/member/**").hasAnyRole("USER", "ADMIN")
			// 그게 아닌 모든 주소는 인증 필요 없음
			.anyRequest().permitAll().and()
			// 로그인 설정
			.formLogin()
			// 인증필요한 주소로 접속하면 이주소로 이동시킴
			.loginPage("/member/login")
			// 이 주소로 form 전송
			.loginProcessingUrl("/login-process")
			// 로그인이 정상적이면 "/" 로 이동
			.defaultSuccessUrl("/")
			// 로그인 요청시 id용 파라미터 (메소드 이름이 usernameParameter로 무조건써야하지만,
			// 파라미터는 email이든 id이든 name이든 상관없다.)
			.usernameParameter("userid")
			// 로그인 요청시password용 파라미터
			.passwordParameter("password").and()
			// 로그아웃 설정
			.logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
			// 로그아웃 성공시
			.logoutSuccessUrl("/").invalidateHttpSession(true);
	}

}
