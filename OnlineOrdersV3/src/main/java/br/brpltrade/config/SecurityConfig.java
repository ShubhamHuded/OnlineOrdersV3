package br.brpltrade.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.access.intercept.AuthorizationFilter;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.session.jdbc.config.annotation.web.http.EnableJdbcHttpSession;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.client.WebClient;

import br.brpltrade.service.UserDetailsServiceImp;

@Configuration
@EnableWebSecurity
@EnableJdbcHttpSession
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	UserDetailsServiceImp userDetailsService;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.headers().frameOptions().sameOrigin().and().csrf().disable().authorizeRequests()
				.antMatchers("/javascript/**").permitAll().antMatchers("/css/**").permitAll().antMatchers("/auth/**")
				.permitAll().antMatchers("/").permitAll().antMatchers("/images/**").permitAll()
				.antMatchers("/images/**").permitAll().antMatchers("/live-rates").permitAll()
				.antMatchers("/template/**").permitAll().antMatchers("/Trader/response.js p").permitAll()
				.antMatchers("/app/**").permitAll().antMatchers("/reset-password").permitAll()
				.antMatchers("/new-password").permitAll().antMatchers("/process-new-password").permitAll()
				.antMatchers("/login/gst").permitAll().antMatchers("/terms-condition").permitAll()
				.antMatchers("/get-live-data").permitAll().anyRequest().authenticated().and().formLogin()
				.defaultSuccessUrl("/home", true).loginPage("/app/login").loginProcessingUrl("/authenticate")
				.failureHandler(new CustomAuthenticationFailureHandler()).and().sessionManagement()
				.sessionCreationPolicy(SessionCreationPolicy.ALWAYS).invalidSessionUrl("/").maximumSessions(1)
				.maxSessionsPreventsLogin(false).and().and().logout().logoutUrl("/logout").deleteCookies("JSESSIONID")
				.invalidateHttpSession(true);
	}
//
//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
//		// ...
//		http.authorizeRequests().antMatchers("/auth/signin").permitAll() // Allow login API
//				.anyRequest().authenticated().and()
//				.addFilterBefore(new JwtAuthenticationFilter(authenticationManager()),
//						UsernamePasswordAuthenticationFilter.class);
//	}
//	
//
//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
//	    // ... other configurations
//		
//	    http 
//	        .formLogin()
//	        .loginPage("/app/login")
//	        .loginProcessingUrl("/Online-Orders/authenticate")
//	        .successHandler((request, response, authentication) -> {
//	            // Communicate with authentication server to get JWT
//					LoginRequest loginRequest = new LoginRequest(
//							request.getParameter("username"), request.getParameter("password"));
//	            String jwt = webClientBuilder()
//	                            .build()
//	                            .post()
//	                            .uri("http://localhost:8080/api/auth/signin")
//	                            .body(BodyInserters.fromValue(loginRequest))
//	                            .retrieve()
//	                            .bodyToMono(String.class)
//	                            .block();
//	            // Process JWT as needed
//	            // ...
//
//	            // Redirect to home page or other success page
//	            response.sendRedirect("/home");
//	        })
//	        .failureHandler(new CustomAuthenticationFailureHandler());
//	        // ... other configurations
	// }

	@Bean
	public WebClient.Builder webClientBuilder() {
		return WebClient.builder();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService);
	}

	@Bean
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}

//	@Autowired
//	private HttpSecurity requestFiltera;
//	@Autowired
//	CustomFilter requestFilter;
//
//	@Bean
//	public FilterRegistrationBean<CustomFilter> loggingFilter() {
//		FilterRegistrationBean<CustomFilter> registrationBean = new FilterRegistrationBean<>();
//		registrationBean.setFilter(requestFilter);
//		registrationBean.addUrlPatterns("/Online-Orders/app/login");
//		registrationBean.setOrder(Ordered.HIGHEST_PRECEDENCE);
//		requestFiltera.addFilterBefore(requestFilter, );
//		return registrationBean;
//	}
}
