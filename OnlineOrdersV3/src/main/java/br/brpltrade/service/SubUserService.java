package br.brpltrade.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.json.JSONArray;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.brpltrade.DataMapper.SubUserDTO;
import br.brpltrade.jpa.entity.SubUser;
import br.brpltrade.jpa.entity.SubUserLine;
import br.brpltrade.repository.SubUserRepository;
import br.brpltrade.repository.SubUserTableRepository;
import br.brpltrade.repository.UserRepository;

@Service
public class SubUserService {

	@Autowired
	SubUserRepository subRepo;

	@Autowired
	PasswordEncoder encoder;

	@Autowired
	CompanyService cservice;

	@Autowired
	SubUserTableRepository subLRepo;

	@PersistenceContext
	private EntityManager entityManager;

	@Transactional
	public void save(SubUserDTO dtoObj) throws JSONException, ClassNotFoundException {
		if (entityManager.find(Class.forName("br.brpltrade.jpa.entity.SubUser"), dtoObj.getUserEmailId()) != null) {
			SubUser<String> subObj = getSubUser(dtoObj.getUserEmailId());
			subObj = getSubuserFromDTO(dtoObj, subObj);
			List<SubUserLine<Integer>> lineObj = getSubUserLineTables(dtoObj.getTableData(), dtoObj.getUserEmailId());
			for (SubUserLine<Integer> obj : lineObj) {
				subObj.addSubUserTable(obj);
			}
		} else {
			SubUser<String> subObj = getSubuserFromDTO(dtoObj, new SubUser<String>());
			List<SubUserLine<Integer>> lineObj = getSubUserLineTables(dtoObj.getTableData(), dtoObj.getUserEmailId());
			for (SubUserLine<Integer> obj : lineObj) {
				subObj.addSubUserTable(obj);
			}
			entityManager.persist(subObj);
		}
	}

	public SubUser<String> getSubuserFromDTO(SubUserDTO dtoObj, SubUser<String> obj) {
		obj.setUserFirstName(dtoObj.getUserFirstName());
		obj.setUserLastName(dtoObj.getUserLastName());
		obj.setUserEmailId(dtoObj.getUserEmailId());
		obj.setUserMobile(dtoObj.getUserMobile());
		if(obj.getUserPassword() == null)
			obj.setUserPassword(encoder.encode(dtoObj.getUserPassword()));
		obj.setUserType("SubUser");
		obj.setAllowPendingorder(converstStringToBoolean(dtoObj.getAllowPending()));
		obj.setAllowSales(converstStringToBoolean(dtoObj.getAllowSales()));
		obj.setTradingEnabeld(converstStringToBoolean(dtoObj.getAllowTrading()));
		obj.setPartyRegistry(cservice.getpartyRegistry());
		return obj;
	}

	public List<SubUserLine<Integer>> getSubUserLineTables(String tableData, String email) throws JSONException {
		JSONArray tableArray = new JSONArray(tableData);
		List<SubUserLine<Integer>> subLineList = new ArrayList<>();
		for (int i = 0; i < tableArray.length(); i++) {
			SubUserLine<Integer> subline = createOfFindSubUserLine(tableArray.getJSONArray(i).getString(0), email);
			JSONArray arr = tableArray.getJSONArray(i);
			subline.setCurrency(arr.getString(0));
			subline.setMaxOrderQty(Float.parseFloat(arr.getString(1)));
			subline.setTotalOrderQty(Float.parseFloat(arr.getString(2)));
			subline.setSubUser(subRepo.getReferenceById(email));
			subLineList.add(subline);
		}
		return subLineList;
	}

	public List<SubUserLine<Integer>> getSubUserLineTables(String email) {
		return subLRepo.findBySubUser(getSubUser(email));
	}

	private SubUserLine<Integer> createOfFindSubUserLine(String commodity, String email) {
		SubUserLine<Integer> obj = subLRepo.findByCurrencyAndSubUser(commodity, subRepo.getReferenceById(email));
		if (obj == null)
			return new SubUserLine<Integer>();
		else
			return obj;
	}

	public List<SubUser<String>> getSubUsersList() {
		return subRepo.findByPartyRegistry(cservice.getpartyRegistry());
	}

	public SubUser<String> getSubUser(String email) {
		return subRepo.getReferenceById(email);
	}

	public void deleteUser(String email) {
		subRepo.delete(getSubUser(email));
	}

	
	public void deleteRow(String email, String commodity) {
		subLRepo.delete(subLRepo.findByCurrencyAndSubUser(commodity, getSubUser(email)));
	}
	
	private boolean converstStringToBoolean(String value) {
		if(value.equalsIgnoreCase("true"))
				return true;
		return false;
	}
}
