package com.kh.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Import;


@Configuration
@EnableAspectJAutoProxy
@ComponentScan("com.kh.*")
@ComponentScan("com.kh.config.Auth")
@Import({SecurityConfig.class})
public class AppConfig {

}
