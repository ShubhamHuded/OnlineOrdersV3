package br.brpltrade.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import br.jpa.entity.PartnerDetails;
import br.jpa.entity.PartyProfile;
import br.jpa.entity.PartyRegistry;

public interface PartnerDetailsRepository extends JpaRepository<PartnerDetails, String> {

	public List<PartnerDetails<Integer>> findByPartyRegistry(PartyRegistry<String> obj);
}
