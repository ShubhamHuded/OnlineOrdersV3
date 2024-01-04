package br.brpltrade.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.brpltrade.entity.UserActivity;
import br.brpltrade.repository.UserActivityRepo;

@Service
public class UserActivityService {

	@Autowired
	UserActivityRepo repo;
	
	@Autowired
	HomeService hService;
	
	public void updateUserActivity(int action) {
		UserActivity obj = new UserActivity();
		obj.setActionName(action);
		obj.setTimestamp(LocalDateTime.now());
		obj.setUserEmail(hService.getuserEmail());
		repo.save(obj);
	}
	
	public List<UserActivity> getUserActions() {
		return repo.findByUserEmailOrderByTimestampDesc(hService.getuserEmail());
	}
}
