package br.brpltrade.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.security.web.util.matcher.*;

public class GSTAuthenticationFilter extends AbstractAuthenticationProcessingFilter {

	public GSTAuthenticationFilter() {
		super(new AntPathRequestMatcher("/login/gst", "POST"));
	}

	@Override
	public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
			throws AuthenticationException, IOException, ServletException {
		String gstNumber = request.getParameter("gst");
		String otp = request.getParameter("otp");
		GSTAuthenticationToken authRequest = new GSTAuthenticationToken(gstNumber, null);
		Authentication authentication = getAuthenticationManager().authenticate(authRequest);
		if (authentication == null) {
			try {
				return new GSTAuthenticationProvider().validateOtp(gstNumber, otp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return authentication;
	}

}
