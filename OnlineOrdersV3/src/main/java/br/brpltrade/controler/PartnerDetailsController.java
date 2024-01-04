package br.brpltrade.controler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import br.brpltrade.service.PartnerDetailsService;

@Controller
public class PartnerDetailsController {

	@Autowired
	PartnerDetailsService pservice;
	
	@RequestMapping("/partners-details")
	public String getPartnerDetailsView() {
		return "Login/PartnerDetails";
	}
	
	@PostMapping("/submit-partner-details")
	public ResponseEntity processNewSubuser(PartnerDetailsDTO dto) {
		try {
			pservice.saveDetails(dto);
			return ResponseEntity.ok().body(null);
		} catch (Exception ex) {
			return ResponseEntity.status(500).body(null);
		}
	}
}
