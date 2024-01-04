package br.brpltrade.controler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import br.brpltrade.DataMapper.HelpEntityDTO;
import br.brpltrade.service.HelpService;
import br.brpltrade.service.HomeService;

@Controller
public class HelpController {

	@Autowired
	HomeService homeService;

	@Autowired
	HelpService helpService;
	
	@RequestMapping("/help")
	public String getHelpView(Model model) {
		model.addAttribute("name", homeService.getUserName());
		model.addAttribute("type", homeService.getUserType());
		return "util/help";
	}
	
	@PostMapping("/post-help")
	public ResponseEntity processHelp(HelpEntityDTO obj) {
		try {
			helpService.saveHelp(obj);
			return ResponseEntity.ok().body(null);
		} catch(Exception ex) {
			return ResponseEntity.status(500).body(null);
		}
	}
}
