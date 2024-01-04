package br.brpltrade.util;

import java.nio.charset.StandardCharsets;
import java.security.GeneralSecurityException;
import java.security.Key;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.spec.KeySpec;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Base64;
import java.util.Date;
import java.util.UUID;

import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.brpltrade.service.HomeService;
import br.jpa.entity.User;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;

@Service
public class URLToken {
	private final String ALGORITHM = "AES";
	private long TIME = 0l;
	@Autowired
	HomeService hService;

	public String generateToken(String email) {
		String secretKey = getSecreateKey(email);
		Key key = new SecretKeySpec(Base64.getEncoder().encode(secretKey.getBytes()),
				SignatureAlgorithm.HS256.getJcaName());
		Claims claims = Jwts.claims();
		claims.put("email", email);
		Date now = new Date();
		Date expiration = new Date(now.getTime() + 5 * 60 * 1000);
		String jwt = Jwts.builder().setClaims(claims).setIssuedAt(now).setExpiration(expiration).signWith(key)
				.compact();

		return jwt;
	}

	public Jws<Claims> isTokenValid(String jwtString, String email) {
		String secret = getSecreateKey(email);
		Key key = new SecretKeySpec(Base64.getEncoder().encode(secret.getBytes()),
				SignatureAlgorithm.HS256.getJcaName());

		Jws<Claims> jwt = Jwts.parserBuilder().setSigningKey(key).build().parseClaimsJws(jwtString);

		return jwt;
	}

	private String getSecreateKey(String email) {
		User<String> user = hService.getUser(email);
		String SECRET_KEY = email + "&" + user.getUserPassword();
		return SECRET_KEY;
	}

	public  String getFixedSizeHash(String input) {
		try {

			MessageDigest sha256Digest = MessageDigest.getInstance("SHA-256");

			byte[] inputBytes = input.getBytes(StandardCharsets.UTF_8);

			byte[] hashBytes = sha256Digest.digest(inputBytes);

			StringBuilder hexString = new StringBuilder();
			for (byte hashByte : hashBytes) {
				String hex = Integer.toHexString(0xff & hashByte);
				if (hex.length() == 1) {
					hexString.append('0');
				}
				hexString.append(hex);
			}

			int fixedSize = 10;
			return hexString.substring(0, fixedSize);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}

}
