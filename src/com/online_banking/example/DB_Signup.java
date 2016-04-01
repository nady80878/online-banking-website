package com.online_banking.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DB_Signup {

	private Connection conn;

	public DB_Signup() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			this.conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/bnk", "root", "");
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println(e);
		}
	}

	public void updateDatabase(String f_name, String l_name,
			String username, String email, String password, String national_id,
			String card_number, String zip_code, double balance,
			String address, String telephone, String fax){

		try {
			String sql = "INSERT INTO `users`(`f_name`, `l_name`, `username`, `email`, `password`, `national_id`, `card_number`, `zip_code`, `address`, `balance`, `telephone`, `fax`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement st = this.conn.prepareStatement(sql);
			st.setString(1, f_name);
			st.setString(2, l_name);
			st.setString(3, username);
			st.setString(4, email);
			st.setString(5, password);
			st.setString(6, national_id);
			st.setString(7, card_number);
			st.setString(8, zip_code);
			st.setString(9, address);
			st.setDouble(10, balance);
			st.setString(11, telephone);
			st.setString(12, fax);
			st.executeUpdate();
		} catch (SQLException ex) {
			System.out.println(ex);
		}
	}
}
