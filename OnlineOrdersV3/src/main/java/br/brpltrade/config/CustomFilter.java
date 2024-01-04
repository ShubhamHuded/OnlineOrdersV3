//package br.brpltrade.config;
//
//import java.io.IOException;
//
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.http.HttpServletRequest;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.core.annotation.Order;
//import org.springframework.security.authentication.AuthenticationManager;
//import org.springframework.security.authorization.AuthorizationManager;
//import org.springframework.security.web.access.intercept.AuthorizationFilter;
//import org.springframework.stereotype.Component;
//
//@Component
//
//public class CustomFilter extends AuthorizationFilter {
//	
//	@Autowired
//	static
//	AuthenticationManager authManagera;
//	@Autowired
//	public CustomFilter(AuthenticationManager authManager) {
//		super((AuthorizationManager<HttpServletRequest>) (authManager=authManagera));
//
//	}
//
//	@Override
//	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
//			throws IOException, ServletException {
//
//		System.out.println(request.getAttribute("userPassword"));
//		System.out.println(request.getAttribute("userEmailNumber"));
//		chain.doFilter(request, response);
//
//	}
//
//}
