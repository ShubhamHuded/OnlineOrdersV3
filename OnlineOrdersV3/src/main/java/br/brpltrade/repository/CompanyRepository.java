package br.brpltrade.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.jpa.entity.PartyProfile;
import br.jpa.entity.PartyRegistry;
import br.jpa.entity.User;

@Repository
public interface CompanyRepository extends JpaRepository<PartyProfile<Integer>, Integer>{
	public PartyProfile<Integer>  findByPartyRegistry(PartyRegistry<String> obj);
}
