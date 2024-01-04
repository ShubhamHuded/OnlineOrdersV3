package br.brpltrade.controler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import br.brpltrade.AOP.LogUserActivity;
import br.brpltrade.DataMapper.PartyProfileDTO;
import br.brpltrade.service.AuditLogService;
import br.brpltrade.service.CompanyService;
import br.brpltrade.service.HomeService;

@Controller
public class CompanyController {
	@Autowired
	HomeService homeService;
	
	@Autowired
	CompanyService cservice;

	@RequestMapping(value = "/create-company-profile")
	@LogUserActivity(action = "CREATE_USER", includeParameters=false)
	public String getCompnanyView(Model model) {
		PartyProfileDTO partyProfile = cservice.getPartyProfileDTOFromEntity();
		if(partyProfile != null)
			model.addAttribute("partyProfile", partyProfile);
		else
			model.addAttribute("partyProfile", null);
		model.addAttribute("partnerList", cservice.getPartnerList());
		String email = homeService.getuserEmail();
		model.addAttribute("email", email);
		model.addAttribute("type", homeService.getUserType());
		model.addAttribute("name", homeService.getUserName());
		return "home/UpdateCompanyProfile";
	}
	
	@PostMapping(value = "/submit-company-profile-data")
	@LogUserActivity(action = "CREATE_USER", includeParameters=true)
	public ResponseEntity svaePartyProfileData(PartyProfileDTO profile) {
		try {
			cservice.saveBothEntity(profile);
			return ResponseEntity.ok().body(null);
		} catch (Exception ex) {
			return ResponseEntity.status(500).body("");
		}
	}
}
