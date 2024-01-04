package br.brpltrade.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "u_password_reset_tokens")
public class PasswordResetToken {

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "user_id", length = 36)
	private String userId;

	@Column(name = "token", length = 128, unique = true, nullable = false)
	private String token;

	@Column(name = "token_expiry", nullable = false)
	private Long tokenExpiry;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public Long getTokenExpiry() {
		return tokenExpiry;
	}

	public void setTokenExpiry(Long tokenExpiry) {
		this.tokenExpiry = tokenExpiry;
	}

}
