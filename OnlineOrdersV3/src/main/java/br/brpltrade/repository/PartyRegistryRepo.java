package br.brpltrade.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.jpa.entity.PartyRegistry;

public interface PartyRegistryRepo extends JpaRepository<PartyRegistry<String>, String>{

}
