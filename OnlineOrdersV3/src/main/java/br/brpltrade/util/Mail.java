package br.brpltrade.util;

import br.util.email.BrMessageImpl;
import br.util.email.EmailService;

public class Mail {

	private static String getResetPasswordMsg(String url, String email) {
		String msg = "<!DOCTYPE html>\r\n"
				+ "<html>\r\n"
				+ "<head>\r\n"
				+ "    <title>Password Reset Request</title>\r\n"
				+ "</head>\r\n"
				+ "<body>\r\n"
				+ "    <h4>Password Reset Request for Your Email Account</h4>\r\n"
				+ "    <p>We have received a request to reset the password for your email account associated with "+email + ". To proceed with the password reset, please click on the link provided below:</p>\r\n"
				+ "    <p><a href=\""+url+"\">Reset Password</a></p>\r\n"
				+ "    <p>If you did not initiate this password reset request or believe it to be a mistake, please ignore this message. Your current password will remain unchanged.</p>\r\n"
				+ "    <p>Please ensure the security of your account by not sharing the password reset link with anyone. The link will be valid for 5 minutes, after which it will expire for security reasons.</p>\r\n"
				+ "    <p>If you encounter any issues or need further assistance, don't hesitate to contact our support team at kcorphelpdesk@gmail.com.</p>\r\n"
				+ "</body>\r\n"
				+ "</html>\r\n"
				+ "";
		return msg;
	}
	
	private static String getGSTLoginOtpMsg(String otp) {
		String msg = "<!DOCTYPE html>\r\n"
				+ "<html>\r\n"
				+ "<head>\r\n"
				+ "    <title>OTP Verification</title>\r\n"
				+ "</head>\r\n"
				+ "<body>\r\n"
				+ "    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
				+ "        <tr>\r\n"
				+ "            <td align=\"center\">\r\n"
				+ "                <table width=\"600\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
				+ "                    <tr>\r\n"
				+ "                        <td style=\"background-color: #f0f0f0; padding: 10px;\r\n"
				+ "           border-bottom: 1px solid #ccc;\r\n"
				+ "          border-top-left-radius: 5px;\r\n"
				+ "         border-top-right-radius: 5px;\">\r\n"
				+ "                            <h1>OTP Verification</h1>\r\n"
				+ "                        </td>            \r\n"
				+ "                    </tr>\r\n"
				+ "                  <tr>\r\n"
				+ "                    <td style=\"color: #db8319;\">\r\n"
				+ "                     <h1>Bangalore Refinery Pvt Ltd</h1>\r\n"
				+ "                    </td>\r\n"
				+ "                  </tr>\r\n"
				+ "                        <td style=\"padding: 20;\">\r\n"
				+ "                            <p>Dear User,</p>\r\n"
				+ "                            <p></p>\r\n"
				+ "                            <p>Your OTP for verification is: <strong>123456</strong></p>\r\n"
				+ "                            <p>Please enter this OTP on the GST Login page.</p>\r\n"
				+ "                        </td>\r\n"
				+ "                    </r>\r\n"
				+ "                    <tr>\r\n"
				+ "                        <td bgcolor=\"#f4f4f4\" style=\"padding: 20px; text-align: center;\">\r\n"
				+ "                            <p style=\"color: #333333;\">This email is generated for OTP verification purposes. Do not share your OTP with anyone.</p>\r\n"
				+ "                        </td>\r\n"
				+ "                    </tr>\r\n"
				+ "                    <tr>\r\n"
				+ "                        <td bgcolor=\"#f4f4f4\" style=\"padding: 20px; text-align: center;\">\r\n"
				+ "                            <p style=\"color: #ff0000; font-weight: bold;\">Important: Do not share your OTP with anyone.</p>\r\n"
				+ "                        </td>\r\n"
				+ "                    </tr>\r\n"
				+ "                </table>\r\n"
				+ "            </td>\r\n"
				+ "        </tr>\r\n"
				+ "    </table>\r\n"
				+ "</body>\r\n"
				+ "</html>\r\n"
				+ "";
		return msg;
	}

	public static void sendResetpasswordEmail(String email, String url) throws Exception {
		String sub = "Password Reset Request for Your Email Account";
		BrMessageImpl emailmail = EmailService.getMessageFrom("prashant", email);
		emailmail.setSubjects(sub);
		emailmail.setMessage(getResetPasswordMsg(url, email));
		emailmail.send();
	}
	
	public static void sendGSTLoginOtpEmail(String email, String otp) throws Exception {
		String sub = "Login verification OTP";
		BrMessageImpl emailmail = EmailService.getMessageFrom("prashant", email);
		emailmail.setSubjects(sub);
		emailmail.setMessage(getGSTLoginOtpMsg(otp));
		emailmail.send();
	}
	
	public static void sendEmailForHelQurey(String qurey1, String qurey2) throws Exception {
		String sub = "Help Enqurey for : ";
		BrMessageImpl emailmail = EmailService.getMessageFrom("prashant", "enquiry@bangalorerefinery.com");
		emailmail.setSubjects(sub+qurey1);
		emailmail.setMessage(qurey2);
		emailmail.send();
		
		
	}
	
	
	
}
