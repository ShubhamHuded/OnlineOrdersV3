package br.brpltrade.controler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import br.brpltrade.DataMapper.UtilityMapper;
import br.brpltrade.service.HomeService;
import br.brpltrade.service.PasswordResetTokenService;
import br.brpltrade.service.UserService;
import br.jpa.entity.User;

@Controller
public class AjaxUtil {
	@Autowired
	UserService userService;
	@Autowired
	UtilityMapper mapper;

	@Autowired
	HomeService homeService;

	@Autowired
	PasswordResetTokenService pasResetService;

	@RequestMapping("/updatePassword")
	public String getUpdatePasswordView(Model model) {
		model.addAttribute("name", homeService.getUserName());
		model.addAttribute("type", homeService.getUserType());
		return "Login/PasswordChange";
	}

	@PostMapping("/verify-old-pass")
	public ResponseEntity verifyOldPass(@RequestParam String oldpass) {
		if (homeService.isOldPassCorrect(oldpass))
			return ResponseEntity.ok().body(null);
		else
			return ResponseEntity.status(400).body(null);
	}

	@PostMapping("/update-reset")
	public ResponseEntity updatePassowrd(@RequestParam String password) {
		try {
			homeService.updatePassword(password);
			return ResponseEntity.ok().body(null);
		} catch (Exception ex) {
			return ResponseEntity.status(400).body(null);
		}
	}

	@PostMapping("/reset-password")
	public ResponseEntity resetPassword(@RequestParam String email) {
		try {
			pasResetService.sendMailToResetThePassword(email);
			return ResponseEntity.ok().body(null);
		} catch (Exception ex) {
			return ResponseEntity.status(400).body(null);
		}
	}

	@GetMapping("/new-password")
	public String getResetpasswordView(@RequestParam(name = "token") String token) {
		return "util/passwordReset";
	}

	@PostMapping("/process-new-password")
	public ResponseEntity updateResetPassword(@RequestParam(name = "token") String token,
			@RequestParam(name = "password") String password) {
		try {
			if (token == null || token.equalsIgnoreCase(""))
				return ResponseEntity.status(400).body(null);
			else {
				String email = pasResetService.updatePasswordFromToken(token);
				pasResetService.updatePassword(email, password);
				return ResponseEntity.ok().body(null);
			}
		} catch (Exception ex) {
			return ResponseEntity.status(400).body(null);
		}
	}

	@GetMapping("/terms-condition")
	public String getTermsAndConditionView() {
		return "home/TermAndCondition";
	}

	@GetMapping("/edit-Profile")
	public String getUserProfile(Model model) {
		User<String> user = homeService.getUser();
		String type = homeService.getUserType();
		model.addAttribute("type", type);
		model.addAttribute("name", homeService.getUserName());
		model.addAttribute("user", user);
		return "home/editprofile";
	}

}
