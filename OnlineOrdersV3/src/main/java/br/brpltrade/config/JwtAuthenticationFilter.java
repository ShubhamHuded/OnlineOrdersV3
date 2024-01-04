package br.brpltrade.config;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

//@Component
//public class JwtAuthenticationFilter extends OncePerRequestFilter {
//
//	private final AuthenticationManager authenticationManager;
//
//	private static final String[] IGNORED_URL = { "/login", "Online-Orders/app/login", "/api/auth/signin" };
//
//	public JwtAuthenticationFilter(AuthenticationManager authenticationManager) {
//		this.authenticationManager = authenticationManager;
//	}
//
//	@Override
//	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
//			throws ServletException, IOException {
//		// Extract JWT from request and authenticate
//		// ...
//
//		if (!request.getRequestURI().equalsIgnoreCase("/api/auth/signin")) {
//
//		}
//		filterChain.doFilter(request, response);
//	}
//
//	@Override
//	protected boolean shouldNotFilter(HttpServletRequest request) throws ServletException {
//		String requestUri = request.getRequestURI();
//		for (String ignoredUrl : IGNORED_URL) {
//			if (requestUri.startsWith(ignoredUrl)) {
//				return true;
//			}
//		}
//		return false; // Continue with the filter for other URLs
//	}
//}
