package br.brpltrade.config;

public class LoginRequest {
	private String usernameOrEmail;
	private String password;

	// getters and setters

	public LoginRequest(String usernameOrEmail, String password) {
		this.usernameOrEmail = usernameOrEmail;
		this.password = password;
	}
}
