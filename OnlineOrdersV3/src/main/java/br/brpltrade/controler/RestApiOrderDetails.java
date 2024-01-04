package br.brpltrade.controler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.brpltrade.DataMapper.ApiOrderDetailDTO;
import br.brpltrade.service.HomeService;
import br.brpltrade.service.ManualConnection;

@Controller
@RequestMapping("/api")
public class RestApiOrderDetails {

	@Autowired
	HomeService homeService;

	@GetMapping("/apiorderdeatils")
	public String requestOrderDetails(Model model) throws Exception {
		String userEmail = homeService.getuserEmail();
		List<ApiOrderDetailDTO> li = ManualConnection.getApiOrderListForUserEmail(userEmail);
		// List<OrderAcceptence<Integer>> li =
		// apiOrderDeatils.getApiPendingOrderList(userEmail);
		model.addAttribute("apiOrderlist", li);
		return "Trader/apiorderdetails";
	}

}
