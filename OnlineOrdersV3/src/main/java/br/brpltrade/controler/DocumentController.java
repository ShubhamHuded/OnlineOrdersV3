package br.brpltrade.controler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import java.util.logging.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import br.brpltrade.DataMapper.PartyProfileDTO;
import br.brpltrade.service.CompanyService;
import br.brpltrade.service.HomeService;
import br.brpltrade.service.TraderDocumentService;

@Controller
public class DocumentController {
	
	Logger logger = Logger.getLogger(DocumentController.class.getName());
	
	@Autowired
	HomeService homeService;

	@Autowired
	CompanyService cservice;
	
	@Autowired
	TraderDocumentService documentService;

	@GetMapping("/uploadDocuments")
	public String getUploadDocumentView(Model model) {
		String email = homeService.getuserEmail();
		model.addAttribute("email", email);
		model.addAttribute("type", homeService.getUserType());
		model.addAttribute("name", homeService.getUserName());
		model.addAttribute("check", documentService.whichDocumentUpdated());
		return "util/UploadDocumnets";
	}
	
	@PostMapping("/process-documents")
	public ResponseEntity processDocument(HttpServletRequest request) throws IOException, ServletException {
		logger.info("processing document upload ");
		try {
			documentService.saveDoc(request);
			logger.info("document is processed");
			return ResponseEntity.ok().body(null);
		} catch (Exception ex) {
			
			return ResponseEntity.status(400).body(null);
		}
	}
}
