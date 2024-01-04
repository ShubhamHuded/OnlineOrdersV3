package br.brpltrade.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.brpltrade.entity.PasswordResetToken;

public interface PasswordResetRepository extends JpaRepository<PasswordResetToken, Integer> {
	public PasswordResetToken findByToken(String token);
}
