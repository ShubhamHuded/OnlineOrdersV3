package br.brpltrade.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import br.brpltrade.DataMapper.BPCollabrationDTO;
import maipl.db.AccessDb;

public class BPCollabrationLogin {

	private static Connection con = null;

	public static void createConnectionForUserDB() throws SQLException {
		AccessDb.updateConnection("usersecuritydb");
		System.out.println("trying to connect for databse to get bp collab login deatils : usersecuritydb");
		con = AccessDb.getConnection();

	}

	public static BPCollabrationDTO getBPCollbartionData(String userEmail) throws SQLException {
		createConnectionForUserDB();
		Statement stmt = con.createStatement();
		String sql = "SELECT * FROM usersecuritydb.udb_bp_collabration_details where user_email= '" + userEmail + "'";
		System.out.println(sql);
		ResultSet rs = stmt.executeQuery(sql);
		List<BPCollabrationDTO> resultList = new ArrayList<BPCollabrationDTO>();
		while (rs.next()) {
			// Assuming you have a column named "column_name" in your query
			BPCollabrationDTO bpCollabDto = new BPCollabrationDTO();

			bpCollabDto.setUser_email(rs.getString("user_email"));
			System.out.println(bpCollabDto.getUser_email());
			bpCollabDto.setUser_password(rs.getString("user_password"));
			System.out.println(bpCollabDto.getUser_password());
			bpCollabDto.setUser_type(rs.getString("user_type"));
			System.out.println(bpCollabDto.getUser_type());
			resultList.add(bpCollabDto);
		}
		if (resultList.size() >= 1)
			return resultList.get(0);
		return null;

	}

	public static boolean isBPcollbrator(String userEmail) throws SQLException {
		BPCollabrationDTO bpCollabDTO = getBPCollbartionData(userEmail);
		if (bpCollabDTO != null && bpCollabDTO.getUser_type() != null)
			return bpCollabDTO.getUser_type().equals("API User");
		return false;

	}

	public static BPCollabrationDTO getBPCollabrationDTO(String userEmail) throws SQLException {

		return getBPCollbartionData(userEmail);

	}

}
