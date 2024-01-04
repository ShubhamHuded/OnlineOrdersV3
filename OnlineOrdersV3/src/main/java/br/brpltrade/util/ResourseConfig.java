package br.brpltrade.util;

import java.util.Properties;

import br.base.ServerProperties;

public class ResourseConfig {

	private static String resource;
	private static String resourceForSms;
	private static Properties resourcePermision;
	private static String documnetUploadPath;
	private static String urlPath;

	static {
		resource = "D:\\\\Brhome\\Resource\\OnlineTrading.res";
		if (resourcePermision == null)
			resourcePermision = ServerProperties.importResource(resource);
		documnetUploadPath = resourcePermision.getProperty("doucumnetUploadPath");
		urlPath = resourcePermision.getProperty("urlPath");

	}

	public static String getDocumentPath() {
		return ResourseConfig.documnetUploadPath;
	}

	public static String getUrlPath() {
		return ResourseConfig.urlPath;
	}

}
