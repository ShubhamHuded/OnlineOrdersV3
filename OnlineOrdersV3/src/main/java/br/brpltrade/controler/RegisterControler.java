package br.brpltrade.controler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import br.brpltrade.DataMapper.NewUser;
import br.jpa.entity.User;
import br.brpltrade.service.UserService;

@Controller
@RequestMapping("/auth")
public class RegisterControler {

	@Autowired
	private UserService service;
    
	@GetMapping("/create-account")
	public String home(Model modal) {
		modal.addAttribute("fieldRequired", true);
		return "Login/createAccount";
	}
	
	@PostMapping("/subit-new-account")
	public ResponseEntity processNewUser(@RequestBody NewUser newUser) {
		ResponseEntity onk;
		if (service.isUserExist(newUser.getUserEmailId())) {
			ResponseEntity.status(400).body("user alredy exist with given email");
		}
		try {
			User<String> user = service.saveUser(newUser);
			if(user != null)
				onk = ResponseEntity.ok().body("Account is Created Successfully");
			else 
				onk =ResponseEntity.status(500).body("some technical error try after some time");
		} catch (Exception ex) {
			onk =ResponseEntity.status(500).body("Internal server error, try after some time");
		}
		return onk;
	}
}
