package br.brpltrade.DataMapper;

import org.springframework.stereotype.Service;

@Service
public class UtilityMapper {

	private String SUCESS_ERROR = "";

	public String getSUCESS_ERROR() {
		return SUCESS_ERROR;
	}

	public void setSUCESS_ERROR(String sUCESS_ERROR) {
		SUCESS_ERROR = sUCESS_ERROR;
	}

}
