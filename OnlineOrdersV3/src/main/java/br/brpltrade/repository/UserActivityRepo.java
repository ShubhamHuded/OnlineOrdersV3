package br.brpltrade.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.brpltrade.entity.UserActivity;

@Repository
public interface UserActivityRepo extends JpaRepository<UserActivity, Long> {
	public List<UserActivity> findByUserEmailOrderByTimestampDesc(String email);
}
