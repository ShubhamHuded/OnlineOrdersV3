package br.brpltrade.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import br.brpltrade.jpa.entity.SubUser;
import br.brpltrade.jpa.entity.SubUserLine;

public interface SubUserTableRepository extends JpaRepository<SubUserLine<Integer>, Integer>{
	public SubUserLine<Integer> findByCurrencyAndSubUser(String currency, SubUser<String> obj);
	public List<SubUserLine<Integer>> findBySubUser(SubUser<String> subuser);
}
