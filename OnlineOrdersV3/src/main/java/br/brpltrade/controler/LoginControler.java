package br.brpltrade.controler;

import java.util.HashMap;
import java.util.Map;
import java.util.Base64;

import javax.annotation.security.PermitAll;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.brpltrade.DataMapper.UserLogin;
import br.jpa.entity.User;
import br.brpltrade.service.UserService;

@Controller
@PermitAll
@RequestMapping("/app")
public class LoginControler {

	@Autowired
	UserService service;

	private final HttpServletRequest req;

	@Autowired
	public LoginControler(HttpServletRequest req) {
		this.req = req;
	}

	@GetMapping("/login")
	public String home(HttpServletRequest request, Model model) {
		String error = request.getParameter("error");
		if (error != null && error.equals("badcredential")) {
			model.addAttribute("errorMessage", "Invalid username or password. Please try again.");
		}
		return "Login/LoginHtml";
	}

	public ResponseEntity authenticateUser(@RequestParam("emailOrMobile") String emailOrMobile,
			@RequestParam("password") String password) {
		User<String> user = null;
		if (service.isEmail(emailOrMobile))
			user = service.getUser(emailOrMobile);
		else
			user = service.getUserThroghMobile(emailOrMobile);

		if (user.getUserPassword().equals(password)) {
			Map<String, String> response = new HashMap<String, String>();
			req.getSession().setAttribute("email", emailOrMobile);
			return ResponseEntity.ok().body(null);
		}
		return ResponseEntity.ok().body(null);
	}

}
