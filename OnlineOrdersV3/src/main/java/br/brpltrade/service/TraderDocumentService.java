package br.brpltrade.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;
import java.util.logging.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.jpa.entity.*;
import br.brpltrade.DataMapper.DocumentMapper;
import br.brpltrade.repository.TraderDocumentRepository;
import br.brpltrade.util.ResourseConfig;

@Service
public class TraderDocumentService {
	Logger logger = Logger.getLogger(TraderDocumentService.class.getName());

	@Autowired
	TraderDocumentRepository docRepos;

	@Autowired
	HomeService hService;

	public DocumentMapper[] whichDocumentUpdated() {
		DocumentMapper[] ans = new DocumentMapper[2];
		List<TraderDocument> li = docRepos.findByEmail(hService.getuserEmail());
		if (li.size() == 0) {
			ans[0] = null;
			ans[1] = null;
		} else if (li.size() == 1) {
			if (li.get(0).getImageType().equalsIgnoreCase("pancard")) {
				DocumentMapper obj = new DocumentMapper();
				obj.setPath("../Online-Orders/images/documents/" + li.get(0).getImagePath());
				ans[0] = obj;
			} else {
				DocumentMapper obj = new DocumentMapper();
				obj.setPath("../Online-Orders/images/documents/" + li.get(0).getImagePath());
				ans[1] = obj;
			}
		} else {
			DocumentMapper obj1 = new DocumentMapper();
			obj1.setPath("../Online-Orders/images/documents/" + li.get(0).getImagePath());
			ans[0] = obj1;
			DocumentMapper obj2 = new DocumentMapper();
			obj2.setPath("../Online-Orders/images/documents/" + li.get(1).getImagePath());
			ans[1] = obj2;
		}
		return ans;
	}

	public void saveDoc(HttpServletRequest request) throws IOException, ServletException {
		Part pancard = request.getPart("panNumber");
		Part gstcard = request.getPart("gstNumber");
		if (pancard != null && !checkPanCardInDb()) {
			logger.info("processing to updated PanCard Document");
			processPanOrGst(pancard, "pancard");
		}

		if (gstcard != null && !checkGSTInDb()) {
			logger.info("processing to updated GST Document");
			processPanOrGst(gstcard, "gst");
		}

	}

	@Transactional
	private String processPanOrGst(Part part, String type) throws IOException {
		if (!this.checkFiles(part.getContentType())) {
			return "image format should be of type png, jpg, jpeg";
		} else {
			String fileName = this.getRandomFileName(type);
			TraderDocument obj = new TraderDocument();
			obj.setImagePath(fileName);
			obj.setImageType(type);
			obj.setEmail(hService.getuserEmail());
			if (part != null) {
				persistFile(part, fileName);
				docRepos.save(obj);
				logger.info("documnet updated correctly");
				return type + "Updated";
			}
			logger.info("error while documnet updateding");
		}
		return null;
	}

	public boolean checkPanCardInDb() {
		logger.info("checking pan card in db");
		List<TraderDocument> li = docRepos.findByEmail(hService.getuserEmail());
		for (TraderDocument doc : li) {
			if (doc.getImageType().equalsIgnoreCase("pancard"))
				return true;
		}
		logger.info("no pancard archives found");
		return false;
	}

	public boolean checkGSTInDb() {
		logger.info("checking GST card in db");
		List<TraderDocument> li = docRepos.findByEmail(hService.getuserEmail());
		for (TraderDocument doc : li) {
			if (doc.getImageType().equalsIgnoreCase("gst"))
				return true;
		}
		logger.info("No GST Archives found for user");
		return false;
	}

	private boolean checkFiles(String mimeType) {
		logger.info("checking file types");
		switch (mimeType) {
		case "image/png":
			return true;
		case "image/jpg":
			return true;
		case "image/jpeg":
			return true;
		}
		logger.info("file types are not correct");
		return false;
	}

	private String getRandomFileName(String type) {
		UUID randomUUID = UUID.randomUUID();
		String name = hService.getUserName() + "_" + type + "_";
		String generatedString = randomUUID.toString().replaceAll("_", "").replace("-", "");
		name += generatedString;
		if (new File(ResourseConfig.getDocumentPath() + "/" + name).exists())
			getRandomFileName(type);
		logger.info("file name generated " + name);
		return name;
	}

	private void persistFile(Part part, String fileNamea)  {
		logger.info("persisting file");
		String uploadDirectory = ResourseConfig.getDocumentPath();
		logger.info("uploadDirectory "+uploadDirectory);
		Part filePart = part;
		String fileName = fileNamea;
		File uploadedFile = new File(uploadDirectory, fileName);
		logger.info("uploadedFile "+uploadedFile.toString());
		try (InputStream input = filePart.getInputStream(); OutputStream output = new FileOutputStream(uploadedFile)) {
			logger.info("inputstream start");
			byte[] buffer = new byte[8192];
			int bytesRead;
			while ((bytesRead = input.read(buffer)) != -1) {
				output.write(buffer, 0, bytesRead);
			}
			logger.info("inputstream end");
		} catch (IOException e) {
			e.printStackTrace();
		} 
		logger.info("file is persisted");
	}

}
