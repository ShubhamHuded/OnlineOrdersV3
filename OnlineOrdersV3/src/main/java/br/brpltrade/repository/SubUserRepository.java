package br.brpltrade.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import br.brpltrade.jpa.entity.SubUser;
import br.jpa.entity.PartnerDetails;
import br.jpa.entity.PartyRegistry;
import br.jpa.entity.User;


public interface SubUserRepository extends JpaRepository<SubUser<String>, String> {
	public List<SubUser<String>> findByPartyRegistry(PartyRegistry<String> obj);
}
