package com.kh.semiteam3.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.kh.semiteam3.interceptor.AdminInterceptor;
import com.kh.semiteam3.interceptor.MemberInterceptor;

@Configuration
public class InterceptorConfiguration implements WebMvcConfigurer{
	
	@Autowired
	private MemberInterceptor memberInterceptor;
	@Autowired
	private AdminInterceptor adminInterceptor;
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(memberInterceptor)
					.addPathPatterns(
							"/member/**",
							"/qna/**",
							"/basketball/**",
							"/football/**",
							"/baseball/**",
							"/esports/**"						
							)
					.excludePathPatterns(
							"/member/join*",
							"/member/login",
							"/baskerball/list", "/basketball/detail",
							"/football/list", "/football/detail",
							"/baseball/list", "/baseball/detail",
							"/esports/list", "/esports/detail"
							);
		
		// 관리자 인터셉터 등록
		registry.addInterceptor(adminInterceptor).addPathPatterns("/admin/**");
		
	}	

}
