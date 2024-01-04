package br.brpltrade.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.jpa.entity.GSTEntity;
import br.jpa.entity.PartyProfile;
import br.jpa.entity.PartyRegistry;


public interface GSTEntityRepository extends JpaRepository<GSTEntity<Integer>, Integer>{
	public GSTEntity<Integer>  findByPartyRegistry(PartyRegistry<String> obj);
	public GSTEntity<Integer>  findByGstNumber(String gstNumber);
}
