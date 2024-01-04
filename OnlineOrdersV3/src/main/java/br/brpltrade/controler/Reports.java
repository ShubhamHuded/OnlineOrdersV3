package br.brpltrade.controler;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;

import br.brpltrade.server.TradeHelperMaster;
import br.brpltrade.service.CompanyService;
import br.brpltrade.service.HomeService;
import br.brpltrade.service.TradeControlService;

@Controller
public class Reports {	
	@Autowired
	HomeService service;
	
	@Autowired
	TradeControlService tradeService;
	
	@Autowired
	CompanyService cservice;

	
	@GetMapping("/reports")
	public String getReports(Model model) {
		String email = service.getuserEmail();
		model.addAttribute("email", email);
		model.addAttribute("type", service.getUserType());
		model.addAttribute("name", service.getUserName());
		return "Trader/Reports";
	}
	
	@GetMapping("/accepted-orders")
	public ResponseEntity<String> getAcceptedOrder() throws JsonProcessingException {
		String result = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=UTF-8");
		String orderStatus[] = new String[2];
		if (service.getUserType().equals("Admin")) {
			orderStatus[0] = service.getpartyRegistry().getUserEmailId();
			orderStatus[1] = service.getpartyRegistry().getUserEmailId();
			try {
				String data = TradeHelperMaster.getOrderStatus("Order ", orderStatus);
				JSONObject outputJSN = new JSONObject(data);
				JSONArray jasonArry = outputJSN.getJSONObject("tables").getJSONArray("open_orders");
				result = jasonArry.toString();
			} catch (Exception e) {
				JSONArray empty = new JSONArray();
				e.printStackTrace();
			}
		} else {
			orderStatus[0] = service.getpartyRegistry().getUserEmailId();
			orderStatus[1] = tradeService.getSubUserEmail();
			try {
				String data = TradeHelperMaster.getOrderStatus("Order ", orderStatus);
				JSONObject outputJSN = new JSONObject(data);
				JSONArray jasonArry = outputJSN.getJSONObject("tables").getJSONArray("open_orders");
				result = jasonArry.toString();
			} catch (Exception e) {
				JSONArray empty = new JSONArray();
				e.printStackTrace();
			}
		}
		return new ResponseEntity<>(result, responseHeaders, HttpStatus.OK);
	}
	
	@GetMapping("/order-history")
	public ResponseEntity<String> getOrderHistory() throws JsonProcessingException {
		String result = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=UTF-8");
		String orderStatus[] = new String[2];
		if (service.getUserType().equals("Admin")) {
			orderStatus[0] = cservice.getPartyProfileDTOFromEntity().getFirmName();
			try {
				String data = TradeHelperMaster.getOrderStatus("accepted list", orderStatus);
				JSONObject outputJSN = new JSONObject(data);
				JSONArray jasonArry = outputJSN.getJSONObject("tables").getJSONArray("saleslistpwtable");
				result = jasonArry.toString();
			} catch (Exception e) {
				JSONArray empty = new JSONArray();
				e.printStackTrace();
			}
		} else {
			orderStatus[0] = cservice.getPartyProfileDTOFromEntity().getFirmName();
			try {
				String data = TradeHelperMaster.getOrderStatus("Order ", orderStatus);
				JSONObject outputJSN = new JSONObject(data);
				JSONArray jasonArry = outputJSN.getJSONObject("tables").getJSONArray("open_orders");
				result = jasonArry.toString();
			} catch (Exception e) {
				JSONArray empty = new JSONArray();
				e.printStackTrace();
			}
		}
		return new ResponseEntity<>(result, responseHeaders, HttpStatus.OK);
	}
}
