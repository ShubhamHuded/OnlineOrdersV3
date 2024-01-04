package br.brpltrade.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import br.jpa.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User<String>, String> {

	public User<String> findByUserEmailId(String email);

	public User<String> findByUserMobile(String mobile);

}
