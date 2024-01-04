package br.brpltrade.controler;

import javax.annotation.security.PermitAll;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.cfg.Environment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import br.brpltrade.service.HomeService;

@Controller
@PermitAll
public class RateControler {

	
	@Autowired
	HomeService hservice;
	
	@PostMapping("/live-rates")
	public String getRate(HttpServletRequest request, Model model) {
		String host = Environment.getProperties().getProperty("brpltrade.host");
		String port = Environment.getProperties().getProperty("server.port");
		String hostMain = "http://"+host+":"+port+"/";
		String hostHome = hostMain + "home";
		String referrer = request.getHeader("referer");
		model.addAttribute("type", hservice.getUserType());
		return "Trader/response";
	}
	
}
