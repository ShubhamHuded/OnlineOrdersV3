package br.brpltrade.controler;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.brpltrade.DataMapper.SubUserDTO;
import br.brpltrade.service.HomeService;
import br.brpltrade.service.SubUserService;
import maipl.db.RDBHelper;
import maipl.db.RdbUserHelper;

@Controller
public class SubUserControler {
	@Autowired
	HomeService homeService;

	@Autowired
	SubUserService subService;

	@RequestMapping(value = "/subusers")
	public String getSubUserView(Model model) {
		String email = homeService.getuserEmail();
		model.addAttribute("email", email);
		model.addAttribute("type", homeService.getUserType());
		model.addAttribute("name", homeService.getUserName());
		model.addAttribute("isApproved", homeService.isCompanyApproved());
		model.addAttribute("subuserList", subService.getSubUsersList());
		return "admins/subuserlist";
	}

	@RequestMapping("/add-subuser")
	public String getAddSubUserView(Model model, @RequestParam String subEmail) {
		if (subEmail.equalsIgnoreCase("addnewuser"))
			model.addAttribute("subuser", null);
		else {
			model.addAttribute("subuser", subService.getSubUser(subEmail));
			model.addAttribute("subuserList", subService.getSubUserLineTables(subEmail));
		}
		return "admins/subuserdetails";
	}

	@PostMapping("/subuser-profile-data")
	public ResponseEntity processSubUser(SubUserDTO objDTO) {
		try {
			subService.save(objDTO);
			return ResponseEntity.ok().body(null);
		} catch (Exception ex) {
			return ResponseEntity.status(500).body(null);
		}
	}

	@GetMapping("/getcurrency")
	public  ResponseEntity<List<String>> getList() throws Exception {
		List<String> options = RdbUserHelper.getCurrency();
		List<String> filterArray = Arrays.asList("GOLD", "SILVER", "PLATINUM");
		options = options.stream().filter(filterArray::contains) 
				.collect(Collectors.toList());
		return ResponseEntity.ok().body(options);
	}

	@PostMapping("/delet-subuser")
	public ResponseEntity deletUser(@RequestParam String email) {
		try {
			subService.deleteUser(email);
			return ResponseEntity.ok().body("deleted a SubUser");
		} catch (Exception ex) {
			return ResponseEntity.status(500).body("internal server error please try again later");
		}
	}

	@PostMapping("/delete-row")
	public ResponseEntity<String> deleteRow(@RequestParam String email, @RequestParam String commidity) {
		try {
			subService.deleteRow(email, commidity);
			return ResponseEntity.ok().body(null);
		} catch (Exception ex) {
			return ResponseEntity.status(400).body(null);
		}
	}
	
	public  void main(String[] args) throws Exception {
		getList();
	}

}
