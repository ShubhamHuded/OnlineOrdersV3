package br.brpltrade.service;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import br.brpltrade.jpa.entity.SubUser;
import br.brpltrade.jpa.entity.SubUserLine;
import br.brpltrade.repository.SubUserRepository;
import br.brpltrade.repository.SubUserTableRepository;
import maipl.db.RDBHelper;
import maipl.util.Resource;

import java.util.logging.Logger;

@Service
public class TradeControlService {

	Logger logger = Logger.getLogger(TradeControlService.class.getName());

	@Autowired
	HomeService mainService;

	@Autowired
	SubUserRepository srepo;

	@Autowired
	SubUserTableRepository tableRepo;

	/**
	 * use this method when SubUser is logedin..
	 * 
	 * @return
	 */
	public String getTraderId() {
		return (String) getUser().getPartyRegistry().getUserEmailId();
	}

	public boolean isTradingEnabledOnCommid(String traderID, String subUser, String commid) throws Exception {
		JSONObject obj = RDBHelper.isTradingEnabled(traderID, subUser, commid);
		String suv = obj.get("Status").toString();
		if (suv.equals("SUCESS"))
			return true;
		return false;
	}

	public boolean isTradingEnabled() {
		SubUser<String> sub = getUser();
		return sub.isTradingEnabeld();
	}

	public boolean isTradingEnabledOnCommidForUser(String commid) {
		SubUserLine<Integer> subLine = tableRepo.findByCurrencyAndSubUser(commid, getUser());
		if (subLine != null)
			return true;
		return false;
	}

	public String getSubUserEmail() {
		return getUser().getUserEmailId();
	}

	public SubUser<String> getUser() {
		Authentication auth = mainService.getAuthentication();
		String email = auth.getName();
		SubUser<String> sub = srepo.getReferenceById(email);
		return sub;
	}

	public boolean isRightTimeToTrade() throws Exception {
		JSONObject canTrade = RDBHelper.canTradeNow();
		String canTradeStatus = canTrade.getString(Resource.STATUS);
		if (canTradeStatus.equalsIgnoreCase(Resource.FAILS))
			return false;
		else
			return true;
	}

	public String msgWhyNotRightTimeToTrade() throws Exception {
		JSONObject canTrade = RDBHelper.canTradeNow();
		String canTradeStatus = canTrade.getString(Resource.STATUS);
		if (canTradeStatus.equalsIgnoreCase(Resource.FAILS))
			return canTrade.getString(Resource.MSG);
		return null;
	}

	private boolean isMergerd() {
		SubUser<String> user = getUser();
		if (user.getIs_merged() == 0)
			return false;
		return true;
	}

	public String mandatoryCheckBeforePlacingOrder(String commid) throws Exception {
		boolean fourth = isRightTimeToTrade();

		if (!fourth) {
			logger.info("Not right time to trade");
			return msgWhyNotRightTimeToTrade();
		}
		logger.info("It's right time to Trade");
		
		boolean first = isTradingEnabledOnCommid("", "", commid);
		if (!first) {
			logger.info("Trading Not Enabled On this Commid");
			return "Placing orders on " + commid + "Not allowed Right now";
		}
		logger.info("Trading Enabled On this Commid");
		
		boolean second = isTradingEnabled();
		if (!second) {
			logger.info("Trading Not Enabled For Trader");
			return "Permission Denied";
		}
		logger.info("Trading  Enabled For Trader");
		
		if(commid.equalsIgnoreCase("GOLD"))
			commid = "GLD";
		boolean third = isTradingEnabledOnCommidForUser(commid);
		if (!third) {
			logger.info("Subuser is not allowed to Trade");
			return "Permission Denied  to Place order on " + commid;
		}
		logger.info("Subuser is allowed to Trade");
		
		boolean fifth = isMergerd();
		if (!fifth) {
			logger.info("Subuser approval is pending");
			return "Still No approved by Banglore Refinery";
		}
		logger.info("Subuser is approved");
		
		logger.info("All mandatory check is done...");
		return null;
	}

}
