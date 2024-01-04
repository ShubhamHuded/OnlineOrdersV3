package br.brpltrade.controler;

import javax.annotation.security.PermitAll;

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
import br.brpltrade.service.UserService;
import maipl.db.RdbUserHelper;

@Controller
@RequestMapping("/auth")
@PermitAll
public class UserAuthentication {
	@Autowired
	UserService userService;
	@Autowired
	UtilityMapper mapper;

	@PostMapping(value = "/verify-email")
	public ResponseEntity verifyEmail(@RequestParam("email") String email) {
		if (userService.isUserExist(email))
			return ResponseEntity.ok().body(null);
		else
			return ResponseEntity.status(400).body(null);
	}

	@PostMapping(value = "/verify-mobile")
	public ResponseEntity verifyMobile(@RequestParam("user_mobile") String mobile) {
		if (userService.isUserExistBygivenMobile(mobile))
			return ResponseEntity.ok().body(null);
		else
			return ResponseEntity.status(400).body(null);
	}  
	
	@GetMapping(value = "/otp")
	public String verifyOtp(Model model) {
		return "Login/OtpVerification";
	}
	
	
	@PostMapping(value = "/generate-otp")
	public ResponseEntity<String> generateOtp(@RequestParam("email") String email) {
		try {
			RdbUserHelper.otpEmailNotify(email, 0);
			return ResponseEntity.ok().body("An OTP (One-Time Password) has been sent to your email "+email);
		} catch (Exception e) {
			mapper.setSUCESS_ERROR("An Error is occured in the server please, try again some time. ");
			return ResponseEntity.status(500).body("An Error is occured in the server please, try again some time. ");
		}
	}
	
	@PostMapping(value = "/verifyOtp")
	public ResponseEntity<UtilityMapper> verifyOtp(@RequestParam("otp") String otp,
			@RequestParam("email") String email) {
		try {
			boolean result = RdbUserHelper.otpCheckForRegistration(new String[] { email, otp });
			if (result) {
				mapper.setSUCESS_ERROR("OTP is verified");
				return ResponseEntity.ok().body(mapper);
			} else {
				mapper.setSUCESS_ERROR("Bad Request, sent Wrong Otp");
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(mapper);
			}

		} catch (Exception e) {
			mapper.setSUCESS_ERROR("An Error is occured in the server please, try again some time. ");
			return ResponseEntity.ok().body(mapper);
		}
	}
}
