package br.brpltrade.service;

import java.util.Random;

import org.springframework.stereotype.Service;

import br.brpltrade.util.Mail;

@Service
public class GSTOTPService {

	public String generateOtp(String gstNumber) throws Exception {
		String otp = generateOTP();
		Mail.sendGSTLoginOtpEmail("", otp);
		return null;
	}

	public boolean validateOTP(String gstNumber, String otp) {
		return false;
	}

	private String generateOTP() {
		Random random = new Random();
		int otpValue = 1000 + random.nextInt(9000);
		return String.valueOf(otpValue);
	}
	
	private String getEmailForGst(String gst) {
		return null;
	}
}
