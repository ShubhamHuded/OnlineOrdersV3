package br.brpltrade.controler;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.brpltrade.server.TradeHelperMaster;
import br.brpltrade.service.HomeService;
import br.brpltrade.service.TradeControlService;
import maipl.db.RDBHelper;
import maipl.db.RdbUserHelper;

@Controller
public class HomeBasePcController {

	@Autowired
	HomeService service;

	@Autowired
	TradeControlService tradeService;

	@GetMapping("/home")
	public String getHome(Model model) {
		String type = service.getUserType();
		model.addAttribute("type", type);
		model.addAttribute("name", service.getUserName());
		return "home/pc";
	}

	@PostMapping("/select-type")
	public ResponseEntity<List<String>> getCurrencyView(@RequestParam String type) throws SQLException {
		List<String> options = RDBHelper.getDropDownOptions(type);
		options.removeIf(s -> s.trim().isEmpty());
		return ResponseEntity.ok().body(options);
	}

	@RequestMapping("/get-order-details")
	public String getOrderDetailsView(Model model) {
		String orderStatus[] = new String[2];
		if (service.getUserType().equals("Admin")) {
			orderStatus[0] = service.getpartyRegistry().getUserEmailId();
			orderStatus[1] = service.getpartyRegistry().getUserEmailId();
			try {
				String data = TradeHelperMaster.getOrderStatus("Order ", orderStatus);
				JSONObject outputJSN = new JSONObject(data);
				JSONArray jasonArry = outputJSN.getJSONObject("tables").getJSONArray("open_orders");
				model.addAttribute("data", jasonArry);
			} catch (Exception e) {
				JSONArray empty = new JSONArray();
				model.addAttribute("data", empty);
				e.printStackTrace();
			}
		} else {
			orderStatus[0] = service.getpartyRegistry().getUserEmailId();
			orderStatus[1] = tradeService.getSubUserEmail();
			try {
				String data = TradeHelperMaster.getOrderStatus("Order ", orderStatus);
				JSONObject outputJSN = new JSONObject(data);
				JSONArray jasonArry = outputJSN.getJSONObject("tables").getJSONArray("open_orders");
				model.addAttribute("data", jasonArry);
			} catch (Exception e) {
				JSONArray empty = new JSONArray();
				model.addAttribute("data", empty);
				e.printStackTrace();
			}
		}
		return "Trader/ODetails";
	}

	@RequestMapping("/get-pending-details")
	public String getPendingOrderDetailsView(Model model) {
		String orderStatus[] = new String[2];
		if (service.getUserType().equals("Admin")) {
			orderStatus[0] = service.getpartyRegistry().getUserEmailId();
			orderStatus[1] = service.getpartyRegistry().getUserEmailId();
			try {
				String data = TradeHelperMaster.getOrderStatus("Pending Open Orders", orderStatus);
				JSONObject outputJSN = new JSONObject(data);
				JSONArray jasonArry = outputJSN.getJSONObject("tables").getJSONArray("open_orders");
				model.addAttribute("data", jasonArry);
			} catch (Exception e) {
				JSONArray empty = new JSONArray();
				model.addAttribute("data", empty);
				e.printStackTrace();
			}
		} else {
			orderStatus[0] = service.getpartyRegistry().getUserEmailId();
			orderStatus[1] = tradeService.getSubUserEmail();
			try {
				String data = TradeHelperMaster.getOrderStatus("Pending Open Orders", orderStatus);
				JSONObject outputJSN = new JSONObject(data);
				JSONArray jasonArry = outputJSN.getJSONObject("tables").getJSONArray("open_orders");
				model.addAttribute("data", jasonArry);
			} catch (Exception e) {
				JSONArray empty = new JSONArray();
				model.addAttribute("data", empty);
				e.printStackTrace();
			}
		}
		return "Trader/PODetails";
	}
}
