package br.brpltrade.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.brpltrade.DataMapper.HelpEntityDTO;
import br.brpltrade.entity.HelpEntity;
import br.brpltrade.repository.HelpRepository;
import br.brpltrade.util.Mail;

@Service
public class HelpService {

	@Autowired
	HelpRepository helpRepository;

	@Autowired
	HomeService hService;

	@Transactional
	public void saveHelp(HelpEntityDTO objs) throws Exception {
		HelpEntity obj = getHelpEntityFromDTO(objs);
		Mail.sendEmailForHelQurey(obj.getFirstQuery(), obj.getSecondQuery());
		helpRepository.save(obj);
	}
	
	public HelpEntity getHelpEntityFromDTO(HelpEntityDTO obj) {
		HelpEntity objH = new HelpEntity();
		objH.setFirstQuery(obj.getFirstQuery());
		objH.setSecondQuery(obj.getSecondQuery());
		objH.setPartyRegistry(hService.getpartyRegistry());
		return objH;
	}
}
