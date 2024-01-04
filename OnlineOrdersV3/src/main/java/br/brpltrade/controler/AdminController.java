package br.brpltrade.controler;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;

import br.brpltrade.AOP.LogUserActivity;
import br.brpltrade.service.AdminService;
import br.jpa.entity.User;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService adminService;

	@GetMapping("/dashboard")
	@LogUserActivity(action = "DASH_BOARD VIEW", includeParameters = false)
	public String adminLogin() {
		return "admins/dashboard";
	}

	@GetMapping("/default-panel")
	@LogUserActivity(action = "DEFAULT ADMIN PANEL VIEW", includeParameters = false)
	public String getDefaultPanel() {
		return "admins/DefaultPanel";
	}

	@GetMapping("/user-panel")
	@LogUserActivity(action = "USER_PANEL", includeParameters = false)
	public String getUserPanel() {
		return "admins/User";
	}

	@GetMapping("/users")
	@LogUserActivity(action = "USER_LIST", includeParameters = false)
	public ResponseEntity<String> getUserList() throws JsonProcessingException {
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=UTF-8");
		return new ResponseEntity<>(adminService.getAllUsers(), responseHeaders, HttpStatus.OK);
	}

	@GetMapping("/users/{encodedParam}")
	@LogUserActivity(action = "DETAILED USER VIEW", includeParameters = false)
	public String getUserView(@PathVariable("encodedParam") String encodedParam, Model model)
			throws JsonProcessingException, UnsupportedEncodingException {
		String decodedParam = URLDecoder.decode(encodedParam, "UTF-8");
		User<String> user = adminService.getUserWithEmail(decodedParam);
		model.addAttribute("timeline", adminService.getUserTimeLine(decodedParam));
		model.addAttribute("email", user.getUserEmailId());
		model.addAttribute("firstName", user.getUserFirstName());
		model.addAttribute("lastName", user.getUserLastName());
		model.addAttribute("mobile", user.getUserMobile());
		return "admins/DetailUserView";
	}

	@GetMapping("/trader-signup")
	public String getOpenAccountForm(Model modal) {
		modal.addAttribute("fieldRequired", false);
		modal.addAttribute("AdminField", true);
		return "Login/createAccount";
	}

	@GetMapping("/basepc-page")
	public String getBasePcPageAttributes(Model modal) {
		return "Login/createAccount";
	}
}
