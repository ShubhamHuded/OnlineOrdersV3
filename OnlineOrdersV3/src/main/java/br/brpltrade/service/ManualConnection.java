package br.brpltrade.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import br.brpltrade.DataMapper.ApiOrderDetailDTO;
import maipl.db.AccessDb;

public class ManualConnection {

	private static Connection con = null;

	public static void createConnectionForRateEngineDB() throws SQLException {
		AccessDb.updateConnection("rateenginedb");
		System.out.println("trying to connect for databse : rateenginedb");
		con = AccessDb.getConnection();

	}

//AND oid.order_status = '" + status + "'
	public static List<ApiOrderDetailDTO> getApiOrderListForUserEmail(String userEmail) throws SQLException {
		createConnectionForRateEngineDB();
		Statement stmt = con.createStatement();
		String sql = "SELECT oid.commodity_code,oid.ebiz_id,oid.internal_id,oid.margin_used,oid.order_id,oid.quantity,oid.user_email,oid.type,oid.rate,oid.order_status,oid.timestamp FROM rateenginedb.rdb_order_acceptence oid JOIN usersecuritydb.udb_bp_collabration_details bpc ON oid.user_email = bpc.user_email WHERE bpc.user_email = '"
				+ userEmail + "'";
		ResultSet rs = stmt.executeQuery(sql);
		List<ApiOrderDetailDTO> resultList = new ArrayList<ApiOrderDetailDTO>();
		while (rs.next()) {
			// Assuming you have a column named "column_name" in your query
			ApiOrderDetailDTO ordersDto = new ApiOrderDetailDTO();
			ordersDto.setCommodityCode(rs.getString("commodity_code"));
			ordersDto.setEbizId(rs.getString("ebiz_id"));
			ordersDto.setInternalid(rs.getString("internal_id"));
			ordersDto.setMarginUsed(rs.getDouble("margin_used"));
			ordersDto.setOrderId(rs.getString("order_id"));
			ordersDto.setQuantity(rs.getDouble("quantity"));
			ordersDto.setRate(rs.getDouble("rate"));
			ordersDto.setType(rs.getString("type"));
			ordersDto.setOrderStatus(rs.getString("order_status"));
			ordersDto.setTimeStamp(rs.getString("timestamp"));
			resultList.add(ordersDto);
		}

		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return resultList;

	}

}
