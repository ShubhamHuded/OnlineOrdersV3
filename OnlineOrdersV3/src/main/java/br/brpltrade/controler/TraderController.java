package br.brpltrade.controler;

import java.net.ConnectException;
import java.sql.SQLException;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import br.brpltrade.service.TradeControlService;
import maipl.db.RDBHelper;

@Controller
public class TraderController {
	
	Logger logger = Logger.getLogger(TraderController.class.getName());
	
	@Autowired
	TradeControlService tservice;

	@GetMapping("/openTradingWindow")
	public String openTradingWindow(@RequestParam String commid, @RequestParam String buyrate,
			@RequestParam String type, @RequestParam String selectType, Model model) throws Exception {
		System.out.println("inside the trading view");	
		model.addAttribute("commid", commid);
		model.addAttribute("traderId", tservice.getTraderId());
		model.addAttribute("subUser", tservice.getSubUserEmail());
		model.addAttribute("buyRate", buyrate);
		model.addAttribute("type", type);
		return "Trader/Trading";
	}

	@PostMapping("/trading-status")
	public ResponseEntity<String> mandaotryTradingCheck(@RequestParam String commid) {
		try {
			String result = tservice.mandatoryCheckBeforePlacingOrder(commid);
			if (result != null) {
				System.out.println("its thereeeeeeeeeeeeeeeee not working");
				return ResponseEntity.status(400).body(result);
			} else {
				System.out.println("its thereeeeeeeeeeeeeeeee working");
				return ResponseEntity.ok().body(result);
			}
		} catch (Exception ex) {
			return ResponseEntity.status(400).body("Server Error Please try again later");
		}
	}
	
	@GetMapping("/trading-accept")
	public String getTradingAccept() {
		return "Trader/Tradings";
	}
	
	@PostMapping("/create-order")
	public String processOrder() {
		return "Trader/CreateOrder";
	}
	
	@GetMapping("/image-path")
	public ResponseEntity<String> getImagePath(@RequestParam String value) throws SQLException {
		try {
			String output = RDBHelper.getImagesPath(value);
			output = ".." + output;
			return ResponseEntity.ok().body(output);
		} catch (Exception ex) {
			return ResponseEntity.ok().body("ddumpy image path");
		}
	}

}
