package br.brpltrade.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import br.jpa.entity.PartyProfile;
import br.jpa.entity.PartyRegistry;
import br.jpa.entity.User;
import br.brpltrade.DataMapper.UserDto;
import br.brpltrade.jpa.entity.SubUser;
import br.brpltrade.repository.CompanyRepository;
import br.brpltrade.repository.PartyRegistryRepo;
import br.brpltrade.repository.SubUserRepository;
import br.brpltrade.repository.UserRepository;

@Service
public class HomeService {

	@Autowired
	UserRepository repo;

	@Autowired
	CompanyRepository crepo;

	@Autowired
	PartyRegistryRepo partyRegisRepo;

	@Autowired
	SubUserRepository subRepo;

	@Autowired
	private PasswordEncoder passwordEncoder;

	// I can use @AuthenticationPrincipal CustomUser customUser, CsrfToken token
	// instead of SecurityContextHolder
	public String getUserType() {
		Authentication authen = SecurityContextHolder.getContext().getAuthentication();
		List<GrantedAuthority> li = new ArrayList<>(authen.getAuthorities());
		return li.get(Resources.ADMIN_INX).getAuthority();
	}

	public String getUserName() {
		Authentication authen = SecurityContextHolder.getContext().getAuthentication();
		String name = authen.getName();
		User<String> user = repo.getReferenceById(name);
		return user.getUserFirstName() + " " + user.getUserLastName();
	}

	public User<String> getUser() {
		Authentication authen = SecurityContextHolder.getContext().getAuthentication();
		String name = authen.getName();
		User<String> user = repo.getReferenceById(name);
		return user;
	}

	public User<String> getUser(String email) {
		User<String> user = null;
		PartyRegistry<String> party = partyRegisRepo.getReferenceById(email);
		if (party != null) {
			return party;
		} else {
			SubUser<String> sub = subRepo.getReferenceById(email);
			if (sub != null)
				return sub;
		}
		return user;
	}

	public String getuserEmail() {
		Authentication authen = SecurityContextHolder.getContext().getAuthentication();
		String name = authen.getName();
		return name;
	}

	public boolean isCompanyApproved() {
		PartyProfile<Integer> party = crepo.findByPartyRegistry(getpartyRegistry());
		if (party == null)
			return false;
		return byteToBoolean(party.getIsApproved());
	}

	private boolean byteToBoolean(byte value) {
		return value != 0;
	}

	public PartyRegistry<String> getpartyRegistry() {
		if (getUserType().equalsIgnoreCase("Admin")) {
			String email = getuserEmail();
			return partyRegisRepo.getReferenceById(email);
		} else {
			return subRepo.getReferenceById(getuserEmail()).getPartyRegistry();
		}
	}

	public Authentication getAuthentication() {
		Authentication authen = SecurityContextHolder.getContext().getAuthentication();
		return authen;
	}

	public boolean isOldPassCorrect(String pass) {
		if (getUserType().equalsIgnoreCase("Admin"))
			return passwordEncoder.matches(pass, partyRegisRepo.getReferenceById(getuserEmail()).getUserPassword());
		else
			return passwordEncoder.matches(pass, subRepo.getReferenceById(getuserEmail()).getUserPassword());
	}

	public void updatePassword(String pass) {
		if (getUserType().equalsIgnoreCase("Admin")) {
			PartyRegistry<String> party = partyRegisRepo.getReferenceById(getuserEmail());
			party.setUserPassword(passwordEncoder.encode(pass));
			partyRegisRepo.save(party);
		} else {
			SubUser<String> sub = subRepo.getReferenceById(getuserEmail());
			sub.setUserPassword(passwordEncoder.encode(pass));
			subRepo.save(sub);
		}
	}

	public boolean isUserExist(String email) {
		PartyRegistry<String> party = partyRegisRepo.getReferenceById(email);
		if (party != null) {
			return true;
		} else {
			SubUser<String> sub = subRepo.getReferenceById(email);
			if (sub != null)
				return true;
		}
		return false;

	}

	public List<User<String>> getAllUser() {
		return repo.findAll();
	}

	public JSONArray getUserListInJson() {
		List<User<String>> list = getAllUser();
		List<UserDto> newList = list
				.stream().map((User user) -> new UserDto(user.getUserFirstName(), user.getUserLastName(),
						user.getUserMobile(), user.getUserType(), user.getUserEmailId().toString()))
				.collect(Collectors.toList());
		JSONArray array = new JSONArray();
		for (UserDto user : newList) {
			JSONObject obj = new JSONObject(user);
			array.put(obj);
		}
		return array;
	}
}
