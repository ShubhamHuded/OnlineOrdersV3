package br.brpltrade.config;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import br.brpltrade.controler.SessionFilter;

@Configuration
public class SessionValidationConfig {

	/*
	 * @Bean public FilterRegistrationBean<SessionFilter> sessionValidationFilter()
	 * { FilterRegistrationBean<SessionFilter> registrationBean = new
	 * FilterRegistrationBean<>(); registrationBean.setFilter(new SessionFilter());
	 * registrationBean.addUrlPatterns("/app/*"); return registrationBean; }
	 */
}
