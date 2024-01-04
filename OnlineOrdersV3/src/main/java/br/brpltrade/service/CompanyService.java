package br.brpltrade.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.brpltrade.DataMapper.PartyProfileDTO;
import br.brpltrade.jpa.entity.SubUser;
import br.brpltrade.repository.CompanyRepository;
import br.brpltrade.repository.GSTEntityRepository;
import br.brpltrade.repository.PartnerDetailsRepository;
import br.brpltrade.repository.PartyRegistryRepo;
import br.brpltrade.repository.SubUserRepository;
import br.jpa.entity.GSTEntity;
import br.jpa.entity.PartnerDetails;
import br.jpa.entity.PartyProfile;
import br.jpa.entity.PartyRegistry;

@Service
public class CompanyService {

	@Autowired
	CompanyRepository companyRepository;

	@Autowired
	PartyRegistryRepo partyRegisRepo;

	@Autowired
	GSTEntityRepository gstRepo;

	@Autowired
	HomeService service;

	@Autowired
	PartnerDetailsRepository partnerRepo;

	@Autowired
	SubUserRepository subRepo;

	@Transactional
	public void saveBothEntity(PartyProfileDTO dtoObj) {
		if (getPartyProfile() != null) {
			PartyProfile<Integer> party = getPartyProfile();
			party = getExistingPartyProfileFromDTO(dtoObj, party);
		} else {
			PartyProfile<Integer> profile = getNewPartyProfileFromDTO(dtoObj);
			companyRepository.save(profile);
		}
//		GSTEntity<Integer> entiyObj = getGSTEntity(dtoObj.getGstNumber());
//		gstRepo.save(entiyObj);
	}
	
	private PartyProfile<Integer> getExistingPartyProfileFromDTO(PartyProfileDTO dtoObj, PartyProfile<Integer> profile) {
		profile.setAddress1(dtoObj.getAddress1());
		profile.setAddress2(dtoObj.getAddress2());
		profile.setCity(dtoObj.getCity());
		profile.setCompanyType(dtoObj.getCompanyType());
		profile.setCountry(dtoObj.getCountry());
		profile.setFaxNumber(dtoObj.getFaxNumber());
		profile.setFirmName(dtoObj.getFirmName());
		profile.setOwnerName(dtoObj.getOwnerName());
		profile.setPhoneNumer(dtoObj.getPhoneNumer());
		profile.setPincode(dtoObj.getPincode());
		profile.setPincode(dtoObj.getPincode());
		profile.setState(dtoObj.getState());
		profile.setWebSite(dtoObj.getWebSite());
		profile.setPartyRegistry(getpartyRegistry(service.getuserEmail()));
		return profile;
	}

	private PartyProfile<Integer> getNewPartyProfileFromDTO(PartyProfileDTO dtoObj) {
		PartyProfile<Integer> profile = new PartyProfile<>();
		profile.setAddress1(dtoObj.getAddress1());
		profile.setAddress2(dtoObj.getAddress2());
		profile.setCity(dtoObj.getCity());
		profile.setCompanyType(dtoObj.getCompanyType());
		profile.setCountry(dtoObj.getCountry());
		profile.setFaxNumber(dtoObj.getFaxNumber());
		profile.setFirmName(dtoObj.getFirmName());
		profile.setOwnerName(dtoObj.getOwnerName());
		profile.setPhoneNumer(dtoObj.getPhoneNumer());
		profile.setPincode(dtoObj.getPincode());
		profile.setPincode(dtoObj.getPincode());
		profile.setState(dtoObj.getState());
		profile.setWebSite(dtoObj.getWebSite());
		profile.setPartyRegistry(getpartyRegistry(service.getuserEmail()));
		GSTEntity<Integer>  obj = getGSTEntity(dtoObj.getGstNumber());
		obj.setPartyProfile(profile);
		profile.setGstEntity(obj);
		return profile;
	}

	public PartyRegistry<String> getpartyRegistry(String email) {
		try {
			PartyRegistry<String> obj = partyRegisRepo.getReferenceById(email);
			return obj;
		} catch (Exception ex) {
			SubUser<String> subObj = subRepo.getReferenceById(email);
			return subObj.getPartyRegistry();
		}
	}

	public PartyRegistry<String> getpartyRegistry() {
		return service.getpartyRegistry();
	}

	private GSTEntity<Integer> getGSTEntity(String gstNumber) {
		GSTEntity<Integer> obj = new GSTEntity<>();
		obj.setPartyRegistry(getpartyRegistry(service.getuserEmail()));
		obj.setGstNumber(gstNumber);
		return obj;
	}

	public PartyProfileDTO getPartyProfileDTOFromEntity() {
		PartyProfileDTO obj = new PartyProfileDTO();
		PartyProfile<Integer> profile = getPartyProfile();
		if (profile == null)
			return null;
		obj.setAddress1(profile.getAddress1());
		obj.setAddress2(profile.getAddress2());
		obj.setCity(profile.getCity());
		obj.setCompanyType(profile.getCompanyType());
		obj.setCountry(profile.getCountry());
		obj.setFaxNumber(profile.getFaxNumber());
		obj.setFirmName(profile.getFirmName());
		obj.setGstNumber(getGSTEntity().getGstNumber());
		obj.setOwnerName(profile.getOwnerName());
		obj.setPhoneNumer(profile.getPhoneNumer());
		obj.setPincode(profile.getPincode());
		obj.setState(profile.getState());
		obj.setWebSite(profile.getWebSite());
		return obj;
	}

	public PartyProfile<Integer> getPartyProfile() {
		PartyProfile<Integer> profile = null;
		String email = service.getuserEmail();
		profile = companyRepository.findByPartyRegistry(getpartyRegistry());
		return profile;
	}

	public GSTEntity<Integer> getGSTEntity() {
		GSTEntity<Integer> gstObj = null;
		String email = service.getuserEmail();
		gstObj = gstRepo.findByPartyRegistry(getpartyRegistry());
		return gstObj;
	}


	public List<PartnerDetails<Integer>> getPartnerList() {
		return partnerRepo.findByPartyRegistry(getpartyRegistry());
	}

}
