package br.brpltrade.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import br.jpa.entity.User;
import br.brpltrade.DataMapper.BPCollabrationDTO;
import br.brpltrade.repository.UserRepository;

@Component
public class UserDetailsServiceImp implements UserDetailsService {

	@Autowired
	private UserRepository userRepository;

	private User<String> user = null;

	BPCollabrationDTO bpDTO = null;

	@Autowired
	private UserDetailsService userDetailsService;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		String emailOrPhone =  (username);

//		try {
//			if (BPCollabrationLogin.isBPcollbrator(username)) {
//				bpDTO = BPCollabrationLogin.getBPCollabrationDTO(username);
//				if (bpDTO == null) {
//					throw new UsernameNotFoundException("User not found with username: " + username);
//				}
//				System.out.println(passwordEncoder().encode(bpDTO.getUser_password()));
//				return new org.springframework.security.core.userdetails.User(bpDTO.getUser_email(),
//						passwordEncoder().encode(bpDTO.getUser_password()), getAuthorities(bpDTO.getUser_type()));
//
//			} else {
//				System.out.println("User not found with username: " + username);
//			}
//
//		} catch (SQLException e) {
//
//			e.printStackTrace();
//		}

		if (emailOrPhone.equals("Email"))
			user = userRepository.findByUserEmailId(username);
		else if (emailOrPhone.equals("Phone Number"))
			user = userRepository.findByUserMobile(username);

		if (user == null) {
			throw new UsernameNotFoundException("User not found with username: " + username);
		}

		return new org.springframework.security.core.userdetails.User(user.getUserEmailId(), user.getUserPassword(),
				getAuthorities(user.getUserType()));

	}

	private Collection<GrantedAuthority> getAuthorities(String userTYpe) {
		GrantedAuthority authority = new SimpleGrantedAuthority(userTYpe);
		List<GrantedAuthority> authorities = new ArrayList<>();
		authorities.add(authority);
		return authorities;
	}

	private String checkEmailOrPhoneNumber(String input) {
		// Regular expressions for email and phone number patterns
		String emailPattern = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
		String phonePattern = "^[+]?[(]?[0-9]+[)]?[-\\s.]?[0-9]+[-\\s.]?[0-9]+$";

		// Create Pattern objects for the email and phone number patterns
		Pattern emailRegex = Pattern.compile(emailPattern);
		Pattern phoneRegex = Pattern.compile(phonePattern);

		// Create Matcher objects for the input and the patterns
		Matcher emailMatcher = emailRegex.matcher(input);
		Matcher phoneMatcher = phoneRegex.matcher(input);

		// Check if the input matches the email or phone number pattern
		if (emailMatcher.matches()) {
			return "Email";
		} else if (phoneMatcher.matches()) {
			return "Phone Number";
		} else {
			return "Neither Email nor Phone Number";
		}
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public UserDetailsService userDetailsService() {
		UserDetails admin = org.springframework.security.core.userdetails.User.builder().username("BRPL@BRPL.com")
				.password(passwordEncoder().encode("Brpl@123")).roles("SUPER ADMIN").build();
		return new InMemoryUserDetailsManager(admin);
	}

	private void callGetToDoWithString() {

		RestTemplate restTemplate = new RestTemplate();

		// String uri = "https://jsonplaceholder.typicode.com/todos/1";
		String uri = "http://localhost:8080/api/auth/signin";
		Map<String, String> userData = new HashMap<>();
		userData.put("usernameOrEmail", "leanne.graham@gmail.com");
		userData.put("password", "password");

		HttpHeaders headers = new HttpHeaders();
		// headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		headers.setContentType(MediaType.APPLICATION_JSON);
		String credentials = "username:password";
		String base64Credentials = Base64.getEncoder().encodeToString(credentials.getBytes());
		headers.set("Authorization", "Basic " + base64Credentials);
		HttpEntity<Map<String, String>> requestEntity = new HttpEntity<>(userData, headers);

		System.out.println("the uri" + uri);
		System.out.println("Printing GET Response in String");
		ResponseEntity<String> result = restTemplate.exchange(uri, HttpMethod.POST, requestEntity, String.class);
		System.out.println(result.getHeaders());

		String uri1 = "http://localhost:8080/api/auth/signup";
		Map<String, String> userDataa = new HashMap<>();
		userDataa.put("firstName", "leanyne1.graham@gmail.com");
		userDataa.put("lastName", "Grahaymv");
		userDataa.put("username", "Grahayssmv");
		userDataa.put("password", "passwoyrd1");
		userDataa.put("email", "leannea.grahyam@gmail.com");
		HttpEntity<Map<String, String>> requestEntity1 = new HttpEntity<>(userDataa, headers);
		ResponseEntity<String> result1 = restTemplate.exchange(uri1, HttpMethod.POST, requestEntity1, String.class);

		System.out.println(" ");
		System.out.println("Printing GET Response in String ");

		System.out.println(result);
	}
}
