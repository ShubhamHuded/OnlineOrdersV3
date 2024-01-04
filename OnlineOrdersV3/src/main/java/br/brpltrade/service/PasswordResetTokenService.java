package br.brpltrade.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import br.brpltrade.entity.PasswordResetToken;
import br.brpltrade.repository.PartyRegistryRepo;
import br.brpltrade.repository.PasswordResetRepository;
import br.brpltrade.repository.SubUserRepository;
import br.brpltrade.repository.UserRepository;
import br.brpltrade.util.Mail;
import br.brpltrade.util.URLToken;
import br.jpa.entity.User;
import br.util.email.BrMessageImpl;
import br.util.email.EmailService;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;

@Service
public class PasswordResetTokenService {

	@Autowired
	HomeService hService;

	@Autowired
	PasswordResetRepository passRepo;

	@Autowired
	URLToken urlToken;

	@Autowired
	SubUserRepository subRepo;

	@Autowired
	PartyRegistryRepo partyRepo;

	@Autowired
	UserRepository repo;

	@Autowired
	PasswordEncoder passwordEncode;

	public void sendMailToResetThePassword(String email) throws Exception {
		// hService.isUserExist(email)
		if (true) {
			String token = urlToken.generateToken(email);
			String url = "http://34.131.0.25:8082/new-password?token=" + token;
			saveToken(token, email);
			Mail.sendResetpasswordEmail(email, url);
		}
	}

	private void saveToken(String token, String email) {
		PasswordResetToken pass = new PasswordResetToken();
		pass.setToken(urlToken.getFixedSizeHash(token));
		pass.setTokenExpiry(System.currentTimeMillis());
		pass.setUserId(email);
		passRepo.save(pass);
	}

	public String updatePasswordFromToken(String token) {
		PasswordResetToken passObj = passRepo.findByToken(urlToken.getFixedSizeHash(token));
		Jws<Claims> claims = urlToken.isTokenValid(token, passObj.getUserId());
		return (String) claims.getBody().get("email");
	}

	public void updatePassword(String email, String password) {
		User<String> user = hService.getUser(email);
		user.setUserPassword(passwordEncode.encode(password));
		repo.save(user);
	}

}
