package br.brpltrade.controler;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.boot.web.servlet.error.ErrorController;

@Controller
public class CustomErroController implements ErrorController {

	@RequestMapping("/error")
	public String getErrorView() {
		return "util/GenericError";
	}
}
