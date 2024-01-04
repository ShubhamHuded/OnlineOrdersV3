package br.brpltrade.controler;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import br.base.money.*;
import br.traderates.*;

@RestController
public class LiveRates {

	@GetMapping("/get-live-data")
	public ResponseEntity<String[][]> getValues() throws Exception {
		String[][] prices = TradeSocket.getAskBidTableValues();
		 return ResponseEntity.ok().body(prices);
	}
}
