package br.brpltrade.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.brpltrade.controler.PartnerDetailsDTO;
import br.brpltrade.repository.PartnerDetailsRepository;
import br.jpa.entity.PartnerDetails;

@Service
public class PartnerDetailsService {

	@Autowired
	PartnerDetailsRepository prepo;
	
	@Autowired
	CompanyService cservice;

	public void saveDetails(PartnerDetailsDTO obj) {
		PartnerDetails<Integer> objs = getpartnerDetailsFromPartnerDetailsDTO(obj);
		prepo.save(objs);
	}
	
	public PartnerDetails<Integer> getpartnerDetailsFromPartnerDetailsDTO(PartnerDetailsDTO obj) {
		PartnerDetails<Integer> partnerObj = new PartnerDetails<Integer>();
		partnerObj.setDesignation(obj.getDesignation());
		partnerObj.setEmail(obj.getEmail());
		partnerObj.setFname(obj.getFname());
		partnerObj.setLname(obj.getLname());
		partnerObj.setPancard(obj.getPancard());
		partnerObj.setPhone(obj.getPhone());
		partnerObj.setPartyRegistry(cservice.getpartyRegistry());
		return partnerObj;
		
	}
}
