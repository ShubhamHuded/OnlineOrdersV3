package br.brpltrade.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import br.brpltrade.entity.AuditLog;

@Repository
public interface AuditLogRepository extends JpaRepository<AuditLog, Long> {
	public List<AuditLog> findByUserEmailOrderByTimestampDesc(String email);
}
