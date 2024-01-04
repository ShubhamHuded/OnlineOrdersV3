package br.brpltrade.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import br.brpltrade.repository.GSTEntityRepository;
import br.brpltrade.service.GSTOTPService;
public class GSTAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	GSTEntityRepository repo;

	@Autowired
	GSTOTPService optService;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String gstNumber = authentication.getName();
		try {
			String otp = optService.generateOtp("");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return false;
	}

	public Authentication validateOtp(String gstNumber, String otp) throws Exception {
		boolean isValid = optService.validateOTP(gstNumber, otp);
		if (isValid) {
			List<GrantedAuthority> authorities = new ArrayList<>();
			authorities.add(new SimpleGrantedAuthority("Admin"));
			GSTAuthenticationToken authentication = new GSTAuthenticationToken(gstNumber, authorities);
			return authentication;
		} else {
			throw new Exception();
		}
	}

}
