package br.brpltrade.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import br.brpltrade.DataMapper.AuditMapper;
import br.brpltrade.DataMapper.UserDto;
import br.brpltrade.entity.AuditLog;
import br.brpltrade.repository.AuditLogRepository;
import br.jpa.entity.User;

@Service
public class AdminService {

	@Autowired
	
	HomeService hService;

	@Autowired
	AuditLogRepository auditRepository;

	public String getAllUsers() throws JsonProcessingException {
		JSONArray jsonArray = hService.getUserListInJson();
//		List<Map<String, Object>> list = new ArrayList<>();
//		for (int i = 0; i < jsonArray.length(); i++) {
//		    JSONObject jsonObject = jsonArray.getJSONObject(i);
//		    Map<String, Object> map = new HashMap<>();
//		    jsonObject.keys().forEachRemaining(key -> map.put(key, jsonObject.get(key)));
//		    list.add(map);
//		}
//		ObjectMapper objectMapper = new ObjectMapper();
//		String jsonString = objectMapper.writeValueAsString(list);
		return jsonArray.toString();
	}

	public JSONArray getUserTimeLine(String user) {
		List<AuditLog> list = auditRepository.findByUserEmailOrderByTimestampDesc(user);
		List<AuditMapper> auditList = list.stream().map(audit -> new AuditMapper(audit.getAction(), audit.getDetails(), audit.getTimestamp()))
				.collect(Collectors.toList());
		JSONArray array = new JSONArray();
		for (AuditMapper audit : auditList) {
			JSONObject obj = new JSONObject(audit);
			array.put(obj);
		}
		return array;
	}
	
	public User<String> getUserWithEmail(String email) {
		User<String> user = hService.getUser(email);
		return user;
	}
}
