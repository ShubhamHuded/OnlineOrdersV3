package br.brpltrade.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.jpa.entity.TraderDocument;

@Repository
public interface TraderDocumentRepository extends JpaRepository<TraderDocument, Integer> {
	public List<TraderDocument> findByEmail(String email);
}
