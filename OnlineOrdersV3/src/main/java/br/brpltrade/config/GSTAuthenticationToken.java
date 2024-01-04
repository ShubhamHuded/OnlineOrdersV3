package br.brpltrade.config;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;

public class GSTAuthenticationToken extends UsernamePasswordAuthenticationToken {

	public GSTAuthenticationToken(Object principal, Object credentials) {
		super(principal, credentials);
	}

}
