package br.brpltrade.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.brpltrade.DataMapper.NewUser;
import br.jpa.entity.PartyRegistry;
import br.jpa.entity.User;
import br.brpltrade.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	UserRepository repo;



	@Autowired
	private PasswordEncoder passwordEncoder;

	public boolean isUserExist(String email) {
		User<String> user = repo.findByUserEmailId(email);
		if (user != null)
			return true;
		return false;
	}

	public boolean isUserExistBygivenMobile(String mobile) {
		User<String> user = repo.findByUserMobile(mobile);
		if (user != null)
			return true;
		return false;
	}

	public User<String> getUser(String email) {
		User<String> user = repo.findByUserEmailId(email);
		return user;
	}

	public User<String> getUserThroghMobile(String mobile) {
		User<String> user = repo.findByUserMobile(mobile);
		return user;
	}

	public User<String> getUserEntityFromUserDto(NewUser user) {
		User<String> userE = getUser(user.getUserEmailId());
		return userE;
	}

	@Transactional
	public User<String> saveUser(NewUser user) {
		User<String> userE = new PartyRegistry<String>();
		userE.setUserEmailId(user.getUserEmailId());
		userE.setUserFirstName(user.getUserFirstName());
		userE.setUserLastName(user.getUserLastName());
		userE.setUserMobile(user.getUserMobile());
		userE.setUserPassword(passwordEncoder.encode(user.getUserPassword()));
		userE.setUserType("Admin");
		userE = repo.save(userE);
		return userE;
	}

	public boolean isEmail(String email) {
		String emailPattern = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
		if (email.matches(emailPattern))
			return true;
		return false;
	}

}
